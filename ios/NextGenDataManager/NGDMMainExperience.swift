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
        return childExperiences.first
    }
    
    /// Child Experience associated with the synced, or interior, extras
    var syncedExperience: NGDMExperience! {
        return childExperiences.last
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
    
    /// List of Talent associated with the feature film
    var talents = [String: Talent]()
    
    private var _orderedActors: [Talent]?
    /// Ordered list of Talents with type Actor associated with the feature film
    var orderedActors: [Talent] {
        get {
            if _orderedActors == nil {
                _orderedActors = talents.values.filter { (talent) -> Bool in
                    talent.type == TalentType.Actor
                }.sort({ (talent1, talent2) -> Bool in
                    return talent1.billingBlockOrder < talent2.billingBlockOrder
                })
            }
            
            return _orderedActors!
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
    
    /**
        Loads talent based on a series of fallbacks, starting with the Baseline API
    */
    func loadTalent() {
        if let people = audioVisual?.metadata?.PeopleList {
            for person in people {
                let talent = Talent(manifestObject: person)
                talents[talent.id] = talent
            }
        } else if BaselineAPIUtil.sharedInstance.isActive() {
            BaselineAPIUtil.sharedInstance.prefetchCredits({ (talents) in
                self.talents = talents
            })
        }
        
        for talent in talents.values {
            BaselineAPIUtil.sharedInstance.getTalentImages(talent.id, successBlock: { (talentImages) in
                talent.images = talentImages
            })
        }
    }
    
}