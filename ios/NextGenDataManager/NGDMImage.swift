//
//  NGDMImage.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEInventoryImageType` Manifest object
class NGDMImage {
    
    // MARK: Static Variables
    /// Static mapping of all Images - ImageID: Image
    private static var _objectMap = [String: NGDMImage]()
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEInventoryImageType!
    
    /// Unique identifier
    var id: String {
        return _manifestObject.ImageID!
    }
    
    /// URL associated with this Image
    private var _url: NSURL?
    var url: NSURL? {
        if _url == nil {
            if let containerLocation = _manifestObject.ContainerReference?.ContainerLocation {
                if containerLocation.containsString("file://") {
                    let tempURL = NSURL(fileURLWithPath: containerLocation.stringByReplacingOccurrencesOfString("file://", withString: ""))
                    _url = NSBundle.mainBundle().URLForResource(tempURL.URLByDeletingPathExtension!.path, withExtension: tempURL.pathExtension)
                }
                
                return NSURL(string: containerLocation)
            }
        }
        
        return _url
    }
    
    // MARK: Initialization
    /**
        Initializes a new Image
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEInventoryImageType) {
        _manifestObject = manifestObject
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMImage` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
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