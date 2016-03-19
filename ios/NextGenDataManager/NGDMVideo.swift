//
//  NGDMVideo.swift
//  NextGen
//
//  Created by Alec Ananian on 3/9/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEInventoryVideoType` Manifest object
class NGDMVideo {
    
    // MARK: Static Variables
    /// Static mapping of all Videos - VideoTrackID: Video
    private static var _objectMap = [String: NGDMVideo]()
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEInventoryVideoType!
    
    /// Unique identifier
    var id: String {
        get {
            return _manifestObject.VideoTrackID
        }
    }
    
    /// URL associated with this Video
    var url: NSURL? {
        get {
            if let containerReference = _manifestObject.ContainerReference, containerLocation = containerReference.ContainerLocation {
                return NSURL(string: containerLocation)
            }
            
            return nil
        }
    }
    
    /// Video length in seconds
    var runtimeInSeconds: NSTimeInterval {
        get {
            if let lengthString = _manifestObject.Encoding?.ActualLength {
                return lengthString.iso8601TimeInSeconds()
            }
            
            return 0
        }
    }
    
    // MARK: Initialization
    /**
        Initializes a new Video
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEInventoryVideoType) {
        _manifestObject = manifestObject
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMVideo` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(id: String) -> NGDMVideo? {
        if _objectMap.count == 0 {
            if let objList = NextGenDataManager.sharedInstance.manifest.Inventory.VideoList {
                for obj in objList {
                    _objectMap[obj.VideoTrackID] = NGDMVideo(manifestObject: obj)
                }
            }
        }
        
        return _objectMap[id]
    }
    
}