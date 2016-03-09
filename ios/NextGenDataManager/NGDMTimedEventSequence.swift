//
//  NGDMTimedEventSequence.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMTimedEventSequence {
    
    private static var _objectMap = [String: NGDMTimedEventSequence]()
    private var _manifestObject: NGETimedEventSequenceType!
    
    var timedEvents = [Double: NGDMTimedEvent]()
    
    var id: String {
        get {
            return _manifestObject.TimedSequenceID
        }
    }
    
    init(manifestObject: NGETimedEventSequenceType) {
        _manifestObject = manifestObject
    }
    
    func timedEvent(time: Double) -> NGDMTimedEvent? {
        for startTime in timedEvents.keys.sort() {
            if time >= startTime && timedEvents[startTime]!.endTime > time {
                return timedEvents[startTime]
            }
        }
        
        return nil
    }
    
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