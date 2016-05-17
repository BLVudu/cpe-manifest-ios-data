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
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEAudiovisualType!
    
    /// Unique identifier
    var id: String {
        return _manifestObject.PresentationID
    }
    
    /// Metadata associated with this AudioVisual
    var metadata: NGDMMetadata? {
        if let contentId = contentId {
            return NGDMMetadata.getById(contentId)
        }
        
        return nil
    }
    
    /// Presentation associated with this AudioVisual
    var presentation: NGDMPresentation? {
        return NGDMPresentation.getById(_manifestObject.PresentationID)
    }
    
    /// Metadata ContentID associated with this AudioVisual
    var contentId: String? {
        return _manifestObject.ContentID
    }
    
    /// Image URL to be used for display
    var imageURL: NSURL? {
        return metadata?.imageURL
    }
    
    /// Video URL to be used for display
    var videoURL: NSURL? {
        return presentation?.videoURL
    }
    
    // MARK: Initialization
    /**
        Initializes a new AudioVisual
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEAudiovisualType) {
        _manifestObject = manifestObject
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