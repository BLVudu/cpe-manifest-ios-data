//
//  NGDMPlayableSequence.swift
//

import Foundation

// Wrapper class for `NGEPlayableSequence` Manifest object
open class NGDMPlayableSequence {
    /// Unique identifier
    var id: String
    
    /// Presentations associated with this PlayableSequence
    var presentations: [NGDMPresentation]?
    
    // MARK: Initialization
    /**
        Initializes a new AudioVisual
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEPlayableSequence) {
        id = manifestObject.PlayableSequenceID ?? UUID().uuidString
        
        if let objList = manifestObject.ClipList {
            presentations = [NGDMPresentation]()
            
            for obj in objList {
                if let presentation = NGDMPresentation.getById(obj.PresentationID) {
                    presentations!.append(presentation)
                }
            }
        }
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMPlayableSequence` object by unique identifier
     
        - Parameters:
            - id: Unique identifier to search for
     
        - Returns: Object associated with identifier if it exists
     */
    static func getById(_ id: String) -> NGDMPlayableSequence? {
        return NGDMManifest.sharedInstance.playableSequences[id]
    }
    
}
