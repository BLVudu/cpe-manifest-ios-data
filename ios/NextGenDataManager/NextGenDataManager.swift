//
//  NextGenDataManager.swift
//  NextGenDataManagerExample
//
//  Created by Alec Ananian on 2/8/16.
//  Copyright © 2016 Warner Bros. All rights reserved.
//

import Foundation

enum NGDMError: ErrorType {
    case MainExperienceMissing
    case InMovieExperienceMissing
    case OutOfMovieExperienceMissing
}

/// Manager for communicating with parsed Manifest data
class NextGenDataManager: NSObject {
    
    // MARK: Singleton Methods
    /// Static shared instance for singleton
    static let sharedInstance = NextGenDataManager()
    
    // MARK: Instance variables
    /// Reference to the root Manifest object
    var manifest: NGEMediaManifestType!
    
    /// The Manifest's main Experience associated with the feature film
    private var _mainExperience: NGDMMainExperience?
    
    // MARK: Helper Methods
    /**
        Initializes the `NGEMediaManifestType` object
     
        - Parameters:
            - filePath: The path to the Manifest.XML file for the desired title
     
        - Returns: The resulting `NGEMediaManifestType` object
    */
    func loadXMLFile(filePath: String!) -> NGEMediaManifestType {
        manifest = NGEMediaManifestType.NGEMediaManifestTypeFromFile(filePath)
        return manifest
    }
    
    /**
        Get the main Experience (feature film) associated with this Manifest file
     
        - Throws: `NGDMError.MainExperienceMissing` if no main Experience is found
 
        - Returns: The main Experience (feature film) associated with this Manifest
    */
    func getMainExperience() throws -> NGDMMainExperience {
        if let experience = _mainExperience {
            return experience
        }
        
        // IP1: Assumes the main experience is the first item in the ExperienceList
        guard let manifestObject = manifest.Experiences.ExperienceList.first else {
            throw NGDMError.MainExperienceMissing
        }
        
        _mainExperience = NGDMMainExperience(manifestObject: manifestObject)
        return _mainExperience!
    }
    
}
