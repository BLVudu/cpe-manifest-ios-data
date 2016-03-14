//
//  NGDMExperienceApp.swift
//  NextGen
//
//  Created by Alec Ananian on 3/11/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEExperienceAppType` Manifest object
class NGDMExperienceApp {
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEExperienceAppType!
    
    /// Metadata associated with this ExperienceApp
    private var _metadata: NGDMMetadata!
    var metadata: NGDMMetadata? {
        get {
            if _metadata == nil {
                _metadata = NGDMMetadata.getById(_manifestObject.ContentID!)
            }
            
            return _metadata
        }
    }
    
    /// Image URL to be used for display
    var imageURL: NSURL? {
        get {
            return metadata?.imageURL
        }
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
    
}