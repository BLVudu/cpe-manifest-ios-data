//
//  NGDMTextGroup.swift
//  NextGen
//
//  Created by Alec Ananian on 3/9/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGETextGroupType` Manifest object
class NGDMTextGroup {
    
    // MARK: Static Variables
    /// Static mapping of all TextGroups - TextGroupID: TextGroup
    private static var _objectMap = [String: NGDMTextGroup]()
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGETextGroupType!
    
    /// Unique identifier
    var id: String {
        get {
            return _manifestObject.TextGroupID
        }
    }
    
    // MARK: Initialization
    /**
        Initializes a new TextGroup
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGETextGroupType) {
        _manifestObject = manifestObject
    }
    
    // MARK: Helper Methods
    /**
        Find child TextItem object by index
    
        - Parameters:
            - index: The index of the child TextString to look up
    
        - Returns: Value of the child TextString at the given `index` if it exists
    */
    func textItem(index: Int) -> String {
        if let textObjectList = _manifestObject.TextObjectIDList, textObjectId = textObjectList.first, textObject = NGDMTextObject.getById(textObjectId) {
            return textObject.textItem(index)
        }
        
        return ""
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMTextGroup` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
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