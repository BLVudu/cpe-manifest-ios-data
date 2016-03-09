//
//  NGDMVideo.swift
//  NextGen
//
//  Created by Alec Ananian on 3/9/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMVideo {
    
    private static var _objectMap = [String: NGDMVideo]()
    private var _manifestObject: NGEInventoryVideoType!
    
    var id: String {
        get {
            return _manifestObject.VideoTrackID
        }
    }
    
    var url: NSURL? {
        get {
            if let containerReference = _manifestObject.ContainerReference, containerLocation = containerReference.ContainerLocation {
                return NSURL(string: containerLocation)
            }
            
            return nil
        }
    }
    
    init(manifestObject: NGEInventoryVideoType) {
        _manifestObject = manifestObject
    }
    
    static func getById(id: String) -> NGDMVideo? {
        if _objectMap.count == 0 {
            if let objList = NextGenDataManager.sharedInstance.manifest.Inventory.VideoList {
                for obj in objList {
                    _objectMap[obj.VideoTrackID] = NGDMVideo(manifestObject: obj)
                }
            }
        }
        
        return _objectMap[id]
    }
    
}