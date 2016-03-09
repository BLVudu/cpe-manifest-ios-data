//
//  NGDMTextGroup.swift
//  NextGen
//
//  Created by Alec Ananian on 3/9/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMTextGroup {
    
    private static var _objectMap = [String: NGDMTextGroup]()
    private var _manifestObject: NGETextGroupType!
    
    var id: String {
        get {
            return _manifestObject.TextGroupID
        }
    }
    
    init(manifestObject: NGETextGroupType) {
        _manifestObject = manifestObject
    }
    
    func textItem(index: Int) -> String {
        if let textObjectList = _manifestObject.TextObjectIDList, textObjectId = textObjectList.first, textObject = NGDMTextObject.getById(textObjectId) {
            return textObject.textItem(index)
        }
        
        return ""
    }
    
    static func getById(id: String) -> NGDMTextGroup? {
        if _objectMap.count == 0 {
            if let objList = NextGenDataManager.sharedInstance.manifest.TextGroups?.TextGroupList {
                for obj in objList {
                    _objectMap[obj.TextGroupID] = NGDMTextGroup(manifestObject: obj)
                }
            }
        }
        
        return _objectMap[id]
    }
    
}