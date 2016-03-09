//
//  NGDMTextObject.swift
//  NextGen
//
//  Created by Alec Ananian on 3/9/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMTextObject {
    
    private static var _objectMap = [String: NGDMTextObject]()
    private var _manifestObject: NGEInventoryTextObjectType!
    
    var textStrings = [Int: String]()
    
    var id: String {
        get {
            return _manifestObject.TextObjectID
        }
    }
    
    init(manifestObject: NGEInventoryTextObjectType) {
        _manifestObject = manifestObject
    }
    
    func textItem(index: Int) -> String {
        if let textString = textStrings[index] {
            return textString
        }
        
        return ""
    }
    
    static func getById(id: String) -> NGDMTextObject? {
        if _objectMap.count == 0 {
            if let objList = NextGenDataManager.sharedInstance.manifest.Inventory.TextObjectList {
                for obj in objList {
                    let textObject = NGDMTextObject(manifestObject: obj)
                    _objectMap[obj.TextObjectID] = textObject
                    
                    for textStringObj in obj.TextStringList {
                        if let index = textStringObj.index, value = textStringObj.value {
                            textObject.textStrings[Int(index)] = value
                        }
                    }
                }
            }
        }
        
        return _objectMap[id]
    }
    
}