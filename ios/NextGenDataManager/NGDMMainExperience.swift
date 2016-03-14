//
//  NGDMMainExperience.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEExperienceType` Manifest object associated with the main Experience
class NGDMMainExperience: NGDMExperience {
    
    // MARK: Instance Variables
    /// Child Experience associated with the extras, or out-of-movie, features
    var extrasExperience: NGDMExperience! {
        return childExperiences[0]
    }
    
    /// Child Experience associated with the synced, or interior, extras
    var syncedExperience: NGDMExperience! {
        return childExperiences[1]
    }
    
    /// AudioVisual associated with the main experience, typically the feature film
    var audioVisual: NGDMAudioVisual? {
        get {
            if let presentationId = audioVisuals.keys.first, audioVisual = audioVisuals[presentationId] {
                return audioVisual
            }
            
            return nil
        }
    }
    
    // MARK: Helper Methods
    /**
        Find the value of any custom identifier associated with this Experience

        - Parameters:
            - namespace: The namespace of the custom identifier used in the Manifest (e.g. "thetake")

        - Returns: The value of the custom identifier if it exists
    */
    func customIdentifier(namespace: String) -> String? {
        if let audioVisual = audioVisual, contentId = audioVisual.contentId, metadata = NGDMMetadata.getById(contentId) {
            return metadata.customIdentifier(namespace)
        }
        
        return nil
    }
    
}