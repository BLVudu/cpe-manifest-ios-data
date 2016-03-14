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
    
    /// Metadata associated with this AudioVisual
    private var _metadata: NGDMMetadata!
    var metadata: NGDMMetadata? {
        get {
            if _metadata == nil {
                if let contentId = contentId {
                    _metadata = NGDMMetadata.getById(contentId)
                }
            }
            
            return _metadata
        }
    }
    
    /// Presentation associated with this AudioVisual
    var presentation: NGDMPresentation? {
        get {
            return NGDMPresentation.getById(_manifestObject.PresentationID)
        }
    }
    
    /// Metadata ContentID associated with this AudioVisual
    var contentId: String? {
        get {
            return _manifestObject.ContentID
        }
    }
    
    /// Image URL to be used for display
    var imageURL: NSURL? {
        get {
            return metadata?.imageURL
        }
    }
    
    /// Video URL to be used for display
    var videoURL: NSURL? {
        get {
            return presentation?.videoURL
        }
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
    
}