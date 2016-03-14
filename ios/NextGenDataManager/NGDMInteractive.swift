//
//  NGDMInteractive.swift
//  NextGen
//
//  Created by Alec Ananian on 3/11/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEInventoryInteractiveType` Manifest object
class NGDMInteractive {
    
    // MARK: Static Variables
    /// Static mapping of all Interactives - InteractiveTrackID: Interactive
    private static var _objectMap = [String: NGDMInteractive]()
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEInventoryInteractiveType!
    
    /// Unique identifier
    var id: String {
        get {
            return _manifestObject.InteractiveTrackID!
        }
    }
    
    /// URL associated with this Interactive
    var url: NSURL? {
        get {
            if let containerReference = _manifestObject.ContainerReference, containerLocation = containerReference.ContainerLocation {
                return NSURL(string: containerLocation)
            }
            
            return nil
        }
    }
    
    // MARK: Initialization
    /**
        Initializes a new Interactive
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEInventoryInteractiveType) {
        _manifestObject = manifestObject
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMInteractive` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
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