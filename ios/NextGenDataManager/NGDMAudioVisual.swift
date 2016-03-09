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
    
    init(manifestObject: NGEAudiovisualType) {
        _manifestObject = manifestObject
    }
    
}