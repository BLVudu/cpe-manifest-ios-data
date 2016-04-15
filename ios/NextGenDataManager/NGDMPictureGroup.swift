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
    
    // MARK: Static Variables
    /// Static mapping of all PictureGroups - PictureGroupID: PictureGroup
    private static var _objectMap = [String: NGDMPictureGroup]()
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEPictureGroupType!
    
    /// Unique identifier
    var id: String {
        return _manifestObject.PictureGroupID!
    }
    
    /// Pictures associated with this Gallery
    var pictures: [NGDMPicture]? {
        let pictureListObjs = _manifestObject.PictureList
        if pictureListObjs.count > 0 {
            var pictureList = [NGDMPicture]()
            for manifestObject in pictureListObjs {
                pictureList.append(NGDMPicture(manifestObject: manifestObject))
            }
            
            return pictureList
        }
        
        return nil
    }
    
    // MARK: Initialization
    /**
        Initializes a new PictureGroup
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEPictureGroupType) {
        _manifestObject = manifestObject
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMPictureGroup` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(id: String) -> NGDMPictureGroup? {
        if _objectMap.count == 0 {
            if let objList = NextGenDataManager.sharedInstance.manifest.PictureGroups?.PictureGroupList {
                for obj in objList {
                    _objectMap[obj.PictureGroupID!] = NGDMPictureGroup(manifestObject: obj)
                }
            }
        }
        
        return _objectMap[id]
    }
    
}