//
//  NGDMGallery.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEGalleryType` Manifest object
class NGDMGallery {
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEGalleryType!
    
    /// Metadata associated with this Gallery
    private var _metadata: NGDMMetadata!
    var metadata: NGDMMetadata? {
        get {
            if _metadata == nil {
                _metadata = NGDMMetadata.getById(_manifestObject.ContentID!)
            }
            
            return _metadata
        }
    }
    
    /// Pictures associated with this Gallery
    var pictures: [NGDMPicture] {
        get {
            if let pictureGroup = NGDMPictureGroup.getById(_manifestObject.PictureGroupID) {
                return pictureGroup.pictures
            }
            
            return [NGDMPicture]()
        }
    }
    
    // MARK: Initialization
    /**
        Initializes a new Gallery
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEGalleryType) {
        _manifestObject = manifestObject
    }
    
}