//
//  NGDMPresentation.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEPresentationType` Manifest object
class NGDMPresentation {
    
    // MARK: Static Variables
    /// Static mapping of all Presentations - PresentationID: Presentation
    private static var _objectMap = [String: NGDMPresentation]()
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEPresentationType!
    
    /// Unique identifier
    var id: String {
        return _manifestObject.PresentationID
    }
    
    /// Video associated with this Presentation
    var video: NGDMVideo? {
        if let trackMetadata = _manifestObject.TrackMetadataList.first,
                videoTrackReference = trackMetadata.VideoTrackReferenceList?.first,
                videoTrackId = videoTrackReference.VideoTrackIDList?.first,
                video = NGDMVideo.getById(videoTrackId) {
            return video
        }
        
        return nil
    }
    
    /// Video URL to be used for display
    var videoURL: NSURL? {
        return video?.url
    }
    
    // MARK: Initialization
    /**
        Initializes a new Presentation
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEPresentationType) {
        _manifestObject = manifestObject
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMPresentation` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(id: String) -> NGDMPresentation? {
        if _objectMap.count == 0 {
            for obj in NextGenDataManager.sharedInstance.manifest.Presentations.PresentationList {
                _objectMap[obj.PresentationID] = NGDMPresentation(manifestObject: obj)
            }
        }
        
        return _objectMap[id]
    }
    
}