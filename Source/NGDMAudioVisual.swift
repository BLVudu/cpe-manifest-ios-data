//
//  NGDMAudioVisual.swift
//

import Foundation

// Wrapper class for `NGEAudiovisualType` Manifest object
public class NGDMAudioVisual {
    /// Unique identifier
    var id: String
    
    /// Metadata associated with this AudioVisual
    public var metadata: NGDMMetadata?
    
    /// Image URL to be used for display
    var imageURL: NSURL? {
        return metadata?.imageURL
    }
    
    /// Description to be used for display
    public var descriptionText: String? {
        return metadata?.description ?? metadata?.title
    }
    
    /// Presentations associated with this AudioVisual
    private var playableSequence: NGDMPlayableSequence?
    private var presentation: NGDMPresentation?
    var presentations: [NGDMPresentation]? {
        if let playableSequence = playableSequence {
            return playableSequence.presentations
        }

        if let presentation = presentation {
            return [presentation]
        }

        return nil
    }
    
    // MARK: Initialization
    /**
        Initializes a new AudioVisual
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEAudiovisualType) {
        id = manifestObject.PresentationID ?? manifestObject.PlayableSequenceID ?? manifestObject.ContentID ?? NSUUID().UUIDString
        
        if let id = manifestObject.ContentID {
            metadata = NGDMMetadata.getById(id)
        }
        
        if let id = manifestObject.PlayableSequenceID {
            playableSequence = NGDMPlayableSequence.getById(id)
        } else if let id = manifestObject.PresentationID {
            presentation = NGDMPresentation.getById(id)
        }
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMAudioVisual` object by unique identifier
     
        - Parameters:
            - id: Unique identifier to search for
     
        - Returns: Object associated with identifier if it exists
     */
    static func getById(id: String) -> NGDMAudioVisual? {
        return NGDMManifest.sharedInstance.audioVisuals[id]
    }
    
}