//
//  NGDMTimedEvent.swift
//

import Foundation

public enum TimedEventType {
    case any
    case appData
    case appGroup
    case audioVisual
    case clipShare
    case gallery
    case location
    case product
    case talent
    case textItem
}

public func ==(lhs: NGDMTimedEvent, rhs: NGDMTimedEvent) -> Bool {
    return lhs.id == rhs.id
}

// Wrapper class for `NGETimedEventType` Manifest object
open class NGDMTimedEvent: Equatable {
    
    // MARK: Instance Variables
    /// Unique identifier
    open var id: String = ""
    
    /// Position in full TimedEvent list
    open var sortedIndex: Int {
        if let index = NGDMManifest.sharedInstance.timedEvents.index(of: self) {
            return Int(index)
        }
        
        return -1
    }
    
    /// Timecodes
    open var startTime: Double = -1
    open var endTime: Double = -1
    
    
    /// Text value associated with this TimedEvent if it exists
    open var descriptionText: String? {
        return gallery?.title ?? audioVisual?.descriptionText ?? textItem ?? appData?.title
    }
    
    /// Image to be used for display
    fileprivate var _imageURL: URL?
    open var imageURL: URL? {
        return _imageURL ?? gallery?.imageURL ?? audioVisual?.imageURL ?? experienceApp?.imageURL
    }
    
    /// Video associated with this TimedEvent's AudioVisual/Presentation
    open var videoURL: URL? {
        return audioVisual?.presentations?.last?.videoURL
    }
    
    /// TimedEvent objects
    var textItem: String?
    open var experience: NGDMExperience?
    open var appGroup: NGDMAppGroup?
    open var gallery: NGDMGallery?
    open var audioVisual: NGDMAudioVisual?
    open var experienceApp: NGDMExperienceApp?
    var productNamespace: String?
    
    fileprivate var _talentId: String?
    open var talent: NGDMTalent? {
        if let id = _talentId {
            return NGDMManifest.sharedInstance.mainExperience?.talents?[id]
        }
        
        return nil
    }
    
    fileprivate var _appDataId: String?
    open var appData: NGDMAppData? {
        if let id = _appDataId {
            return NGDMManifest.sharedInstance.appData?[id]
        }
        
        return nil
    }
    
    // MARK: Initialization
    /**
        Initializes a new NGETimedEventType
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGETimedEventType) {
        // Timecodes
        if let str = manifestObject.StartTimecode.value {
            startTime = Double(str)!
        }
        
        if let str = manifestObject.EndTimecode.value {
            endTime = Double(str)!
        }
        
        // FIXME: Making assumption that PictureID is in the Initialization property
        if let id = manifestObject.Initialization {
            _imageURL = NGDMPicture.getById(id)?.imageURL
        }
        
        // TimedEvent objects
        if let textGroupId = manifestObject.TextGroupIDList?.first, let textGroupIndex = textGroupId.index, let textGroup = NGDMTextGroup.getById(textGroupId.value!) {
            textItem = textGroup.textItem(textGroupIndex)
        }
        
        if let id = manifestObject.AppGroupID {
            appGroup = NGDMAppGroup.getById(id)
        }
        
        if let id = manifestObject.GalleryID {
            gallery = NGDMGallery.getById(id)
        }
        
        if let id = manifestObject.PresentationID {
            audioVisual = NGDMAudioVisual.getById(id)
        }
        
        if let id = manifestObject.AppGroupID {
            experienceApp = NGDMExperienceApp.getById(id)
        }
        
        productNamespace = manifestObject.ProductID?.Namespace
        _talentId = manifestObject.OtherID?.Identifier
        if let otherId = manifestObject.OtherID, otherId.Namespace == Namespaces.AppDataID {
            _appDataId = otherId.Identifier
        }
        
        id = audioVisual?.id ?? gallery?.id ?? appGroup?.id ?? appData?.id ?? UUID().uuidString
    }
    
    // MARK: Helper Methods
    /**
        Check if TimedEvent is of the specified type
 
        - Parameters:
            - type: Type of TimedEvent
 
        - Returns: `true` if the TimedEvent is of the specified type
    */
    open func isType(_ type: TimedEventType) -> Bool {
        switch type {
        case .appData:
            return appData != nil
            
        case .appGroup:
            return appGroup != nil
            
        case .audioVisual:
            return audioVisual != nil && !isType(.clipShare)
            
        case .clipShare:
            return experience != nil && experience!.isType(.clipShare)
            
        case .gallery:
            return gallery != nil
            
        case .location:
            return appData?.location != nil
            
        case .product:
            return productNamespace == Namespaces.TheTake
            
        case .talent:
            return talent != nil
            
        case .textItem:
            return textItem != nil
            
        case .any:
            return true
        }
    }
    
    /**
        Returns the previous TimedEvent in the full sequence with the specified type
 
        - Parameters:
            - type: Type of TimedEvent
 
        - Returns: Previous TimedEvent, if it exists
    */
    open func previousTimedEventOfType(_ type: TimedEventType) -> NGDMTimedEvent? {
        let currentIndex = sortedIndex
        if currentIndex > 0 {
            for i in (0...currentIndex - 1).reversed() {
                let timedEvent = NGDMManifest.sharedInstance.timedEvents[i]
                if timedEvent.isType(type) {
                    return timedEvent
                }
            }
        }
        
        return nil
    }
    
    /**
        Returns the next TimedEvent in the full sequence with the specified type
     
        - Parameters:
            - type: Type of TimedEvent
     
        - Returns: Next TimedEvent, if it exists
     */
    open func nextTimedEventOfType(_ type: TimedEventType) -> NGDMTimedEvent? {
        let currentIndex = sortedIndex
        let lastIndex = NGDMManifest.sharedInstance.timedEvents.count - 1
        if currentIndex < lastIndex {
            for i in ((currentIndex + 1)...lastIndex) {
                let timedEvent = NGDMManifest.sharedInstance.timedEvents[i]
                if timedEvent.isType(type) {
                    return timedEvent
                }
            }
        }
        
        return nil
    }
    
    open static func findByTimecode(_ timecode: Double, type: TimedEventType) -> [NGDMTimedEvent] {
        var timedEvents = [NGDMTimedEvent]()
        for timedEvent in NGDMManifest.sharedInstance.timedEvents {
            if timedEvent.startTime <= timecode {
                if timedEvent.isType(type) && timedEvent.endTime >= timecode {
                    timedEvents.append(timedEvent)
                }
            } else {
                break
            }
        }
        
        return timedEvents.sorted(by: { (timedEvent1, timedEvent2) -> Bool in
            return (timedEvent1.experience?.sequenceNumber ?? 0) < (timedEvent2.experience?.sequenceNumber ?? 0)
        })
    }
    
}
