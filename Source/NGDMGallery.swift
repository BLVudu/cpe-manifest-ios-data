//
//  NGDMGallery.swift
//

import Foundation

public enum GallerySubType: String {
    case Gallery = "Gallery"
    case Turntable = "Turntable"
}

// Wrapper class for `NGEGalleryType` Manifest object
public class NGDMGallery {
    
    private struct Constants {
        static let SubTypeTurntable = "Turntable"
    }
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// Metadata
    private var _metadata: NGDMMetadata?
    private var _galleryName: String?
    var title: String? {
        return _galleryName ?? _metadata?.title
    }
    
    /// Description to be used for display
    public var description: String? {
        return _metadata?.description ?? _metadata?.title
    }
    
    /// Thumbnail image URL to be used for display
    var imageURL: NSURL?
    
    /// Pictures associated with this Gallery
    public var pictures: [NGDMPicture]?
    
    /// Whether or not this Gallery should be displayed as a turntable
    private var subType = GallerySubType.Gallery
    
    // MARK: Initialization
    /**
        Initializes a new Gallery
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEGalleryType) {
        id = manifestObject.GalleryID ?? NSUUID().UUIDString
        
        if let id = manifestObject.ContentID {
            _metadata = NGDMMetadata.getById(id)
        }
        
        if let id = manifestObject.PictureGroupID {
            pictures = NGDMPictureGroup.getById(id)?.pictures
        }
        
        _galleryName = manifestObject.GalleryNameList?.first?.value
        imageURL = _metadata?.imageURL ?? pictures?.first?.thumbnailImageURL
        if let subTypeString = manifestObject.SubTypeList?.first, subType = GallerySubType(rawValue: subTypeString) {
            self.subType = subType
        }
    }
    
    // MARK: Helper Methods
    /**
        Check if Gallery is of the specified sub-type
     
        - Parameters:
            - type: Sub-type of TimedEvent
     
        - Returns: `true` if the Gallery is of the specified sub-type
     */
    public func isSubType(subType: GallerySubType) -> Bool {
        return (self.subType == subType)
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMGallery` object by unique identifier
     
        - Parameters:
            - id: Unique identifier to search for
     
        - Returns: Object associated with identifier if it exists
     */
    static func getById(id: String) -> NGDMGallery? {
        return NGDMManifest.sharedInstance.galleries[id]
    }
    
}