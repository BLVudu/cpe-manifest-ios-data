//
//  NextGenDataManager.swift
//  NextGenDataManagerExample
//
//  Created by Alec Ananian on 2/8/16.
//  Copyright © 2016 Warner Bros. All rights reserved.
//

import Foundation

/// Manager for communicating with parsed Manifest data
class NextGenDataManager: NSObject {
    
    // MARK: Singleton Methods
    /// Static shared instance for singleton
    static let sharedInstance = NextGenDataManager()
    
    // MARK: Instance variables
    /// Reference to the root Manifest object
    var manifest: NGEMediaManifestType!
    
    /// The Manifest's main Experience associated with the feature film
    var _mainExperience: NGDMMainExperience!
    var mainExperience: NGDMMainExperience! {
        get {
            if _mainExperience == nil {
                // FIXME: Assumes the main experience is the first item in the ExperienceList
                if let manifestObject = manifest.Experiences.ExperienceList.first {
                    _mainExperience = NGDMMainExperience(manifestObject: manifestObject)
                }
            }
            
            return _mainExperience
        }
    }
    
    // MARK: File Loading
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
    
}
