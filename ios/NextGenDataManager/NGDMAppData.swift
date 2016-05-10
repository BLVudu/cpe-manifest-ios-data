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
    
    /// App Type
    var type: String? {
        return _nvPairObjects[NVPairName.AppType]?.Text
    }
    
    /// Display text
    var displayText: String? {
        return _nvPairObjects[NVPairName.Text]?.Text
    }
    
    /// Map location
    private var _location: NGDMLocation?
    var location: NGDMLocation? {
        if let obj = _nvPairObjects[NVPairName.Location]?.Location where _location == nil {
            _location = NGDMLocation(manifestObject: obj)
        }
        
        return _location
    }
    
    /// Map zoom level
    var zoomLevel: Float {
        return Float(_nvPairObjects[NVPairName.Zoom]?.Integer ?? 0)
    }
    
    /// Check if AppData is location-based
    var isLocation: Bool {
        return location != nil
    }
    
    /// Presentation associated with this AppData, if it exists
    private var _presentation: NGDMPresentation?
    var presentation: NGDMPresentation? {
        if let presentationId = _nvPairObjects[NVPairName.VideoId]?.PresentationID where _presentation == nil {
            _presentation = NGDMPresentation.getById(presentationId)
        }
        
        return _presentation
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