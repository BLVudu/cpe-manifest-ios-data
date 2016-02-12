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
    var videoMap = [String: NGEInventoryVideoType]()
    var imageMap = [String: NGEInventoryImageType]()
    var pictureGroupMap = [String: NGEPictureGroupType]()
    var metadataMap = [String: NGEInventoryMetadataType]()
    var experienceMap = [String: NGEExperienceType]()
    var presentationMap = [String: NGEPresentationType]()
    
    func loadXMLFile(filePath: String!) -> Bool {
        manifest = NGEMediaManifestType.NGEMediaManifestTypeFromFile(filePath)
        return manifest != nil
    }
    
    func outOfMovieExperienceCategories() -> [NGEExperienceType] {
        if let mainExperience = manifest.Experiences.ExperienceList.first, mainChildList = mainExperience.ExperienceChildList, mainChild = mainChildList.first {
            if let outOfMovieExperienceParent = experienceById(mainChild.ExperienceID), subChildList = outOfMovieExperienceParent.ExperienceChildList {
                var experiences: [NGEExperienceType] = []
                for subChild in subChildList {
                    if let experience = experienceById(subChild.ExperienceID) {
                        if experience.ExperienceChildList?.count > 0 {
                            experiences.append(experience)
                        }
                    }
                }
                
                return experiences
            }
        }
        
        return []
    }
    
    func videoByTrackId(videoTrackId: String) -> NGEInventoryVideoType? {
        if videoMap.count == 0 {
            if let videoList = manifest.Inventory?.VideoList {
                for video in videoList {
                    videoMap[video.VideoTrackID] = video
                }
            }
        }
        
        return videoMap[videoTrackId]
    }
    
    func imageById(imageId: String) -> NGEInventoryImageType? {
        if imageMap.count == 0 {
            if let imageList = manifest.Inventory?.ImageList {
                for image in imageList {
                    imageMap[image.ImageID!] = image
                }
            }
        }
        
        return imageMap[imageId]
    }
    
    func pictureGroupById(pictureGroupId: String) -> NGEPictureGroupType? {
        if pictureGroupMap.count == 0 {
            if let pictureGroupList = manifest.PictureGroups?.PictureGroupList {
                for pictureGroup in pictureGroupList {
                    pictureGroupMap[pictureGroup.PictureGroupID!] = pictureGroup
                }
            }
        }
        
        return pictureGroupMap[pictureGroupId]
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
    
    func experienceById(experienceId: String) -> NGEExperienceType? {
        if experienceMap.count == 0 {
            for experience in manifest.Experiences.ExperienceList {
                experienceMap[experience.ExperienceID] = experience
            }
        }
        
        return experienceMap[experienceId]
    }
    
    func presentationById(presentationId: String) -> NGEPresentationType? {
        if presentationMap.count == 0 {
            for presentation in manifest.Presentations.PresentationList {
                presentationMap[presentation.PresentationID] = presentation
            }
        }
        
        return presentationMap[presentationId]
    }

}
