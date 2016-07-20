//
//  NGDMPicture.swift
//

import Foundation

// Wrapper class for `NGEPictureType` Manifest object
public class NGDMPicture {
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// Image URL to be used for full display
    public var imageURL: NSURL?
    
    /// Image URL to be used for thumbnail display
    var thumbnailImageURL: NSURL?
    
    /// Caption associated with this image
    var captions: [String: String]? // Language: Caption
    public var caption: String? {
        return captions?["en"]
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
                let language = obj.language ?? "en"
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
    public init(imageURL: NSURL) {
        id = NSUUID().UUIDString
        self.imageURL = imageURL
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMPicture` object by unique identifier
     
        - Parameters:
            - id: Unique identifier to search for
     
        - Returns: Object associated with identifier if it exists
     */
    static func getById(id: String) -> NGDMPicture? {
        return NGDMManifest.sharedInstance.pictures[id]
    }
    
}