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
    
    // MARK: Static Variables
    /// Static mapping of all PictureGroups - PictureGroupID: PictureGroup
    private static var _objectMap = [String: NGDMPicture]()
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEPictureType!
    
    /// Unique identifier
    var id: String {
        return _manifestObject.PictureID
    }
    
    /// Image URL to be used for full display
    var imageURL: NSURL? {
        if let image = NGDMImage.getById(_manifestObject.ImageID) {
            return image.url
        }
        
        return nil
    }
    
    /// Image URL to be used for thumbnail display
    var thumbnailImageURL: NSURL? {
        if let imageId = _manifestObject.ThumbnailImageID, image = NGDMImage.getById(imageId) {
            return image.url
        }
        
        return nil
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
    
    // MARK: Search Methods
    /**
        Find an `NGDMPicture` object by unique identifier
     
        - Parameters:
            - id: Unique identifier to search for
     
        - Returns: Object associated with identifier if it exists
     */
    static func getById(id: String) -> NGDMPicture? {
        if _objectMap.count == 0 {
            if let objList = NextGenDataManager.sharedInstance.manifest.PictureGroups?.PictureGroupList {
                for obj in objList {
                    if let childObjList = obj.PictureList {
                        for childObj in childObjList {
                            if let pictureId = childObj.PictureID {
                                _objectMap[pictureId] = NGDMPicture(manifestObject: childObj)
                            }
                        }
                    }
                }
            }
        }
        
        return _objectMap[id]
    }
    
}