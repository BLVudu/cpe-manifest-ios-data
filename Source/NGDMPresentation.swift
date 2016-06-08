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
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// Video associated with this Presentation
    var video: NGDMVideo?
    
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
        id = manifestObject.PresentationID
        
        if let id = manifestObject.TrackMetadataList.first?.VideoTrackReferenceList?.first?.VideoTrackIDList?.first {
            video = NGDMVideo.getById(id)
        }
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMPresentation` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(id: String) -> NGDMPresentation? {
        return NGDMManifest.sharedInstance.presentations[id]
    }
    
}