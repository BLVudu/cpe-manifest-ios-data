//
//  NGDMAppGroup.swift
//

import Foundation

// Wrapper class for `NGEAppGroupType` Manifest object
open class NGDMAppGroup {
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// URL associated with this AppGroup
    open var url: URL?
    
    /// Check if this is an HTML5 app
    var isHTML5 = false
    
    // MARK: Initialization
    /**
        Initializes a new AppGroup
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEAppGroupType) {
        id = manifestObject.AppGroupID
        
        if let interactiveTrackReference = manifestObject.InteractiveTrackReferenceList?.first {
            if let id = interactiveTrackReference.InteractiveTrackID {
                url = NGDMInteractive.getById(id)?.url
            }
            
            if let runtimeEnvironment = interactiveTrackReference.CompatibilityList?.first?.RuntimeEnvironment {
                isHTML5 = (runtimeEnvironment == "HTML5")
            }
        }
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMAppGroup` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(_ id: String) -> NGDMAppGroup? {
        return NGDMManifest.sharedInstance.appGroups[id]
    }
    
}
