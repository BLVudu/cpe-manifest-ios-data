//
//  NGDMAppGroup.swift
//  NextGen
//
//  Created by Alec Ananian on 3/11/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEAppGroupType` Manifest object
class NGDMAppGroup {
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// URL associated with this AppGroup
    var url: NSURL?
    
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
            
            if let compatibility = interactiveTrackReference.CompatibilityList?.first {
                isHTML5 = compatibility == "HTML5"
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
    static func getById(id: String) -> NGDMAppGroup? {
        return NGDMManifest.sharedInstance.appGroups[id]
    }
    
}