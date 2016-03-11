//
//  NGDMInteractive.swift
//  NextGen
//
//  Created by Alec Ananian on 3/11/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMInteractive {
    
    private static var _objectMap = [String: NGDMInteractive]()
    private var _manifestObject: NGEInventoryInteractiveType!
    
    var id: String {
        get {
            return _manifestObject.InteractiveTrackID!
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
    
    init(manifestObject: NGEInventoryInteractiveType) {
        _manifestObject = manifestObject
    }
    
    static func getById(id: String) -> NGDMInteractive? {
        if _objectMap.count == 0 {
            if let objList = NextGenDataManager.sharedInstance.manifest.Inventory.InteractiveList {
                for obj in objList {
                    _objectMap[obj.InteractiveTrackID!] = NGDMInteractive(manifestObject: obj)
                }
            }
        }
        
        return _objectMap[id]
    }
    
}