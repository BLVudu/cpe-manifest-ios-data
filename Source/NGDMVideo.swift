//
//  NGDMVideo.swift
//

import Foundation

// Wrapper class for `NGEInventoryVideoType` Manifest object
class NGDMVideo {
    
    /// Unique identifier
    var id: String
    
    /// URL associated with this Video
    var url: NSURL?
    
    /// Video length in seconds
    var runtimeInSeconds: NSTimeInterval = 0
    
    // MARK: Initialization
    /**
        Initializes a new Video
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEInventoryVideoType) {
        id = manifestObject.VideoTrackID
        
        if let containerLocation = manifestObject.ContainerReference?.ContainerLocationList?.first?.value {
            if containerLocation.containsString("file://") {
                let tempURL = NSURL(fileURLWithPath: containerLocation.stringByReplacingOccurrencesOfString("file://", withString: ""))
                url = NSBundle.mainBundle().URLForResource(tempURL.URLByDeletingPathExtension!.path, withExtension: tempURL.pathExtension)
            } else {
                url = NSURL(string: containerLocation)
            }
        }
        
        runtimeInSeconds = manifestObject.Encoding?.ActualLength?.iso8601TimeInSeconds() ?? 0
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMVideo` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(id: String) -> NGDMVideo? {
        return NGDMManifest.sharedInstance.videos[id]
    }
    
}