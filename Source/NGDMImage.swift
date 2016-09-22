//
//  NGDMImage.swift
//

import Foundation

// Wrapper class for `NGEInventoryImageType` Manifest object
open class NGDMImage {
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// URL associated with this Image
    open var url: URL?
    
    /// Size of the Image as specified in Manifest file
    open var size = CGSize.zero
    
    // MARK: Initialization
    /**
        Initializes a new Image
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEInventoryImageType) {
        id = manifestObject.ImageID ?? UUID().uuidString
        
        if let containerLocation = manifestObject.ContainerReference?.ContainerLocationList?.first?.value  {
            if containerLocation.contains("file://") {
                let tempURL = URL(fileURLWithPath: containerLocation.replacingOccurrences(of: "file://", with: ""))
                url = Bundle.main.url(forResource: tempURL.deletingPathExtension().path, withExtension: tempURL.pathExtension)
            } else {
                url = URL(string: containerLocation)
            }
        }
        
        size = CGSize(width: manifestObject.Width, height: manifestObject.Height)
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMImage` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(_ id: String) -> NGDMImage? {
        return NGDMManifest.sharedInstance.images[id]
    }
    
}
