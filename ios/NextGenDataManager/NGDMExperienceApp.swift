//
//  NGDMExperienceApp.swift
//  NextGen
//
//  Created by Alec Ananian on 3/11/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMExperienceApp {
    
    private var _manifestObject: NGEExperienceAppType!
    
    private var _metadata: NGDMMetadata!
    var metadata: NGDMMetadata? {
        get {
            if _metadata == nil {
                _metadata = NGDMMetadata.getById(_manifestObject.ContentID!)
            }
            
            return _metadata
        }
    }
    
    init(manifestObject: NGEExperienceAppType) {
        _manifestObject = manifestObject
    }
    
    func getImageURL() -> NSURL? {
        if let thumbnailImagePath = metadata?.thumbnailImagePath {
            return NSURL(string: thumbnailImagePath)
        }
        
        return nil
    }
    
}