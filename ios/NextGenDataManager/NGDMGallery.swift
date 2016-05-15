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
    
    // MARK: Static Variables
    /// Static mapping of all Experiences - ExperienceID: Experience
    private static var _objectMap = [String: NGDMGallery]()
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEGalleryType!
    
    /// Unique identifier
    var id: String {
        return _manifestObject.GalleryID!
    }
    
    /// Metadata associated with this Gallery
    var metadata: NGDMMetadata? {
        if let contentID = _manifestObject.ContentID {
            return NGDMMetadata.getById(contentID)
        }
        
        return nil
    }
    
    /// Title associated with this Gallery
    var title: String? {
        if let galleryName = _manifestObject.GalleryNameList?.first?.value {
            return galleryName
        }
        
        return metadata?.title
    }
    
    /// Image URL to be used for display
    var imageURL: NSURL? {
        if let imageURL = metadata?.imageURL {
            return imageURL
        }
        
        if let picture = pictures?.first {
            return picture.thumbnailImageURL
        }
        
        return nil
    }
    
    /// Pictures associated with this Gallery
    var pictures: [NGDMPicture]? {
        if let pictureGroup = NGDMPictureGroup.getById(_manifestObject.PictureGroupID) {
            return pictureGroup.pictures
        }
        
        return nil
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
    
    // MARK: Search Methods
    /**
        Add an `NGDMGallery` object to the object map

        - Parameters:
            - gallery: Gallery object to add
    */
    static func addObject(gallery: NGDMGallery) {
        _objectMap[gallery.id] = gallery
    }
    
    /**
        Find an `NGDMGallery` object by unique identifier
     
        - Parameters:
            - id: Unique identifier to search for
     
        - Returns: Object associated with identifier if it exists
     */
    static func getById(id: String) -> NGDMGallery? {
        return _objectMap[id]
    }
    
}