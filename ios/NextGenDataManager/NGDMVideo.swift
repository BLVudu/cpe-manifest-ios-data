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
        return _manifestObject.VideoTrackID
    }
    
    /// URL associated with this Video
    private var _url: NSURL?
    var url: NSURL? {
        if _url == nil {
            if let containerLocation = _manifestObject.ContainerReference?.ContainerLocationList?.first?.value {
                if containerLocation.containsString("file://") {
                    let tempURL = NSURL(fileURLWithPath: containerLocation.stringByReplacingOccurrencesOfString("file://", withString: ""))
                    _url = NSBundle.mainBundle().URLForResource(tempURL.URLByDeletingPathExtension!.path, withExtension: tempURL.pathExtension)
                } else {
                    _url = NSURL(string: containerLocation)
                }
            }
        }
        
        return _url
    }
    
    /// Video length in seconds
    var runtimeInSeconds: NSTimeInterval {
        if let lengthString = _manifestObject.Encoding?.ActualLength {
            return lengthString.iso8601TimeInSeconds()
        }
        
        return 0
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