//
//  NGDMPictureGroup.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMPictureGroup {
    
    private static var _objectMap = [String: NGDMPictureGroup]()
    private var _manifestObject: NGEPictureGroupType!
    
    var id: String {
        get {
            return _manifestObject.PictureGroupID!
        }
    }
    
    var pictures: [NGDMPicture] {
        get {
            var pictureList = [NGDMPicture]()
            for manifestObject in _manifestObject.PictureList {
                pictureList.append(NGDMPicture(manifestObject: manifestObject))
            }
            
            return pictureList
        }
    }
    
    init(manifestObject: NGEPictureGroupType) {
        _manifestObject = manifestObject
    }
    
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