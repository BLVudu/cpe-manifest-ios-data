//
//  NGDMTimedEventSequence.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGETimedEventSequenceType` Manifest object
public class NGDMTimedEventSequence {
    
    // MARK: Instance Variables
    /// Timed events associated with this TimedEventSequence - StartTime: TimedEvent
    private var _sortedTimedEventStartTimes: [Double]?
    var timedEvents = [Double: NGDMTimedEvent]()
    
    /// Unique identifier
    var id: String
    
    // MARK: Initialization
    /**
        Initializes a new TimedEventSequence
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGETimedEventSequenceType) {
        id = manifestObject.TimedSequenceID
        
        for obj in manifestObject.TimedEventList {
            let timedEvent = NGDMTimedEvent(manifestObject: obj)
            timedEvents[timedEvent.startTime] = timedEvent
        }
        
        _sortedTimedEventStartTimes = timedEvents.keys.sort()
    }
    
    // MARK: Helper Methods
    /**
        Find a child TimedEvent that occurs at the provided time

        - Parameters:
            - time: The time that should be used to search for a child TimedEvent

        - Returns: A TimedEvent that occurs at the given `time` if it exists
    */
    public func timedEvent(time: Double) -> NGDMTimedEvent? {
        if timedEvents.count > 0 {
            if let startTimes = _sortedTimedEventStartTimes {
                var lowerIndex = 0;
                var upperIndex = startTimes.count - 1
                
                while (true) {
                    let currentIndex = (lowerIndex + upperIndex) / 2
                    let startTime = startTimes[currentIndex]
                    
                    if lowerIndex > upperIndex {
                        return nil
                    }
                    
                    if startTime > time {
                        upperIndex = currentIndex - 1
                    } else {
                        if let timedEvent = timedEvents[startTime] {
                            if timedEvent.endTime > time {
                                return timedEvent
                            }
                        }
                        
                        lowerIndex = currentIndex + 1
                    }
                }
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
        return NGDMManifest.sharedInstance.timedEventSequences[id]
    }
    
}