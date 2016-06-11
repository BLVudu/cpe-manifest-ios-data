//
//  NGDMExperience.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

enum ExperienceType {
    case AudioVisual
    case ClipAndShare
    case TalentData
    case Gallery
    case App
    case Shopping
    case Location
}

public func ==(lhs: NGDMExperience, rhs: NGDMExperience) -> Bool {
    return lhs.id == rhs.id
}

// Wrapper class for `NGEExperienceType` Manifest object
public class NGDMExperience: Equatable {
    
    // MARK: Instance Variables
    /// Appearance object for background images, buttons, etc
    var appearance: NGDMAppearance?
    
    /// Unique identifier
    public var id: String
    
    /// All children of this Experience
    private var _childExperiences: [NGDMExperience]?
    private var _childExperienceIds: [String]?
    var childExperiences: [NGDMExperience]? {
        if _childExperiences == nil, let childExperienceIds = _childExperienceIds {
            _childExperiences = childExperienceIds.flatMap({ NGDMExperience.getById($0) })
        }
        
        _childExperienceIds = nil
        
        return _childExperiences
    }
    
    /// Child of this Experience that is a clip & share Experience
    private var _childClipAndShareExperience: NGDMExperience?
    var childClipAndShareExperience: NGDMExperience? {
        if _childClipAndShareExperience == nil, let index = childExperiences?.indexOf({ $0.isType(.ClipAndShare) }) {
            _childClipAndShareExperience = childExperiences?[index]
        }
        
        return _childClipAndShareExperience
    }
    
    /// Child of this Experience that is a talent data Experience
    private var _childTalentDataExperience: NGDMExperience?
    var childTalentDataExperience: NGDMExperience? {
        if _childTalentDataExperience == nil, let index = childExperiences?.indexOf({ $0.isType(.TalentData) }) {
            _childTalentDataExperience = childExperiences?[index]
        }
        
        return _childTalentDataExperience
    }
    
    /// Metadata associated with this Experience
    var metadata: NGDMMetadata?
    
    /// Title to be used for display
    var title: String {
        return metadata?.title ?? ""
    }
    
    /// Image URL to be used for thumbnail displays
    var imageURL: NSURL? {
        if let imageURL = metadata?.imageURL {
            return imageURL
        }
        
        if let imageURL = audioVisual?.imageURL {
            return imageURL
        }
        
        if let imageURL = gallery?.imageURL {
            return imageURL
        }
        
        if let imageURL = appData?.locationImageURL {
            return imageURL
        }
        
        if let imageURL = app?.imageURL {
            return imageURL
        }
        
        return childExperiences?.first?.imageURL
    }
    
    /// AudioVisual associated with this Experience, if it exists
    var audioVisual: NGDMAudioVisual?
    
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
    var gallery: NGDMGallery?
    
    /// App associated with this Experience, if it exists
    var app: NGDMExperienceApp?
    
    /// AppData associated with this Experience, if it exists
    private var _appDataId: String?
    var appData: NGDMAppData? {
        if let id = _appDataId {
            return CurrentManifest.allAppData?[id]
        }
        
        return nil
    }
    
    /// TimedEventSequence associated with this Experience, if it exists
    private var _timedEventSequenceId: String?
    var timedEventSequence: NGDMTimedEventSequence? {
        if let id = _timedEventSequenceId {
            return NGDMTimedEventSequence.getById(id)
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
        id = manifestObject.ExperienceID ?? NSUUID().UUIDString
        
        if let id = manifestObject.ContentID {
            metadata = NGDMMetadata.getById(id)
        }
        
        if let id = manifestObject.TimedSequenceIDList?.first {
            _timedEventSequenceId = id
        }
        
        if let obj = manifestObject.Audiovisual {
            let audioVisual = NGDMAudioVisual(manifestObject: obj)
            self.audioVisual = audioVisual
            NGDMManifest.sharedInstance.audioVisuals[audioVisual.id] = audioVisual
        }
        
        if let obj = manifestObject.Gallery {
            let gallery = NGDMGallery(manifestObject: obj)
            self.gallery = gallery
            NGDMManifest.sharedInstance.galleries[gallery.id] = gallery
        }
        
        if let obj = manifestObject.App {
            let experienceApp = NGDMExperienceApp(manifestObject: obj)
            app = experienceApp
            _appDataId = experienceApp.id
            NGDMManifest.sharedInstance.experienceApps[experienceApp.id] = experienceApp
        }
        
        if let objList = manifestObject.ExperienceChildList where objList.count > 0 {
            var childMap = [Int: String]()
            for obj in objList {
                if let index = obj.SequenceInfo?.Number, id = obj.ExperienceID {
                    childMap[index] = id
                }
            }
            
            // Sort the children by SequenceInfo.Number
            let sortedChildren = childMap.sort { $0.0 < $1.0 }
            _childExperienceIds = sortedChildren.map({ return $0.1 })
        }
    }
    
    // MARK: Helper Methods
    /**
        Check if Experience is of the specified type
     
        - Parameters:
            - type: Type of Experience
     
            - Returns: `true` if the Experience is of the specified type
     */
    // FIXME: Hardcoded Experience ID strings are being used to identify Experience types
    func isType(type: ExperienceType) -> Bool {
        switch type {
        case .AudioVisual:
            return audioVisual != nil && !isType(.ClipAndShare)
            
        case .ClipAndShare:
            return id.containsString("clipshare")
            
        case .TalentData:
            return id.containsString("ecp_tab.4")
        
        case .Gallery:
            return gallery != nil
            
        case .App:
            return app != nil
            
        case .Shopping:
            return app?.name == Namespaces.TheTake
            
        case .Location:
            if appData?.location != nil {
                return true
            }
            
            if let firstChildExperience = childExperiences?.first {
                return firstChildExperience.isType(.Location)
            }
            
            return false
        }
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMExperience` object by unique identifier

        - Parameters:
            - id: Unique identifier to search for

        - Returns: Object associated with identifier if it exists
    */
    static func getById(id: String) -> NGDMExperience? {
        return NGDMManifest.sharedInstance.experiences[id]
    }
    
}