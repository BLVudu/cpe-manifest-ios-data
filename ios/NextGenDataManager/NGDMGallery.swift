//
//  NGDMGallery.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMGallery {
    
    private var _manifestObject: NGEGalleryType!
    
    private var _metadata: NGDMMetadata!
    var metadata: NGDMMetadata? {
        get {
            if _metadata == nil {
                _metadata = NGDMMetadata.getById(_manifestObject.ContentID!)
            }
            
            return _metadata
        }
    }
    
    var pictures: [NGDMPicture] {
        get {
            if let pictureGroup = NGDMPictureGroup.getById(_manifestObject.PictureGroupID) {
                return pictureGroup.pictures
            }
            
            return [NGDMPicture]()
        }
    }
    
    init(manifestObject: NGEGalleryType) {
        _manifestObject = manifestObject
    }
    
}