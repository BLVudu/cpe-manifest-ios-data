//
//  NGDMAppGroup.swift
//  NextGen
//
//  Created by Alec Ananian on 3/11/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEAppGroupType` Manifest object
class NGDMAppGroup {
    
    // MARK: Static Variables
    /// Static mapping of all AppGroups - AppGroupID: AppGroup
    private static var _objectMap = [String: NGDMAppGroup]()
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEAppGroupType!
    
    /// Unique identifier
    var id: String {
        get {
            return _manifestObject.AppGroupID
        }
    }
    
    /// URL associated with this AppGroup
    var url: NSURL? {
        get {
            if let interactiveTrackReference = _manifestObject.InteractiveTrackReferenceList.first, interactive = NGDMInteractive.getById(interactiveTrackReference.InteractiveTrackID) {
                return interactive.url
            }
            
            return nil
        }
    }
    
    // MARK: Initialization
    /**
        Initializes a new AppGroup
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEAppGroupType) {
        _manifestObject = manifestObject
    }
    
    // MARK: Helper Methods
    /**
        Check if this is an HTML5 app

        - Returns: `true` if this is an HTML5 app
    */
    func isHTML5() -> Bool {
        if let interactiveTrackReference = _manifestObject.InteractiveTrackReferenceList.first, compatibility = interactiveTrackReference.CompatibilityList.first {
            return compatibility == "HTML5"
        }
        
        return false
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMAppGroup` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
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