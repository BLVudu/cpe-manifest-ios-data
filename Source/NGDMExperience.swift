//
//  NGDMExperience.swift
//

import Foundation

public enum ExperienceType {
    case App
    case AudioVisual
    case ClipShare
    case Gallery
    case Location
    case Shopping
    case TalentData
}

public func ==(lhs: NGDMExperience, rhs: NGDMExperience) -> Bool {
    return lhs.id == rhs.id
}

// Wrapper class for `NGEExperienceType` Manifest object
public class NGDMExperience: Equatable {
    
    // MARK: Instance Variables
    /// Appearance object for background images, buttons, etc
    var nodeStyles: [NGDMNodeStyle]?
    
    public var appearance: NGDMAppearance?
    
    /// Unique identifier
    public var id: String
    
    /// Order within parent experience
    public var sequenceNumber = 0
    
    /// All children of this Experience
    private var _childExperiences: [NGDMExperience]?
    private var _childExperienceIds: [String]?
    public var childExperiences: [NGDMExperience]? {
        if _childExperiences == nil, let childExperienceIds = _childExperienceIds {
            _childExperiences = childExperienceIds.flatMap({ NGDMExperience.getById($0) })
        }
        
        _childExperienceIds = nil
        
        return _childExperiences
    }
    
    /// Child of this Experience that is a talent data Experience
    private var _childTalentDataExperience: NGDMExperience?
    public var childTalentDataExperience: NGDMExperience? {
        if _childTalentDataExperience == nil, let index = childExperiences?.indexOf({ $0.isType(.TalentData) }) {
            _childTalentDataExperience = childExperiences?[index]
        }
        
        return _childTalentDataExperience
    }
    
    /// Metadata associated with this Experience
    public var metadata: NGDMMetadata?
    
    /// Title to be used for display
    public var title: String {
        return metadata?.title ?? appData?.title ?? ""
    }
    
    /// Description to be used for display
    public var description: String {
        return metadata?.description ?? appData?.description ?? ""
    }
    
    /// Image URL to be used for thumbnail displays
    public var imageURL: NSURL? {
        if let imageURL = metadata?.imageURL {
            return imageURL
        }
        
        // Break recursion if this is one of the main experiences
        if NGDMManifest.sharedInstance.mainExperience == self || NGDMManifest.sharedInstance.outOfMovieExperience == self || NGDMManifest.sharedInstance.inMovieExperience == self {
            return nil
        }
        
        if let imageURL = audioVisual?.imageURL {
            return imageURL
        }
        
        if let imageURL = gallery?.imageURL {
            return imageURL
        }
        
        if let imageURL = appData?.thumbnailImageURL {
            return imageURL
        }
        
        if let imageURL = app?.imageURL {
            return imageURL
        }
        
        return childExperiences?.first?.imageURL
    }
    
    /// AudioVisual associated with this Experience, if it exists
    public var audioVisual: NGDMAudioVisual?
    
    /// Presentation associated with this Experience's AudioVisual, if it exists
    var presentation: NGDMPresentation? {
        return audioVisual?.presentations?.last
    }
    
    /// Video URL to be used for video display, if it exists
    public var videoURL: NSURL? {
        return presentation?.videoURL
    }
    
    /// Video runtime length in seconds
    public var videoRuntime: NSTimeInterval {
        if let runtime = presentation?.video?.runtimeInSeconds {
            return runtime
        }
        
        return 0
    }
    
    /// Gallery associated with this Experience, if it exists
    public var gallery: NGDMGallery?
    
    /// App associated with this Experience, if it exists
    public var app: NGDMExperienceApp?
    
    /// AppData associated with this Experience, if it exists
    private var _appDataId: String?
    public var appData: NGDMAppData? {
        if let id = _appDataId {
            return NGDMManifest.sharedInstance.appData?[id]
        }
        
        return nil
    }
    
    public var appDataMediaCount: Int {
        return appData?.mediaCount ?? 0
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
    public func isType(type: ExperienceType) -> Bool {
        switch type {
        case .App:
            return app != nil
            
        case .AudioVisual:
            return audioVisual != nil && !isType(.ClipShare)
            
        case .ClipShare:
            return id.containsString("clipshare")
            
        case .Gallery:
            return gallery != nil
            
        case .Location:
            if appData?.location != nil {
                return true
            }
            
            if let firstChildExperience = childExperiences?.first {
                return firstChildExperience.isType(.Location)
            }
            
            return false
            
        case .Shopping:
            return app?.name == Namespaces.TheTake
            
        case .TalentData:
            return id.containsString("ecp_tab.4")
        }
    }
    
    /**
        Finds the Experience media associated with the AppData at the specified index
 
        - Parameters:
            - index: Media index to search
 
        - Returns: Associated Experience if it exists
    */
    public func appDataMediaAtIndex(index: Int) -> NGDMExperience? {
        return appData?.mediaAtIndex(index)
    }
    
    /**
        Finds the NodeStyle matching the current orientation and device
 
        - Parameters:
            - interfaceOrientation: Current device orientation
 
        - Returns: Current NodeStyle if it exists
    */
    public func getNodeStyle(interfaceOrientation: UIInterfaceOrientation) -> NGDMNodeStyle? {
        let isTablet = (UIDevice.currentDevice().userInterfaceIdiom == .Pad)
        let isLandscape = UIInterfaceOrientationIsLandscape(interfaceOrientation)
        
        if let nodeStyles = nodeStyles {
            for nodeStyle in nodeStyles {
                if (isTablet && nodeStyle.supportsTablet) || (!isTablet && nodeStyle.supportsPhone) {
                    if isLandscape && nodeStyle.supportsLandscape {
                        return nodeStyle
                    }
                    
                    if !isLandscape && nodeStyle.supportsPortrait {
                        return nodeStyle
                    }
                }
            }
        }
        
        return nil
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMExperience` object by unique identifier

        - Parameters:
            - id: Unique identifier to search for

        - Returns: Object associated with identifier if it exists
    */
    public static func getById(id: String) -> NGDMExperience? {
        return NGDMManifest.sharedInstance.experiences[id]
    }
    
}