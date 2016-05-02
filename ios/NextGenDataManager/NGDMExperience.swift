//
//  NGDMExperience.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEExperienceType` Manifest object
class NGDMExperience: NSObject {
    
    // MARK: Static Variables
    /// Static mapping of all Experiences - ExperienceID: Experience
    private static var _objectMap = [String: NGDMExperience]()
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEExperienceType!
    
    /// Appearance object for background images, buttons, etc
    var appearance: NGDMAppearance?
    
    /// Mapping of all the Galleries associated with this Experience - GalleryID: Gallery
    var galleries = [String: NGDMGallery]()
    /// Mapping of all the Apps associated with this Experience - AppID: App
    var apps = [String: NGDMExperienceApp]()
    
    /// Mapping of all the AudioVisuals associated with this Experience - PresentationID: AudioVisual
    private var _audioVisuals = [String: NGDMAudioVisual]()
    var audioVisuals: [String: NGDMAudioVisual] {
        if _audioVisuals.count == 0 {
            if let audioVisualList = _manifestObject.AudiovisualList {
                for audioVisualObj in audioVisualList {
                    _audioVisuals[audioVisualObj.PresentationID] = NGDMAudioVisual(manifestObject: audioVisualObj)
                }
            }
        }
        
        return _audioVisuals
    }
    
    /// Unique identifier
    var id: String {
        return _manifestObject.ExperienceID
    }
    
    /// All children of this Experience
    private var _children = [NGDMExperience]()
    var childExperiences: [NGDMExperience] {
        if _children.count == 0 {
            if let childList = _manifestObject.ExperienceChildList {
                var childMap = [Int: NGDMExperience]()
                for child in childList {
                    if let index = child.SequenceInfo?.Number, childExperience = NGDMExperience.getById(child.ExperienceID) {
                        childMap[index] = childExperience
                    }
                }
                
                // Sort the children by SequenceInfo.Number
                let sortedChildren = childMap.sort { $0.0 < $1.0 }
                _children = sortedChildren.map { return $0.1 }
            }
        }
        
        return _children
    }
    
    /// Child of this Experience that is a clip & share Experience
    var childClipAndShareExperience: NGDMExperience? {
        for experience in childExperiences {
            if experience.isClipAndShare() {
                return experience
            }
        }
        
        return nil
    }
    
    /// Metadata associated with this Experience
    private var _metadata: NGDMMetadata?
    var metadata: NGDMMetadata? {
        if _metadata == nil {
            _metadata = NGDMMetadata.getById(_manifestObject.ContentID)
        }
        
        return _metadata
    }
    
    /// Image URL to be used for thumbnail displays
    var imageURL: NSURL? {
        // Experience has an image directly associated with it
        if let imageURL = metadata?.imageURL {
            return imageURL
        }
        
        // Experience has an AudioVisual with an image associated with it
        if isAudioVisual() {
            if let audioVisualID = audioVisuals.keys.first, audioVisual = audioVisuals[audioVisualID] {
                return audioVisual.imageURL
            }
        }
        
        // Experience has a Gallery with an image associated with it
        if isGallery() {
            if let galleryID = galleries.keys.first, gallery = galleries[galleryID] {
                return gallery.imageURL
            }
        }
        
        // Experience has an App with an image associated with it
        if isApp() {
            if let appID = apps.keys.first, app = apps[appID] {
                return app.imageURL
            }
        }
        
        // Experience has a child Experience that should be used for the image
        if let childExperience = childExperiences.first {
            return childExperience.imageURL
        }
        
        return nil
    }
    
    /// AudioVisual associated with this Experience
    var presentation: NGDMPresentation? {
        if let audioVisual = _manifestObject.AudiovisualList?.first, presentation = NGDMPresentation.getById(audioVisual.PresentationID) {
            return presentation
        }
        
        return nil
    }
    
    /// Video URL to be used for video display
    var videoURL: NSURL? {
        return presentation?.videoURL
    }
    
    /// Video runtime length in seconds
    var videoRuntime: NSTimeInterval {
        if let runtime = presentation?.video?.runtimeInSeconds {
            return runtime
        }
        
        return 0
    }
    
    /// Gallery associated with this Experience
    private var _imageGallery: NGDMGallery?
    var imageGallery: NGDMGallery? {
        if _imageGallery == nil {
            if let manifestObject = _manifestObject.GalleryList?.first {
                _imageGallery = NGDMGallery(manifestObject: manifestObject)
            }
        }
        
        return _imageGallery
    }
    
    /// TimedEventSequence associated with this Experience
    var timedEventSequence: NGDMTimedEventSequence? {
        if let objList = _manifestObject.TimedSequenceIDList, objId = objList.first {
            return NGDMTimedEventSequence.getById(objId)
        }
        
        return nil
    }
    
    // MARK: Initialization
    /**
        Initializes a new Experience
     
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEExperienceType) {
        _manifestObject = manifestObject
    }
    
    // MARK: Helper Methods
    /**
        Overrides default equality check to compare unique identifiers
     
        - Parameters:
            - object: Another object of the same type
     
        - Returns: `true` if both objects have the same unique identifier
    */
    override func isEqual(object: AnyObject?) -> Bool {
        if let otherExperience = object as? NGDMExperience {
            return otherExperience.id == id
        }
        
        return false
    }
    
    /**
        Check if Experience is an AudioVisual type

        - Returns: `true` if Experience is an AudioVisual type
    */
    func isAudioVisual() -> Bool {
        return _manifestObject.AudiovisualList?.count > 0 && !isClipAndShare()
    }
    
    /**
        Check if Experience is for clip & share
 
        - Returns: `true` if Experience is for clip & share
    */
    func isClipAndShare() -> Bool {
        return id.containsString("clipshare")
    }
    
    /**
        Check if Experience is a Gallery type

        - Returns: `true` if Experience is a Gallery type
    */
    func isGallery() -> Bool {
        return _manifestObject.GalleryList?.count > 0
    }
    
    /**
        Check if Experience is a parent of child Gallery-type Experiences

        - Returns: `true` if Expreience is a parent of child Gallery-type Experiences
    */
    func isGalleryList() -> Bool {
        if let firstChildExperience = childExperiences.first {
            return firstChildExperience.isGallery()
        }
        
        return false
    }
    
    /**
        Check if Experience is an App type
 
        - Returns: `true` if Experience is an App type
    */
    func isApp() -> Bool {
        return _manifestObject.AppList?.count > 0
    }
    
    /**
        Check if this is a shopping-based Experience (e.g. with TheTake)
     
        - Returns: `true` if this is a shopping based Experience
     */
    func isShopping() -> Bool {
        return apps[kTheTakeIdentifierNamespace] != nil
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMExperience` object by unique identifier

        - Parameters:
            - id: Unique identifier to search for

        - Returns: Object associated with identifier if it exists
    */
    static func getById(id: String) -> NGDMExperience? {
        // Populate the `_objectMap` for easy hash table lookup for future requests
        if _objectMap.count == 0 {
            for obj in NextGenDataManager.sharedInstance.manifest.Experiences.ExperienceList {
                let experience = NGDMExperience(manifestObject: obj)
                _objectMap[obj.ExperienceID] = experience
                
                if let galleryList = obj.GalleryList {
                    for galleryObj in galleryList {
                        if let galleryId = galleryObj.GalleryID {
                            experience.galleries[galleryId] = NGDMGallery(manifestObject: galleryObj)
                        }
                    }
                }
                
                if let appList = obj.AppList {
                    for appObj in appList {
                        let appID = (appObj.AppGroupID != nil ? appObj.AppGroupID : appObj.Type)
                        experience.apps[appID] = NGDMExperienceApp(manifestObject: appObj)
                    }
                }
            }
        }
        
        return _objectMap[id]
    }
    
}