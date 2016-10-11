//
//  NGDMExperience.swift
//

import Foundation

public enum ExperienceType {
    case app
    case audioVisual
    case clipShare
    case gallery
    case location
    case shopping
    case talentData
}

public func ==(lhs: NGDMExperience, rhs: NGDMExperience) -> Bool {
    return lhs.id == rhs.id
}

// Wrapper class for `NGEExperienceType` Manifest object
open class NGDMExperience: Equatable {
    
    // MARK: Instance Variables
    /// Appearance object for background images, buttons, etc
    var nodeStyles: [NGDMNodeStyle]?
    
    /// Unique identifier
    open var id: String
    
    /// Order within parent experience
    open var sequenceNumber = 0
    
    /// All children of this Experience
    fileprivate var _childExperiences: [NGDMExperience]?
    fileprivate var _childExperienceIds: [String]?
    open var childExperiences: [NGDMExperience]? {
        if _childExperiences == nil, let childExperienceIds = _childExperienceIds {
            _childExperiences = childExperienceIds.flatMap({ NGDMExperience.getById($0) })
        }
        
        _childExperienceIds = nil
        
        return _childExperiences
    }
    
    /// Child of this Experience that is a talent data Experience
    fileprivate var _childTalentDataExperience: NGDMExperience?
    open var childTalentDataExperience: NGDMExperience? {
        if _childTalentDataExperience == nil, let index = childExperiences?.index(where: { $0.isType(.talentData) }) {
            _childTalentDataExperience = childExperiences?[index]
        }
        
        return _childTalentDataExperience
    }
    
    /// Metadata associated with this Experience
    open var metadata: NGDMMetadata?
    
    /// Title to be used for display
    open var title: String {
        return metadata?.title ?? appData?.title ?? ""
    }
    
    /// Description to be used for display
    open var description: String {
        return metadata?.description ?? appData?.description ?? ""
    }
    
    /// Image URL to be used for thumbnail displays
    open var imageURL: URL? {
        if let imageURL = metadata?.imageURL {
            return imageURL as URL
        }
        
        // Break recursion if this is one of the main experiences
        if NGDMManifest.sharedInstance.mainExperience == self || NGDMManifest.sharedInstance.outOfMovieExperience == self || NGDMManifest.sharedInstance.inMovieExperience == self {
            return nil
        }
        
        if let imageURL = audioVisual?.imageURL {
            return imageURL as URL
        }
        
        if let imageURL = gallery?.imageURL {
            return imageURL as URL
        }
        
        if let imageURL = appData?.thumbnailImageURL {
            return imageURL as URL
        }
        
        if let imageURL = app?.imageURL {
            return imageURL as URL
        }
        
        return childExperiences?.first?.imageURL
    }
    
    /// AudioVisual associated with this Experience, if it exists
    open var audioVisual: NGDMAudioVisual?
    
    /// Presentation associated with this Experience's AudioVisual, if it exists
    var presentation: NGDMPresentation? {
        return audioVisual?.presentations?.last
    }
    
    /// Video URL to be used for video display, if it exists
    open var video: NGDMVideo? {
        return presentation?.video
    }
    
    open var videoURL: URL? {
        return video?.url
    }
    
    /// Video runtime length in seconds
    open var videoRuntime: TimeInterval {
        if let runtime = presentation?.video?.runtimeInSeconds {
            return runtime
        }
        
        return 0
    }
    
    /// Gallery associated with this Experience, if it exists
    open var gallery: NGDMGallery?
    
    /// App associated with this Experience, if it exists
    open var app: NGDMExperienceApp?
    
    /// AppData associated with this Experience, if it exists
    fileprivate var _appDataId: String?
    open var appData: NGDMAppData? {
        if let id = _appDataId {
            return NGDMManifest.sharedInstance.appData?[id]
        }
        
        return nil
    }
    
    open var appDataMediaCount: Int {
        return appData?.mediaCount ?? 0
    }
    
    // MARK: Initialization
    /**
        Initializes a new Experience
     
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEExperienceType) {
        id = manifestObject.ExperienceID ?? UUID().uuidString
        
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
        
        if let objList = manifestObject.ExperienceChildList , objList.count > 0 {
            var childMap = [Int: String]()
            for obj in objList {
                if let index = obj.SequenceInfo?.Number, let id = obj.ExperienceID {
                    childMap[index] = id
                }
            }
            
            // Sort the children by SequenceInfo.Number
            let sortedChildren = childMap.sorted { $0.0 < $1.0 }
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
    open func isType(_ type: ExperienceType) -> Bool {
        switch type {
        case .app:
            return app != nil
            
        case .audioVisual:
            return audioVisual != nil && !isType(.clipShare)
            
        case .clipShare:
            return id.contains("clipshare")
            
        case .gallery:
            return gallery != nil
            
        case .location:
            if appData?.location != nil {
                return true
            }
            
            if let firstChildExperience = childExperiences?.first {
                return firstChildExperience.isType(.location)
            }
            
            return false
            
        case .shopping:
            return app?.name == Namespaces.TheTake
            
        case .talentData:
            return id.contains("castcrew")
        }
    }
    
    /**
        Finds the Experience media associated with the AppData at the specified index
 
        - Parameters:
            - index: Media index to search
 
        - Returns: Associated Experience if it exists
    */
    open func appDataMediaAtIndex(_ index: Int) -> NGDMExperience? {
        return appData?.mediaAtIndex(index)
    }
    
    /**
        Finds the NodeStyle matching the current orientation and device
 
        - Parameters:
            - interfaceOrientation: Current device orientation
 
        - Returns: Current NodeStyle if it exists
    */
    open func getNodeStyle(_ interfaceOrientation: UIInterfaceOrientation) -> NGDMNodeStyle? {
        let isTablet = (UIDevice.current.userInterfaceIdiom == .pad)
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
    open static func getById(_ id: String) -> NGDMExperience? {
        return NGDMManifest.sharedInstance.experiences[id]
    }
    
}
