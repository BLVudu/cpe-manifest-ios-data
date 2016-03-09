//
//  NGDMPicture.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMPicture {
    
    private var _manifestObject: NGEPictureType!
    
    var imageURL: NSURL? {
        get {
            if let image = NGDMImage.getById(_manifestObject.ImageID) {
                return image.url
            }
            
            return nil
        }
    }
    
    var thumbnailImageURL: NSURL? {
        get {
            if let imageId = _manifestObject.ThumbnailImageID, image = NGDMImage.getById(imageId) {
                return image.url
            }
            
            return nil
        }
    }
    
    init(manifestObject: NGEPictureType) {
        _manifestObject = manifestObject
    }
    
}