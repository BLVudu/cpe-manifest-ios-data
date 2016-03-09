//
//  NGDMPresentation.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMPresentation {
    
    private static var _objectMap = [String: NGDMPresentation]()
    private var _manifestObject: NGEPresentationType!
    
    var id: String {
        get {
            return _manifestObject.PresentationID
        }
    }
    
    var videoURL: NSURL? {
        get {
            if let trackMetadata = _manifestObject.TrackMetadataList.first,
                    videoTrackReference = trackMetadata.VideoTrackReferenceList?.first,
                    videoTrackId = videoTrackReference.VideoTrackIDList?.first,
                    video = NGDMVideo.getById(videoTrackId),
                    videoURL = video.url {
                return videoURL
            }
            
            return nil
        }
    }
    
    init(manifestObject: NGEPresentationType) {
        _manifestObject = manifestObject
    }
    
    static func getById(id: String) -> NGDMPresentation? {
        if _objectMap.count == 0 {
            for obj in NextGenDataManager.sharedInstance.manifest.Presentations.PresentationList {
                _objectMap[obj.PresentationID] = NGDMPresentation(manifestObject: obj)
            }
        }
        
        return _objectMap[id]
    }
    
}