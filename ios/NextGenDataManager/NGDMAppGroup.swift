//
//  NGDMAppGroup.swift
//  NextGen
//
//  Created by Alec Ananian on 3/11/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMAppGroup {
    
    private static var _objectMap = [String: NGDMAppGroup]()
    private var _manifestObject: NGEAppGroupType!
    
    var id: String {
        get {
            return _manifestObject.AppGroupID
        }
    }
    
    var url: NSURL? {
        get {
            if let interactiveTrackReference = _manifestObject.InteractiveTrackReferenceList.first, interactive = NGDMInteractive.getById(interactiveTrackReference.InteractiveTrackID) {
                return interactive.url
            }
            
            return nil
        }
    }
    
    init(manifestObject: NGEAppGroupType) {
        _manifestObject = manifestObject
    }
    
    func isHTML5() -> Bool {
        if let interactiveTrackReference = _manifestObject.InteractiveTrackReferenceList.first, compatibility = interactiveTrackReference.CompatibilityList.first {
            return compatibility == "HTML5"
        }
        
        return false
    }
    
    static func getById(id: String) -> NGDMAppGroup? {
        if _objectMap.count == 0 {
            if let objList = NextGenDataManager.sharedInstance.manifest.AppGroups?.AppGroupList {
                for obj in objList {
                    _objectMap[obj.AppGroupID] = NGDMAppGroup(manifestObject: obj)
                }
            }
        }
        
        return _objectMap[id]
    }
    
}