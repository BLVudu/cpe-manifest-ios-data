//
//  NGDMExperienceApp.swift
//

import Foundation

// Wrapper class for `NGEExperienceAppType` Manifest object
public class NGDMExperienceApp {
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// Metadata associated with this ExperienceApp
    var metadata: NGDMMetadata?
    
    /// Title associated with this ExperienceApp
    public var title: String? {
        return metadata?.title ?? name
    }
    
    /// Name associated with this ExperienceApp
    var name: String?
    
    /// Image URL to be used for display
    var imageURL: NSURL? {
        return metadata?.imageURL
    }
    
    /// AppGroup associated with this ExperienceApp, if it exists
    var appGroup: NGDMAppGroup?
    
    /// URL to the AppGroup's HTML5 application, if it exists
    public var url: NSURL? {
        return appGroup?.url
    }
    
    // MARK: Initialization
    /**
        Initializes a new ExperienceApp
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEExperienceAppType) {
        id = manifestObject.AppID ?? manifestObject.AppGroupID ?? NSUUID().UUIDString
        
        if let id = manifestObject.ContentID {
            metadata = NGDMMetadata.getById(id)
        }
        
        name = manifestObject.AppNameList?.first?.value
        
        if let id = manifestObject.AppGroupID {
            appGroup = NGDMAppGroup.getById(id)
        }
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