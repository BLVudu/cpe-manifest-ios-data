//
//  NGDMPicture.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEPictureType` Manifest object
class NGDMPicture {
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEPictureType!
    
    /// Image URL to be used for full display
    var imageURL: NSURL? {
        get {
            if let image = NGDMImage.getById(_manifestObject.ImageID) {
                return image.url
            }
            
            return nil
        }
    }
    
    /// Image URL to be used for thumbnail display
    var thumbnailImageURL: NSURL? {
        get {
            if let imageId = _manifestObject.ThumbnailImageID, image = NGDMImage.getById(imageId) {
                return image.url
            }
            
            return nil
        }
    }
    
    // MARK: Initialization
    /**
        Initializes a new Picture
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEPictureType) {
        _manifestObject = manifestObject
    }
    
}