//
//  NGDMGallery.swift
//

import Foundation

public enum GallerySubType: String {
    case Gallery = "Gallery"
    case Turntable = "Turntable"
}

// Wrapper class for `NGEGalleryType` Manifest object
open class NGDMGallery {
    
    fileprivate struct Constants {
        static let SubTypeTurntable = "Turntable"
    }
    
    // MARK: Instance Variables
    /// Unique identifier
    open var id: String
    
    /// Metadata
    fileprivate var _metadata: NGDMMetadata?
    fileprivate var _galleryName: String?
    var title: String? {
        return _galleryName ?? _metadata?.title
    }
    
    /// Description to be used for display
    open var description: String? {
        return _metadata?.description
    }
    
    /// Thumbnail image URL to be used for display
    var imageURL: URL?
    
    /// Pictures associated with this Gallery
    open var pictures: [NGDMPicture]
    
    /// Whether or not this Gallery should be displayed as a turntable
    fileprivate var subType = GallerySubType.Gallery
    open var isTurntable: Bool {
        return isSubType(.Turntable)
    }
    
    /// Total number of items in this gallery
    open var totalCount: Int {
        return pictures.count
    }
    
    // MARK: Initialization
    /**
        Initializes a new Gallery based on Manifest object
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEGalleryType) {
        id = manifestObject.GalleryID ?? UUID().uuidString
        
        if let id = manifestObject.ContentID {
            _metadata = NGDMMetadata.getById(id)
        }
        
        if let subTypeString = manifestObject.SubTypeList?.first, let subType = GallerySubType(rawValue: subTypeString) {
            self.subType = subType
        }
        
        if let id = manifestObject.PictureGroupID, let pictures = NGDMManifest.sharedInstance.pictureGroups[id] {
            if subType == .Turntable {
                self.pictures = [NGDMPicture]()
                
                var turntableStrideBy = 1
                if #available(iOS 9.3, *) {
                    turntableStrideBy = 4
                } else {
                    turntableStrideBy = 10
                }
                
                for i in stride(from: 0, to: pictures.count, by: turntableStrideBy) {
                    self.pictures.append(pictures[i])
                }
            } else {
                self.pictures = pictures
            }
        } else {
            pictures = [NGDMPicture]()
        }
        
        _galleryName = manifestObject.GalleryNameList?.first?.value
        
        imageURL = _metadata?.imageURL as URL?? ?? pictures.first?.thumbnailImageURL as URL?
    }
 
    /**
        Initializes a new Gallery based on list of Pictures
     
        - Parameters:
            - pictures: Pictures associated with this Gallery
     */
    public init(pictures: [NGDMPicture]) {
        id = UUID().uuidString
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
    open func isSubType(_ subType: GallerySubType) -> Bool {
        return (self.subType == subType)
    }
    
    /**
        Get the Picture associated with the given page number
 
        - Parameters:
            - page: Page number
 
        - Returns:
            - Picture for the given page number, if one exists
    */
    open func getPictureForPage(_ page: Int) -> NGDMPicture? {
        return (pictures.count > page ? pictures[page] : nil)
    }
    
    /**
        Get the image URL for the Picture associated with the given page number
 
        - Parameters:
            - page: Page number
 
        - Returns:
            - Image URL for the given page number, if one exists
    */
    open func getImageURLForPage(_ page: Int) -> URL? {
        if let picture = getPictureForPage(page) {
            return picture.imageURL as URL?
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
    static func getById(_ id: String) -> NGDMGallery? {
        return NGDMManifest.sharedInstance.galleries[id]
    }
    
}
