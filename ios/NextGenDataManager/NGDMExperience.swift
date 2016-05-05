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
    
    /// Unique identifier
    var id: String {
        return _manifestObject.ExperienceID!
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
    
    /// Mapping of AudioVisuals in child Experiences - PresentationID: NGDMAudioVisual
    private var _childAudioVisuals: [String: NGDMAudioVisual]?
    var childAudioVisuals: [String: NGDMAudioVisual]? {
        if _childAudioVisuals == nil {
            _childAudioVisuals = [String: NGDMAudioVisual]()
            
            for experience in childExperiences {
                if let audioVisual = experience.audioVisual, presentation = audioVisual.presentation {
                    _childAudioVisuals![presentation.id] = audioVisual
                }
            }
        }
        
        return _childAudioVisuals
    }
    
    /// Mapping of Galleries in child Experiences - GalleryID: NGDMGallery
    private var _childGalleries: [String: NGDMGallery]?
    var childGalleries: [String: NGDMGallery]? {
        if _childGalleries == nil {
            _childGalleries = [String: NGDMGallery]()
            
            for experience in childExperiences {
                if let gallery = experience.imageGallery {
                    _childGalleries![gallery.id] = gallery
                }
            }
        }
        
        return _childGalleries
    }
    
    /// Mapping of Apps in child Experiences - AppGroupID: NGDMExperienceApp
    private var _childApps: [String: NGDMExperienceApp]?
    var childApps: [String: NGDMExperienceApp]? {
        if _childApps == nil {
            _childApps = [String: NGDMExperienceApp]()
            
            for experience in childExperiences {
                if let app = experience.app {
                    _childApps![app.id] = app
                }
            }
        }
        
        return _childApps
    }
    
    /// Metadata associated with this Experience
    private var _metadata: NGDMMetadata?
    var metadata: NGDMMetadata? {
        if let contentId = _manifestObject.ContentID where _metadata == nil {
            _metadata = NGDMMetadata.getById(contentId)
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
            return audioVisual?.imageURL
        }
        
        // Experience has a Gallery with an image associated with it
        if isGallery() {
            return imageGallery?.imageURL
        }
        
        // Experience has an App with an image associated with it
        if isApp() {
            return app?.imageURL
        }
        
        // Experience has a child Experience that should be used for the image
        if let childExperience = childExperiences.first {
            return childExperience.imageURL
        }
        
        return nil
    }
    
    /// AudioVisual associated with this Experience, if it exists
    private var _audioVisual: NGDMAudioVisual?
    var audioVisual: NGDMAudioVisual? {
        if let obj = _manifestObject.Audiovisual where _audioVisual == nil {
            _audioVisual = NGDMAudioVisual(manifestObject: obj)
        }
        
        return _audioVisual
    }
    
    /// Presentation associated with this Experience's AudioVisual, if it exists
    var presentation: NGDMPresentation? {
        return audioVisual?.presentation
    }
    
    /// Video URL to be used for video display, if it exists
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
    
    /// Gallery associated with this Experience, if it exists
    private var _imageGallery: NGDMGallery?
    var imageGallery: NGDMGallery? {
        if let obj = _manifestObject.Gallery where _imageGallery == nil {
            _imageGallery = NGDMGallery(manifestObject: obj)
        }
        
        return _imageGallery
    }
    
    /// App associated with this Experience, if it exists
    private var _app: NGDMExperienceApp?
    var app: NGDMExperienceApp? {
        if let obj = _manifestObject.App where _app == nil {
            _app = NGDMExperienceApp(manifestObject: obj)
        }
        
        return _app
    }
    
    /// TimedEventSequence associated with this Experience, if it exists
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
        return _manifestObject.Audiovisual != nil && !isClipAndShare()
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
        return _manifestObject.Gallery != nil
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
        return _manifestObject.App != nil
    }
    
    /**
        Check if this is a shopping-based Experience (e.g. with TheTake)
     
        - Returns: `true` if this is a shopping based Experience
     */
    func isShopping() -> Bool {
        return app?.id == kTheTakeIdentifierNamespace
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
                if let experienceID = obj.ExperienceID {
                    _objectMap[experienceID] = NGDMExperience(manifestObject: obj)
                }
            }
        }
        
        return _objectMap[id]
    }
    
}