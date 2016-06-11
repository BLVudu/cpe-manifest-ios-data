//
//  NGDMGallery.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEGalleryType` Manifest object
public class NGDMGallery {
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// Metadata
    private var _metadata: NGDMMetadata?
    private var _galleryName: String?
    var title: String? {
        return _galleryName ?? _metadata?.title
    }
    
    public var description: String? {
        return _metadata?.description ?? _metadata?.title
    }
    
    var imageURL: NSURL?
    
    /// Pictures associated with this Gallery
    public var pictures: [NGDMPicture]?
    
    // MARK: Initialization
    /**
        Initializes a new Gallery
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEGalleryType) {
        id = manifestObject.GalleryID ?? NSUUID().UUIDString
        
        if let id = manifestObject.ContentID {
            _metadata = NGDMMetadata.getById(id)
        }
        
        if let id = manifestObject.PictureGroupID {
            pictures = NGDMPictureGroup.getById(id)?.pictures
        }
        
        _galleryName = manifestObject.GalleryNameList?.first?.value
        imageURL = _metadata?.imageURL ?? pictures?.first?.thumbnailImageURL
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMGallery` object by unique identifier
     
        - Parameters:
            - id: Unique identifier to search for
     
        - Returns: Object associated with identifier if it exists
     */
    static func getById(id: String) -> NGDMGallery? {
        return NGDMManifest.sharedInstance.galleries[id]
    }
    
}