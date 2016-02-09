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
    var metadataMap = [String: NGEInventoryMetadataType]()
    
    func loadXMLFile(filePath: String!) -> Bool {
        manifest = NGEMediaManifestType.NGEMediaManifestTypeFromFile(filePath)
        return manifest != nil
    }
    
    func allExtras() -> [NGEExperienceType] {
        var experiences: [NGEExperienceType] = []
        if let experienceList = manifest.Experiences?.ExperienceList {
            for experience in experienceList {
                if experience.AudiovisualList?.count > 0 {
                    experiences.append(experience)
                }
            }
        }
        
        return experiences
    }
    
    func metadataByContentId(contentId: String) -> NGEInventoryMetadataType? {
        if metadataMap.count == 0 {
            if let metadataList = manifest.Inventory?.MetadataList {
                for metadata in metadataList {
                    metadataMap[metadata.ContentID] = metadata
                }
            }
        }
        
        return metadataMap[contentId]
    }

}
