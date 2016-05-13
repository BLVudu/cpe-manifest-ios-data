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
    case AppDataMissing
}

struct Namespaces {
    static let AppDataID = "AppID"
    static let PeopleID = "PeopleOtherID"
}

/// Manager for communicating with parsed Manifest data
class NextGenDataManager: NSObject {
    
    // MARK: Singleton Methods
    /// Static shared instance for singleton
    static let sharedInstance = NextGenDataManager()
    
    // MARK: Instance variables
    /// Reference to the root Manifest object
    var manifest: NGEMediaManifestType!
    
    /// Reference to the root AppData object
    var appDataSet: NGEManifestAppDataSetType!
    
    /// The Manifest's main Experience associated with the feature film
    private var _mainExperience: NGDMMainExperience?
    
    // MARK: Helper Methods
    /**
        Initializes the `NGEMediaManifestType` object
     
        - Parameters:
            - filePath: The path to the Manifest.XML file for the desired title
     
        - Returns: The resulting `NGEMediaManifestType` object
    */
    func loadManifestXMLFile(filePath: String) -> NGEMediaManifestType {
        manifest = NGEMediaManifestType.NGEMediaManifestTypeFromFile(filePath)
        return manifest
    }
    
    /**
        Initializes the `NGEManifestAppDataSetType` object
 
        - Parameters:
            - filePath: The path to the AppData.XML file for the desired title
 
        - Returns: The resulting `NGEManifestAppDataSetType` object
    */
    func loadAppDataXMLFile(filePath: String) -> NGEManifestAppDataSetType {
        appDataSet = NGEManifestAppDataSetType.NGEManifestAppDataSetTypeFromFile(filePath)
        return appDataSet
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
    
    func getAllAppData() throws -> [String: NGDMAppData] {
        guard let manifestObjectList = appDataSet.ManifestAppDataList else {
            throw NGDMError.AppDataMissing
        }
        
        var allAppData = [String: NGDMAppData]()
        for obj in manifestObjectList {
            let appData = NGDMAppData(manifestObject: obj)
            allAppData[appData.id] = appData
        }
        
        return allAppData
    }
    
}
