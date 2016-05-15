//
//  NGDMAppData.swift
//  NextGen
//
//  Created by Alec Ananian on 5/6/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEExperienceAppType` Manifest object
class NGDMAppData {
    
    private struct NVPairName {
        static let AppType = "type"
        static let Location = "location"
        static let Text = "text"
        static let Zoom = "zoom"
        static let VideoId = "video_id"
        static let GalleryId = "gallery_id"
        static let LocationThumbnail = "location_thumbnail"
        static let VideoThumbnail = "video_thumbnail"
        static let GalleryThumbnail = "gallery_thumbnail"
    }
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEAppDataType!
    
    /// Mapping of all child NVPairs - Name: NGEAppNVPairType
    private var _nvPairObjects = [String: NGEAppNVPairType]()
    
    /// Unique identifier
    var id: String {
        return _manifestObject.AppID
    }
    
    /// Title
    var title: String? {
        return location?.name
    }
    
    /// App Type
    var type: String? {
        return _nvPairObjects[NVPairName.AppType]?.Text
    }
    
    /// Display text
    var displayText: String? {
        return _nvPairObjects[NVPairName.Text]?.Text
    }
    
    /// Display thumbnail
    var imageURL: NSURL? {
        if let pictureId = _nvPairObjects[NVPairName.VideoThumbnail]?.PictureID {
            return NGDMImage.getById(pictureId)?.url
        }
        
        if let pictureId = _nvPairObjects[NVPairName.GalleryThumbnail]?.PictureID {
            return NGDMImage.getById(pictureId)?.url
        }
        
        return nil
    }
    
    /// Location thumbnail
    var locationImageURL: NSURL? {
        if let pictureId = _nvPairObjects[NVPairName.LocationThumbnail]?.PictureID {
            return NGDMImage.getById(pictureId)?.url
        }
        
        return nil
    }
    
    /// Map location
    private var _location: NGDMLocation?
    var location: NGDMLocation? {
        if _location == nil {
            if let obj = _nvPairObjects[NVPairName.Location]?.Location {
                _location = NGDMLocation(manifestObject: obj)
            } else if let obj = _nvPairObjects[NVPairName.Location]?.LocationSet?.LocationList?.first {
                _location = NGDMLocation(manifestObject: obj)
            }
        }
        
        return _location
    }
    
    /// Map zoom level
    var zoomLevel: Float {
        return Float(_nvPairObjects[NVPairName.Zoom]?.Integer ?? 0)
    }
    
    /// Presentation associated with this AppData, if it exists
    private var _presentation: NGDMPresentation?
    var presentation: NGDMPresentation? {
        if let presentationId = _nvPairObjects[NVPairName.VideoId]?.PresentationID where _presentation == nil {
            _presentation = NGDMPresentation.getById(presentationId)
        }
        
        return _presentation
    }
    
    var gallery: NGDMGallery? {
        if let galleryId = _nvPairObjects[NVPairName.GalleryId]?.Gallery?.GalleryID {
            return NGDMGallery.getById(galleryId)
        }
        
        return nil
    }
    
    /// Check if AppData is location-based
    var isLocation: Bool {
        return location != nil
    }
    
    // MARK: Initialization
    /**
        Initializes a new ExperienceApp
     
        - Parameters:
            - manifestObject: Raw Manifest data object
     */
    init(manifestObject: NGEAppDataType) {
        _manifestObject = manifestObject
        
        for obj in _manifestObject.NVPairList {
            _nvPairObjects[obj.Name] = obj
        }
    }
    
}