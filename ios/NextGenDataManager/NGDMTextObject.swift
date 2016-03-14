//
//  NGDMTextObject.swift
//  NextGen
//
//  Created by Alec Ananian on 3/9/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEInventoryTextObjectType` Manifest object
class NGDMTextObject {
    
    // MARK: Static Variables
    /// Static mapping of all TextObjects - TextObjectID: TextObject
    private static var _objectMap = [String: NGDMTextObject]()
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEInventoryTextObjectType!
    
    /// Child TextStrings associated with this TextObject - Index: TextString value
    var textStrings = [Int: String]()
    
    /// Unique identifier
    var id: String {
        get {
            return _manifestObject.TextObjectID
        }
    }
    
    // MARK: Initialization
    /**
        Initializes a new TextObject
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEInventoryTextObjectType) {
        _manifestObject = manifestObject
    }

    // MARK: Helper Methods
    /**
        Find child TextString object by index

        - Parameters:
            - index: The index of the child TextString to look up

        - Returns: Value of the child TextString at the given `index` if it exists
    */
    func textItem(index: Int) -> String {
        if let textString = textStrings[index] {
            return textString
        }
        
        return ""
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMTextObject` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
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