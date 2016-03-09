//
//  NextGenDataManager.swift
//  NextGenDataManagerExample
//
//  Created by Alec Ananian on 2/8/16.
//  Copyright © 2016 Warner Bros. All rights reserved.
//

import Foundation

class NextGenDataManager: NSObject {
    
    static let sharedInstance = NextGenDataManager()
    
    var manifest: NGEMediaManifestType!
    
    var _mainExperience: NGDMMainExperience!
    var mainExperience: NGDMMainExperience! {
        get {
            if _mainExperience == nil {
                if let manifestObject = manifest.Experiences.ExperienceList.first {
                    _mainExperience = NGDMMainExperience(manifestObject: manifestObject)
                }
            }
            
            return _mainExperience
        }
    }
    
    func loadXMLFile(filePath: String!) -> Bool {
        manifest = NGEMediaManifestType.NGEMediaManifestTypeFromFile(filePath)
        return manifest != nil
    }
    
}
