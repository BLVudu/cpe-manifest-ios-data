//
//  NGDMMainExperience.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMMainExperience: NGDMExperience {
    
    // !!!TODO: Makes assumptions about manifest experience's structure. See if we can make it "menu manifest"
    var extrasExperience: NGDMExperience! {
        return childExperiences[0]
    }
    
    var syncedExperience: NGDMExperience! {
        return childExperiences[1]
    }
    
    var audioVisual: NGDMAudioVisual? {
        get {
            if let presentationId = audioVisuals.keys.first, audioVisual = audioVisuals[presentationId] {
                return audioVisual
            }
            
            return nil
        }
    }
    
    func customIdentifier(namespace: String) -> String? {
        if let audioVisual = audioVisual, contentId = audioVisual.contentId, metadata = NGDMMetadata.getById(contentId) {
            return metadata.customIdentifier(namespace)
        }
        
        return nil
    }
    
}