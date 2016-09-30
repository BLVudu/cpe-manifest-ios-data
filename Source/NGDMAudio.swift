//
//  NGDMAudio.swift
//

import Foundation

// Wrapper class for `NGEInventoryAudioType` Manifest object
open class NGDMAudio {
    
    /// Unique identifier
    var id: String
    
    /// URL associated with this Video
    open var url: URL?
    
    // MARK: Initialization
    /**
        Initializes a new Audio
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEInventoryAudioType) {
        id = manifestObject.AudioTrackID
        
        if let containerLocation = manifestObject.ContainerReference?.ContainerLocationList?.first?.value {
            if containerLocation.contains("file://") {
                let tempURL = URL(fileURLWithPath: containerLocation.replacingOccurrences(of: "file://", with: ""))
                url = Bundle.main.url(forResource: tempURL.deletingPathExtension().path, withExtension: tempURL.pathExtension)
            } else {
                url = URL(string: containerLocation)
            }
        }
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMAudio` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(_ id: String) -> NGDMAudio? {
        return NGDMManifest.sharedInstance.audios[id]
    }
    
}
