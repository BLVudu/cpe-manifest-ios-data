//
//  NGDMAudioVisual.swift
//  NextGen
//
//  Created by Alec Ananian on 3/9/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEAudiovisualType` Manifest object
class NGDMAudioVisual {
    /// Unique identifier
    var id: String
    
    /// Metadata associated with this AudioVisual
    var metadata: NGDMMetadata?
    
    /// Image URL to be used for display
    var imageURL: NSURL? {
        return metadata?.imageURL
    }
    
    /// Video URL to be used for display
    var videoURL: NSURL? {
        return presentation?.videoURL
    }
    
    /// Presentation associated with this AudioVisual
    var presentation: NGDMPresentation?
    
    // MARK: Initialization
    /**
        Initializes a new AudioVisual
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEAudiovisualType) {
        id = manifestObject.PresentationID
        presentation = NGDMPresentation.getById(id)
        
        if let id = manifestObject.ContentID {
            metadata = NGDMMetadata.getById(id)
        }
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMAudioVisual` object by unique identifier
     
        - Parameters:
            - id: Unique identifier to search for
     
        - Returns: Object associated with identifier if it exists
     */
    static func getById(id: String) -> NGDMAudioVisual? {
        return NextGenDataManager.sharedInstance.audioVisuals[id]
    }
    
}