//
//  NGDMTimedEventSequence.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGETimedEventSequenceType` Manifest object
class NGDMTimedEventSequence {
    
    // MARK: Static Variables
    /// Static mapping of all TimedEventSequences - TimedSequenceID: TimedEventSequence
    private static var _objectMap = [String: NGDMTimedEventSequence]()
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGETimedEventSequenceType!
    
    /// Timed events associated with this TimedEventSequence - StartTime: TimedEvent
    var timedEvents = [Double: NGDMTimedEvent]()
    
    /// Unique identifier
    var id: String {
        get {
            return _manifestObject.TimedSequenceID
        }
    }
    
    // MARK: Initialization
    /**
        Initializes a new TimedEventSequence
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGETimedEventSequenceType) {
        _manifestObject = manifestObject
    }
    
    // MARK: Helper Methods
    /**
        Find a child TimedEvent that occurs at the provided time

        - Parameters:
            - time: The time that should be used to search for a child TimedEvent

        - Returns: A TimedEvent that occurs at the given `time` if it exists
    */
    func timedEvent(time: Double) -> NGDMTimedEvent? {
        for startTime in timedEvents.keys.sort() {
            if time >= startTime && timedEvents[startTime]!.endTime > time {
                return timedEvents[startTime]
            }
        }
        
        return nil
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMTimedEventSequence` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(id: String) -> NGDMTimedEventSequence? {
        if _objectMap.count == 0 {
            if let objList = NextGenDataManager.sharedInstance.manifest.TimedEventSequences?.TimedEventSequenceList {
                for obj in objList {
                    let timedEventSequence = NGDMTimedEventSequence(manifestObject: obj)
                    _objectMap[obj.TimedSequenceID] = timedEventSequence
                    
                    for eventObj in obj.TimedEventList {
                        let timedEvent = NGDMTimedEvent(manifestObject: eventObj)
                        timedEventSequence.timedEvents[timedEvent.startTime] = timedEvent
                    }
                }
            }
        }
        
        return _objectMap[id]
    }
    
}