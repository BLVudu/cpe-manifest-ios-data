//
//  NGDMLocation.swift
//  NextGen
//
//  Created by Alec Ananian on 3/15/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

// Wrapper class for `NGEEventLocationType` Manifest object
class NGDMLocation {
    
    // MARK: Instance Variables
    /// Metadata
    var name: String?
    var address: String?
    
    /// Coordinates
    var latitude: Double = 0
    var longitude: Double = 0
    
    // MARK: Initialization
    /**
        Initializes a new NGETimedEventType
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEEventLocationType) {
        name = manifestObject.Name
        address = manifestObject.Address
        latitude = manifestObject.EarthCoordinate?.Latitude ?? 0
        longitude = manifestObject.EarthCoordinate?.Longitude ?? 0
    }
    
}