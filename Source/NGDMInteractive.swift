//
//  NGDMInteractive.swift
//  NextGen
//
//  Created by Alec Ananian on 3/11/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEInventoryInteractiveType` Manifest object
class NGDMInteractive {
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// URL associated with this Interactive
    var url: NSURL?
    
    // MARK: Initialization
    /**
        Initializes a new Interactive
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEInventoryInteractiveType) {
        id = manifestObject.InteractiveTrackID ?? NSUUID().UUIDString
        
        if let containerLocation = manifestObject.ContainerReference?.ContainerLocationList?.first?.value {
            url = NSURL(string: containerLocation)
        }
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMInteractive` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(id: String) -> NGDMInteractive? {
        return NGDMManifest.sharedInstance.interactives[id]
    }
    
}