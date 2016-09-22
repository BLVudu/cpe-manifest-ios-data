//
//  NGDMPresentation.swift
//

import Foundation

// Wrapper class for `NGEPresentationType` Manifest object
open class NGDMPresentation {
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// Video associated with this Presentation
    var video: NGDMVideo?
    
    /// Video URL to be used for display
    open var videoURL: URL? {
        return video?.url
    }
    
    /// Original size of the Video
    open var videoSize: CGSize {
        return video?.size ?? CGSize.zero
    }
    
    // MARK: Initialization
    /**
        Initializes a new Presentation
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEPresentationType) {
        id = manifestObject.PresentationID
        
        if let id = manifestObject.TrackMetadataList.first?.VideoTrackReferenceList?.first?.VideoTrackIDList?.first {
            video = NGDMVideo.getById(id)
        }
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMPresentation` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(_ id: String) -> NGDMPresentation? {
        return NGDMManifest.sharedInstance.presentations[id]
    }
    
}
