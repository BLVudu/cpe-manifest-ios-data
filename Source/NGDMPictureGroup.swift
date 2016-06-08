//
//  NGDMPictureGroup.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEPictureGroupType` Manifest object
class NGDMPictureGroup {
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// Pictures associated with this Gallery
    var pictures: [NGDMPicture]?
    
    // MARK: Initialization
    /**
        Initializes a new PictureGroup
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEPictureGroupType) {
        id = manifestObject.PictureGroupID ?? NSUUID().UUIDString
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMPictureGroup` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(id: String) -> NGDMPictureGroup? {
        return NGDMManifest.sharedInstance.pictureGroups[id]
    }
    
}