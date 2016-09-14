//
//  NGDMPicture.swift
//

import Foundation

// Wrapper class for `NGEPictureType` Manifest object
open class NGDMPicture {
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// Image URL to be used for full display
    open var imageURL: URL?
    
    /// Image URL to be used for thumbnail display
    var thumbnailImageURL: URL?
    
    /// Caption associated with this image
    fileprivate var captions: [String: String]? // Language: Caption
    open var caption: String? {
        if let caption = captions?[Locale.deviceLanguage()] {
            return caption
        }
        
        return captions?[Locale.deviceLanguageBackup()]
    }
    
    // MARK: Initialization
    /**
        Initializes a new Picture based on Manifest object
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEPictureType) {
        id = manifestObject.PictureID
        
        if let id = manifestObject.ImageID {
            imageURL = NGDMImage.getById(id)?.url
        }
        
        if let id = manifestObject.ThumbnailImageID {
            thumbnailImageURL = NGDMImage.getById(id)?.url
        }
        
        captions = [String: String]()
        if let objList = manifestObject.CaptionList {
            for obj in objList {
                let language = obj.language ?? Locale.deviceLanguage()
                if let value = obj.value {
                    captions![language] = value
                }
            }
        }
    }
    
    /**
        Initializes a new Picture based on image URL
     
        - Parameters:
            - imageURL: Image URL to be used for full display
     */
    public init(imageURL: URL) {
        id = UUID().uuidString
        self.imageURL = imageURL
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMPicture` object by unique identifier
     
        - Parameters:
            - id: Unique identifier to search for
     
        - Returns: Object associated with identifier if it exists
     */
    static func getById(_ id: String) -> NGDMPicture? {
        return NGDMManifest.sharedInstance.pictures[id]
    }
    
}
