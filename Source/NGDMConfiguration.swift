//
//  NGDMConfiguration.swift
//  NextGenDataManager
//
//  Created by Alec Ananian on 6/13/16.
//
//

import Foundation

public enum NGDMMapService {
    case GoogleMaps
    case AppleMaps
}

public struct NGDMConfiguration {
    
    /// The TalentAPIUtil to be used to fetch talent details from a third party API, if any
    public static var talentAPIUtil: TalentAPIUtil?
    
    /// The map service to be used to display any interactive maps in the UI
    public static var mapService = NGDMMapService.AppleMaps
    
}