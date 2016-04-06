//
//  NGDMTimedEvent.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGETimedEventType` Manifest object
class NGDMTimedEvent: NSObject {
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGETimedEventType!
    
    /// Unique identifier
    private var _id: String!
    var id: String {
        get {
            if _id == nil {
                if isAudioVisual() {
                    _id = _manifestObject.PresentationID
                } else if isGallery() {
                    _id = _manifestObject.GalleryID
                } else if isAppGroup() {
                    _id = _manifestObject.AppGroupID
                } else if isTextItem() {
                    _id = "\(_manifestObject.TextGroupID.value)\(_manifestObject.TextGroupID.index)"
                } else if isLocation() {
                    _id = _manifestObject.Location.Name
                } else {
                    _id = NSUUID().UUIDString
                }
            }
            
            return _id
        }
    }
    
    /// The TimedEvent's start time
    var startTime: Double {
        get {
            if let str = _manifestObject.StartTimecode.value {
                return Double(str)!
            }
            
            return -1
        }
    }
    
    /// The TimedEvent's end time
    var endTime: Double {
        get {
            if let str = _manifestObject.EndTimecode.value {
                return Double(str)!
            }
            
            return -1
        }
    }
    
    /// Text value associated with this TimedEvent if it exists
    var text: String? {
        get {
            if isTextItem() {
                if let textGroupId = _manifestObject.TextGroupID.value, textGroupIndex = _manifestObject.TextGroupID.index, textGroup = NGDMTextGroup.getById(textGroupId) {
                    return textGroup.textItem(textGroupIndex)
                }
            }
            
            if isLocation() {
                if let location = location {
                    return location.name
                }
            }
            
            return nil
        }
    }
    
    /// AppGroup associated with this TimedEvent if it exists
    var appGroup: NGDMAppGroup? {
        get {
            if isAppGroup() {
                return NGDMAppGroup.getById(_manifestObject.AppGroupID)
            }
            
            return nil
        }
    }
    
    /// Location associated with this TimedEvent if it exists
    private var _location: NGDMLocation!
    var location: NGDMLocation? {
        get {
            if _location == nil && isLocation() {
                _location = NGDMLocation(manifestObject: _manifestObject.Location)
            }
            
            return _location
        }
    }
    
    // MARK: Initialization
    /**
        Initializes a new NGETimedEventType
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGETimedEventType) {
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
        if let otherTimedEvent = object as? NGDMTimedEvent {
            return id == otherTimedEvent.id
        }
        
        return false
    }
    
    /**
        Check if this is a text-based TimedEvent (e.g. trivia)

        - Returns: `true` if this is a text-based TimedEvent
    */
    func isTextItem() -> Bool {
        return _manifestObject.TextGroupID != nil
    }
    
    /**
        Check if this is an AudioVisual-based TimedEvent (e.g. deleted scene)
     
        - Returns: `true` if this is an AudioVisual-based TimedEvent
     */
    func isAudioVisual() -> Bool {
        return _manifestObject.PresentationID != nil
    }
    
    /**
        Check if this is a Gallery-based TimedEvent (e.g. image gallery)
     
        - Returns: `true` if this is a Gallery-based TimedEvent
     */
    func isGallery() -> Bool {
        return _manifestObject.GalleryID != nil
    }
    
    /**
        Check if this is an AppGroup-based TimedEvent (e.g. external HTML5 app)
     
        - Returns: `true` if this is an AppGroup-based TimedEvent
     */
    func isAppGroup() -> Bool {
        return _manifestObject.AppGroupID != nil
    }
    
    /**
        Check if this is a Product-based TimedEvent (e.g. shop this scene with TheTake)
     
        - Returns: `true` if this is a Product-based TimedEvent
     */
    func isProduct() -> Bool {
        return _manifestObject.ProductID != nil
    }
    
    /**
        Check if this is a Product-based TimedEvent within the given namespace
     
        - Parameters:
            - namespace: The namespace in which to search for a product
     
        - Returns: `true` if this is a Product-based TimedEvent within the given `namespace`
     */
    func isProduct(namespace: String) -> Bool {
        if let productId = _manifestObject.ProductID {
            return productId.Namespace == namespace
        }
        
        return false
    }
    
    /**
        Check if this is a Location-based TimedEvent (e.g. scene location)

        - Returns: `true` if this is a Location-based TimedEvent
    */
    func isLocation() -> Bool {
        return _manifestObject.Location != nil
    }
    
    /**
        Find the AudioVisual associated with this TimedEvent for the given Experience
     
        - Parameters:
            - experience: The Experience in which to search for an AudioVisual associated with this TimedEvent
     
        - Returns: AudioVisual associated with this TimedEvent if it exists
     */
    func getAudioVisual(experience: NGDMExperience) -> NGDMAudioVisual? {
        if isAudioVisual() {
            return experience.audioVisuals[_manifestObject.PresentationID]
        }
        
        return nil
    }
    
    /**
        Find the Gallery associated with this TimedEvent for the given Experience
     
        - Parameters:
            - experience: The Experience in which to search for a Gallery associated with this TimedEvent
     
        - Returns: Gallery associated with this TimedEvent if it exists
     */
    func getGallery(experience: NGDMExperience) -> NGDMGallery? {
        if isGallery() {
            return experience.galleries[_manifestObject.GalleryID]
        }
        
        return nil
    }
    
    /**
        Find the ExperienceApp associated with this TimedEvent for the given Experience
     
        - Parameters:
            - experience: The Experience in which to search for an ExperienceApp associated with this TimedEvent
     
        - Returns: ExperienceApp associated with this TimedEvent if it exists
     */
    func getExperienceApp(experience: NGDMExperience) -> NGDMExperienceApp? {
        if isAppGroup() {
            return experience.apps[_manifestObject.AppGroupID]
        }
        
        return nil
    }
    
    /**
        Get the value of the description text or summary for this TimedEvent

        - Parameters:
            - experience: The parent Experience to be used for the description value if this TimedEvent is not text-based

        - Returns: The value of the TimedEvent's description text if it exists
    */
    func getDescriptionText(experience: NGDMExperience) -> String? {
        if isGallery() {
            return getGallery(experience)?.title
        }
        
        if isAudioVisual() {
            return getAudioVisual(experience)?.metadata?.title
        }
        
        if isTextItem() {
            return text
        }
        
        if isLocation() {
            return location?.name
        }
        
        return nil
    }
    
    /**
        Get the image URL associated with this TimedEvent
     
        - Parameters:
            - experience: The parent Experience to be used for the image URL lookup
     
        - Returns: The image URL associated with this TimedEvent
     */
    func getImageURL(experience: NGDMExperience) -> NSURL? {
        if isGallery() {
            return getGallery(experience)?.imageURL
        }
        
        if isAudioVisual() {
            return getAudioVisual(experience)?.imageURL
        }
        
        if isAppGroup() {
            return getExperienceApp(experience)?.imageURL
        }
        
        return nil
    }
    
    /**
        Check if this TimedEvent has an image associated with it
     
        - Parameters:
            - experience: The parent Experience to be used for the image lookup

        - Returns: `true` if this TimedEvent has an image associated with it
    */
    func hasImage(experience: NGDMExperience) -> Bool {
        return getImageURL(experience) != nil
    }
    
}