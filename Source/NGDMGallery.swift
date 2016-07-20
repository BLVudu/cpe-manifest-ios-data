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
        return _metadata?.description
    }
    
    /// Thumbnail image URL to be used for display
    var imageURL: NSURL?
    
    /// Pictures associated with this Gallery
    public var pictures: [NGDMPicture]
    
    /// Whether or not this Gallery should be displayed as a turntable
    private var subType = GallerySubType.Gallery
    public var isTurntable: Bool {
        return isSubType(.Turntable)
    }
    
    /// Total number of items in this gallery
    public var totalCount: Int {
        return pictures.count
    }
    
    // MARK: Initialization
    /**
        Initializes a new Gallery based on Manifest object
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEGalleryType) {
        id = manifestObject.GalleryID ?? NSUUID().UUIDString
        
        if let id = manifestObject.ContentID {
            _metadata = NGDMMetadata.getById(id)
        }
        
        if let subTypeString = manifestObject.SubTypeList?.first, subType = GallerySubType(rawValue: subTypeString) {
            self.subType = subType
        }
        
        if let id = manifestObject.PictureGroupID, pictures = NGDMManifest.sharedInstance.pictureGroups[id] {
            if subType == .Turntable {
                self.pictures = [NGDMPicture]()
                for i in 0.stride(to: pictures.count, by: max(Int(ceil(Double(pictures.count) / 50)), 1)) {
                    self.pictures.append(pictures[i])
                }
            } else {
                self.pictures = pictures
            }
        } else {
            pictures = [NGDMPicture]()
        }
        
        _galleryName = manifestObject.GalleryNameList?.first?.value
        
        imageURL = _metadata?.imageURL ?? pictures.first?.thumbnailImageURL
    }
 
    /**
        Initializes a new Gallery based on list of Pictures
     
        - Parameters:
            - pictures: Pictures associated with this Gallery
     */
    public init(pictures: [NGDMPicture]) {
        id = NSUUID().UUIDString
        self.pictures = pictures
    }
    
    // MARK: Helper Methods
    /**
        Check if Gallery is of the specified sub-type
            - Parameters:
                - type: Sub-type of TimedEvent
     
            - Returns: `true` if the Gallery is of the specified sub-type
                - pictures: Pictures associated with this Gallery
    */
    public func isSubType(subType: GallerySubType) -> Bool {
        return (self.subType == subType)
    }
    
    /**
        Get the Picture associated with the given page number
 
        - Parameters:
            - page: Page number
 
        - Returns:
            - Picture for the given page number, if one exists
    */
    public func getPictureForPage(page: Int) -> NGDMPicture? {
        return (pictures.count > page ? pictures[page] : nil)
    }
    
    /**
        Get the image URL for the Picture associated with the given page number
 
        - Parameters:
            - page: Page number
 
        - Returns:
            - Image URL for the given page number, if one exists
    */
    public func getImageURLForPage(page: Int) -> NSURL? {
        if let picture = getPictureForPage(page) {
            return picture.imageURL
        }
        
        return nil
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