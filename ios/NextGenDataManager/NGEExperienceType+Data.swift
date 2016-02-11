//
//  NGEExperienceType+Data.swift
//  NextGenDataManagerExample
//
//  Created by Alec Ananian on 2/8/16.
//  Copyright © 2016 Warner Bros. All rights reserved.
//

import Foundation

extension NGEExperienceType {
    
    func metadata() -> NGEInventoryMetadataType? {
        return NextGenDataManager.sharedInstance.metadataByContentId(self.ContentID!)
    }
    
    func thumbnailImagePath() -> String? {
        if self.ExperienceChildList?.count > 0 {
            if let firstChildExperience = self.ExperienceChildList!.first {
                if let experience = NextGenDataManager.sharedInstance.experienceById(firstChildExperience.ExperienceID) {
                    return experience.thumbnailImagePath()
                }
            }
        }
        
        if self.AudiovisualList?.count > 0 {
            if let metadata = NextGenDataManager.sharedInstance.metadataByContentId(self.AudiovisualList!.first!.ContentID) {
                return metadata.thumbnailImage()
            }
        }
        
        return nil
    }
    
    func videoURL() -> NSURL? {
        if let audioVisual = self.AudiovisualList?.first {
            if let presentation = NextGenDataManager.sharedInstance.presentationById(audioVisual.PresentationID),
                    trackMetadata = presentation.TrackMetadataList.first,
                    videoTrackReference = trackMetadata.VideoTrackReferenceList?.first,
                    videoTrackId = videoTrackReference.VideoTrackIDList?.first,
                    video = NextGenDataManager.sharedInstance.videoByTrackId(videoTrackId),
                    videoContainer = video.ContainerReference
            {
                return NSURL(string: videoContainer.ContainerLocation!)
            }
        }
        
        return nil
    }
    
    func childExperiences() -> [NGEExperienceType] {
        var experiences: [NGEExperienceType] = []
        if let childExperienceList = self.ExperienceChildList {
            for childExperience in childExperienceList {
                if let experience = NextGenDataManager.sharedInstance.experienceById(childExperience.ExperienceID) {
                    experiences.append(experience)
                }
            }
        }
        
        return experiences
    }
    
}