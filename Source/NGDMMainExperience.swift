//
//  NGDMMainExperience.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEExperienceType` Manifest object associated with the main Experience
public class NGDMMainExperience: NGDMExperience {
    
    // MARK: Instance Variables
    /// List of Talent associated with the feature film
    var talents = [String: Talent]()
    
    /// Ordered list of Talents with type Actor associated with the feature film
    private var _orderedActors: [Talent]?
    public var orderedActors: [Talent]? {
        if _orderedActors == nil {
            _orderedActors = talents.values.filter { (talent) -> Bool in
                talent.type == TalentType.Actor
            }.sort({ (talent1, talent2) -> Bool in
                return talent1.billingBlockOrder < talent2.billingBlockOrder
            })
        }
        
        return _orderedActors
    }
    
    // MARK: Helper Methods
    /**
        Find the value of any custom identifier associated with this Experience

        - Parameters:
            - namespace: The namespace of the custom identifier used in the Manifest (e.g. "thetake")

        - Returns: The value of the custom identifier if it exists
    */
    public func customIdentifier(namespace: String) -> String? {
        return audioVisual?.metadata?.customIdentifier(namespace)
    }
    
    /**
        Loads talent based on a series of fallbacks, starting with the Baseline API
    */
    public func loadTalent() {
        if let talents = audioVisual?.metadata?.talents {
            self.talents = talents
        } else if let talentAPIUtil = NGDMManifest.talentAPIUtil() {
            talentAPIUtil.prefetchCredits({ (talents) in
                self.talents = talents
            })
        }
        
        if let talentAPIUtil = NGDMManifest.talentAPIUtil() {
            for talent in talents.values {
                if let talentId = talent.apiID {
                    talentAPIUtil.getTalentImages(talentId, successBlock: { (talentImages) in
                        talent.images = talentImages
                    })
                }
            }
        }
    }
    
    /**
        Get the out-of-movie Experience associated with this main Experience
 
        - Throws: `NGDMError.OutOfMovieExperienceMissing` if no child experience is found
 
        - Returns: The out-of-movie Experience according to the IP1 spec guidelines
    */
    public func getOutOfMovieExperience() throws -> NGDMExperience {
        // IP1: Assumes the out-of-movie Experience is the first item in the main Experience's ExperienceList
        guard let experience = childExperiences?.first else {
            throw NGDMError.OutOfMovieExperienceMissing
        }
        
        return experience
    }
    
    /**
        Get the in-movie Experience associated with this main Experience
     
        - Throws: `NGDMError.InMovieExperienceMissing` if no child experience is found
     
        - Returns: The in-movie Experience according to the IP1 spec guidelines
     */
    public func getInMovieExperience() throws -> NGDMExperience {
        // IP1: Assumes the in-movie Experience is the second (and last) item in the main Experience's ExperienceList
        guard let experience = childExperiences?.last else {
            throw NGDMError.InMovieExperienceMissing
        }
        
        return experience
    }
    
}