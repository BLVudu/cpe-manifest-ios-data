//
//  NGDMImage.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMImage {
    
    private static var _objectMap = [String: NGDMImage]()
    private var _manifestObject: NGEInventoryImageType!
    
    var id: String {
        get {
            return _manifestObject.ImageID!
        }
    }
    
    private var _url: NSURL!
    var url: NSURL? {
        get {
            if _url == nil {
                if let containerLocation = _manifestObject.ContainerReference?.ContainerLocation {
                    _url = NSURL(string: containerLocation)!
                }
            }
            
            return _url
        }
    }
    
    init(manifestObject: NGEInventoryImageType) {
        _manifestObject = manifestObject
    }
    
    static func getById(id: String) -> NGDMImage? {
        if _objectMap.count == 0 {
            if let objList = NextGenDataManager.sharedInstance.manifest.Inventory.ImageList {
                for obj in objList {
                    _objectMap[obj.ImageID!] = NGDMImage(manifestObject: obj)
                }
            }
        }
        
        return _objectMap[id]
    }
    
}