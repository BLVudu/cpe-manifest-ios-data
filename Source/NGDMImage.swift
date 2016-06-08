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
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// URL associated with this Image
    var url: NSURL?
    
    // MARK: Initialization
    /**
        Initializes a new Image
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEInventoryImageType) {
        id = manifestObject.ImageID ?? NSUUID().UUIDString
        
        if let containerLocation = manifestObject.ContainerReference?.ContainerLocationList?.first?.value  {
            if containerLocation.containsString("file://") {
                let tempURL = NSURL(fileURLWithPath: containerLocation.stringByReplacingOccurrencesOfString("file://", withString: ""))
                url = NSBundle.mainBundle().URLForResource(tempURL.URLByDeletingPathExtension!.path, withExtension: tempURL.pathExtension)
            } else {
                url = NSURL(string: containerLocation)
            }
        }
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMImage` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(id: String) -> NGDMImage? {
        return NGDMManifest.sharedInstance.images[id]
    }
    
}