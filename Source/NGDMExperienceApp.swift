//
//  NGDMExperienceApp.swift
//

import Foundation

// Wrapper class for `NGEExperienceAppType` Manifest object
public class NGDMExperienceApp {
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEExperienceAppType!
    
    /// Unique identifier
    var id: String {
        return _manifestObject.AppID ?? _manifestObject.AppGroupID
    }
    
    /// Metadata associated with this ExperienceApp
    var metadata: NGDMMetadata? {
        if let contentID = _manifestObject.ContentID {
            return NGDMMetadata.getById(contentID)
        }
        
        return nil
    }
    
    /// Title associated with this ExperienceApp
    public var title: String? {
        return metadata?.title ?? name
    }
    
    /// Name associated with this ExperienceApp
    var name: String? {
        return _manifestObject.AppNameList?.first?.value
    }
    
    /// Image URL to be used for display
    var imageURL: NSURL? {
        return metadata?.imageURL
    }
    
    // MARK: Initialization
    /**
        Initializes a new ExperienceApp
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEExperienceAppType) {
        _manifestObject = manifestObject
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMExperienceApp` object by unique identifier
     
        - Parameters:
            - id: Unique identifier to search for
     
            - Returns: Object associated with identifier if it exists
     */
    static func getById(id: String) -> NGDMExperienceApp? {
        return NGDMManifest.sharedInstance.experienceApps[id]
    }
    
}