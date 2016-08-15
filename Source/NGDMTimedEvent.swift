//
//  NGDMTimedEvent.swift
//

import Foundation

public enum TimedEventType {
    case Any
    case AppData
    case AppGroup
    case AudioVisual
    case ClipShare
    case Gallery
    case Location
    case Product
    case Talent
    case TextItem
}

public func ==(lhs: NGDMTimedEvent, rhs: NGDMTimedEvent) -> Bool {
    return lhs.id == rhs.id
}

// Wrapper class for `NGETimedEventType` Manifest object
public class NGDMTimedEvent: Equatable {
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String = ""
    
    /// Position in full TimedEvent list
    public var sortedIndex: Int {
        if let index = NGDMManifest.sharedInstance.timedEvents.indexOf(self) {
            return Int(index)
        }
        
        return -1
    }
    
    /// Timecodes
    public var startTime: Double = -1
    public var endTime: Double = -1
    
    
    /// Text value associated with this TimedEvent if it exists
    public var descriptionText: String? {
        return gallery?.title ?? audioVisual?.metadata?.title ?? textItem ?? appData?.title
    }
    
    /// Image to be used for display
    private var _imageURL: NSURL?
    public var imageURL: NSURL? {
        return _imageURL ?? gallery?.imageURL ?? audioVisual?.imageURL ?? experienceApp?.imageURL
    }
    
    /// TimedEvent objects
    var textItem: String?
    public var experience: NGDMExperience?
    public var appGroup: NGDMAppGroup?
    public var gallery: NGDMGallery?
    public var audioVisual: NGDMAudioVisual?
    public var experienceApp: NGDMExperienceApp?
    var productNamespace: String?
    
    private var _talentId: String?
    public var talent: NGDMTalent? {
        if let id = _talentId {
            return NGDMManifest.sharedInstance.mainExperience?.talents?[id]
        }
        
        return nil
    }
    
    private var _appDataId: String?
    public var appData: NGDMAppData? {
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
        if let textGroupId = manifestObject.TextGroupIDList?.first, textGroupIndex = textGroupId.index, textGroup = NGDMTextGroup.getById(textGroupId.value!) {
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
        if let otherId = manifestObject.OtherID where otherId.Namespace == Namespaces.AppDataID {
            _appDataId = otherId.Identifier
        }
        
        id = audioVisual?.id ?? gallery?.id ?? appGroup?.id ?? appData?.id ?? NSUUID().UUIDString
    }
    
    // MARK: Helper Methods
    /**
        Check if TimedEvent is of the specified type
 
        - Parameters:
            - type: Type of TimedEvent
 
        - Returns: `true` if the TimedEvent is of the specified type
    */
    public func isType(type: TimedEventType) -> Bool {
        switch type {
        case .AppData:
            return appData != nil
            
        case .AppGroup:
            return appGroup != nil
            
        case .AudioVisual:
            return audioVisual != nil && !isType(.ClipShare)
            
        case .ClipShare:
            return experience != nil && experience!.isType(.ClipShare)
            
        case .Gallery:
            return gallery != nil
            
        case .Location:
            return appData?.location != nil
            
        case .Product:
            return productNamespace == Namespaces.TheTake
            
        case .Talent:
            return talent != nil
            
        case .TextItem:
            return textItem != nil
            
        case .Any:
            return true
        }
    }
    
    /**
        Returns the previous TimedEvent in the full sequence with the specified type
 
        - Parameters:
            - type: Type of TimedEvent
 
        - Returns: Previous TimedEvent, if it exists
    */
    public func previousTimedEventOfType(type: TimedEventType) -> NGDMTimedEvent? {
        let currentIndex = sortedIndex
        if currentIndex > 0 {
            for i in (0...currentIndex - 1).reverse() {
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
    public func nextTimedEventOfType(type: TimedEventType) -> NGDMTimedEvent? {
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
    
    public static func findByTimecode(timecode: Double, type: TimedEventType) -> [NGDMTimedEvent] {
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
        
        return timedEvents.sort({ (timedEvent1, timedEvent2) -> Bool in
            return (timedEvent1.experience?.sequenceNumber ?? 0) < (timedEvent2.experience?.sequenceNumber ?? 0)
        })
    }
    
}