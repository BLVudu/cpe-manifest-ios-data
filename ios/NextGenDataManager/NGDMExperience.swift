//
//  NGDMExperience.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMExperience {
    
    private static var _objectMap = [String: NGDMExperience]()
    private var _manifestObject: NGEExperienceType!
    
    var galleries = [String: NGDMGallery]()
    
    private var _audioVisuals = [String: NGDMAudioVisual]()
    var audioVisuals: [String: NGDMAudioVisual]! {
        get {
            if _audioVisuals.count == 0 {
                if let audioVisualList = _manifestObject.AudiovisualList {
                    for audioVisualObj in audioVisualList {
                        _audioVisuals[audioVisualObj.PresentationID] = NGDMAudioVisual(manifestObject: audioVisualObj)
                    }
                }
            }
            
            return _audioVisuals
        }
    }
    
    
    var id: String {
        get {
            return _manifestObject.ExperienceID
        }
    }
    
    private var _children = [NGDMExperience]()
    var childExperiences: [NGDMExperience] {
        get {
            if _children.count == 0 {
                if let childList = _manifestObject.ExperienceChildList {
                    for child in childList {
                        if let childExperience = NGDMExperience.getById(child.ExperienceID) {
                            _children.append(childExperience)
                        }
                    }
                }
            }
            
            return _children
        }
    }
    
    private var _metadata: NGDMMetadata!
    var metadata: NGDMMetadata? {
        get {
            if _metadata == nil {
                _metadata = NGDMMetadata.getById(_manifestObject.ContentID)
            }
            
            return _metadata
        }
    }
    
    var thumbnailImagePath: String? {
        get {
            if let imagePath = metadata?.thumbnailImagePath {
                return imagePath
            }
            
            if let childList = _manifestObject.AudiovisualList, childItem = childList.first, metadata = NGDMMetadata.getById(childItem.ContentID) {
                return metadata.thumbnailImagePath
            }
            
            if let childList = _manifestObject.GalleryList, childItem = childList.first, metadata = NGDMMetadata.getById(childItem.ContentID!) {
                return metadata.thumbnailImagePath
            }
            
            if let childList = _manifestObject.AppList, childItem = childList.first, metadata = NGDMMetadata.getById(childItem.ContentID!) {
                return metadata.thumbnailImagePath
            }
            
            if childExperiences.count > 0 {
                if let childExperience = childExperiences.first {
                    return childExperience.thumbnailImagePath
                }
            }
            
            return nil
        }
    }
    
    var videoURL: NSURL? {
        get {
            if let audioVisual = _manifestObject.AudiovisualList?.first, presentation = NGDMPresentation.getById(audioVisual.PresentationID) {
                return presentation.videoURL
            }
            
            return nil
        }
    }
    
    private var _imageGallery: NGDMGallery!
    var imageGallery: NGDMGallery? {
        get {
            if _imageGallery == nil {
                if let manifestObject = _manifestObject.GalleryList?.first {
                    _imageGallery = NGDMGallery(manifestObject: manifestObject)
                }
            }
            
            return _imageGallery
        }
    }
    
    var timedEventSequence: NGDMTimedEventSequence? {
        get {
            if let objList = _manifestObject.TimedSequenceIDList, objId = objList.first {
                return NGDMTimedEventSequence.getById(objId)
            }
            
            return nil
        }
    }
    
    init(manifestObject: NGEExperienceType) {
        _manifestObject = manifestObject
    }
    
    func isAudioVisual() -> Bool {
        return _manifestObject.AudiovisualList?.count > 0
    }
    
    func isGallery() -> Bool {
        return _manifestObject.GalleryList?.count > 0
    }
    
    static func getById(id: String) -> NGDMExperience? {
        if _objectMap.count == 0 {
            for obj in NextGenDataManager.sharedInstance.manifest.Experiences.ExperienceList {
                let experience = NGDMExperience(manifestObject: obj)
                _objectMap[obj.ExperienceID] = experience
                
                if let galleryList = obj.GalleryList {
                    for galleryObj in galleryList {
                        if let galleryId = galleryObj.GalleryID {
                            experience.galleries[galleryId] = NGDMGallery(manifestObject: galleryObj)
                        }
                    }
                }
            }
        }
        
        return _objectMap[id]
    }
    
    /*
    func timedEvent(time: Double) -> NGETimedEventType? {
        if let timedSequenceIds = self.TimedSequenceIDList, timedSequenceId = timedSequenceIds.first, timedEvents = NextGenDataManager.sharedInstance.timedEventsByTimedSequenceId(timedSequenceId) {
            for startTime in timedEvents.keys {
                if time >= startTime {
                    if let timedEvent = timedEvents[startTime] {
                        if Double(timedEvent.EndTimecode.value!) > time {
                            return timedEvent
                        }
                    }
                }
            }
        }
        
        return nil
    }*/
    
}