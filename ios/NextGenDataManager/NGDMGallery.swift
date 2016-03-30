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
    
    /// Title associated with this Gallery
    var title: String? {
        get {
            if let galleryName = _manifestObject.GalleryNameList?.first?.value {
                return galleryName
            }
            
            return metadata?.title
        }
    }
    
    /// Image URL to be used for display
    var imageURL: NSURL? {
        get {
            if let imageURL = metadata?.imageURL {
                return imageURL
            }
            
            if let picture = pictures.first {
                return picture.thumbnailImageURL
            }
            
            return nil
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