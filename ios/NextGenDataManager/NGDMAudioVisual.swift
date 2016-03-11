//
//  NGDMAudioVisual.swift
//  NextGen
//
//  Created by Alec Ananian on 3/9/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMAudioVisual {
    
    private var _manifestObject: NGEAudiovisualType!
    
    private var _metadata: NGDMMetadata!
    var metadata: NGDMMetadata? {
        get {
            if _metadata == nil {
                _metadata = NGDMMetadata.getById(_manifestObject.ContentID!)
            }
            
            return _metadata
        }
    }
    
    var presentation: NGDMPresentation? {
        get {
            return NGDMPresentation.getById(_manifestObject.PresentationID)
        }
    }
    
    var contentId: String? {
        get {
            return _manifestObject.ContentID
        }
    }
    
    var imageURL: NSURL? {
        get {
            if let thumbnailImagePath = metadata?.thumbnailImagePath {
                return NSURL(string: thumbnailImagePath)
            }
            
            return nil
        }
    }
    
    var videoURL: NSURL? {
        get {
            return presentation?.videoURL
        }
    }
    
    init(manifestObject: NGEAudiovisualType) {
        _manifestObject = manifestObject
    }
    
}