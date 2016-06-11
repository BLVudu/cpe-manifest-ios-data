//
//  NGDMLocation.swift
//  NextGen
//
//  Created by Alec Ananian on 3/15/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

// Wrapper class for `NGEEventLocationType` Manifest object
public class NGDMLocation {
    
    // MARK: Instance Variables
    /// Metadata
    public var name: String?
    public var address: String?
    
    /// Coordinates
    public var latitude: Double = 0
    public var longitude: Double = 0
    
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