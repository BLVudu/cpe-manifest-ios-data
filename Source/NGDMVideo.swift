//
//  NGDMVideo.swift
//

import Foundation

// Wrapper class for `NGEInventoryVideoType` Manifest object
class NGDMVideo {
    
    /// Unique identifier
    var id: String
    
    /// URL associated with this Video
    var url: URL?
    
    /// Video length in seconds
    var runtimeInSeconds: TimeInterval = 0
    
    // MARK: Initialization
    /**
        Initializes a new Video
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEInventoryVideoType) {
        id = manifestObject.VideoTrackID
        
        if let containerLocation = manifestObject.ContainerReference?.ContainerLocationList?.first?.value {
            if containerLocation.contains("file://") {
                let tempURL = URL(fileURLWithPath: containerLocation.replacingOccurrences(of: "file://", with: ""))
                url = Bundle.main.url(forResource: tempURL.deletingPathExtension().path, withExtension: tempURL.pathExtension)
            } else {
                url = URL(string: containerLocation)
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
    static func getById(_ id: String) -> NGDMVideo? {
        return NGDMManifest.sharedInstance.videos[id]
    }
    
}
