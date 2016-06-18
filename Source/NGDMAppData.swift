//
//  NGDMAppData.swift
//

import Foundation

// Wrapper class for `NGEExperienceAppType` Manifest object
public class NGDMAppData {
    
    private struct NVPairName {
        static let AppType = "type"
        static let Location = "location"
        static let Text = "text"
        static let Zoom = "zoom"
        static let VideoId = "video_id"
        static let GalleryId = "gallery_id"
        static let LocationThumbnail = "location_thumbnail"
        static let VideoThumbnail = "video_thumbnail"
        static let GalleryThumbnail = "gallery_thumbnail"
    }
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String!
    
    /// Metadata
    public var title: String? {
        return audioVisual?.metadata?.title ?? location?.name
    }
    
    public var displayText: String?
    public var imageURL: NSURL?
    var locationImageURL: NSURL?
    
    /// Media
    public var presentation: NGDMPresentation?
    public var audioVisual: NGDMAudioVisual?
    public var gallery: NGDMGallery?
    public var location: NGDMLocation?
    public var zoomLevel: Float = 0
    
    /// Check if AppData is location-based
    var isLocation: Bool {
        return location != nil
    }
    
    // MARK: Initialization
    /**
        Initializes a new AppData
     
        - Parameters:
            - manifestObject: Raw Manifest data object
     */
    init(manifestObject: NGEAppDataType) {
        id = manifestObject.AppID
        
        for obj in manifestObject.NVPairList {
            switch obj.Name {
            case NVPairName.Text:
                displayText = obj.Text
                break
                
            case NVPairName.Location:
                if let obj = obj.Location {
                    location = NGDMLocation(manifestObject: obj)
                } else if let obj = obj.LocationSet?.LocationList?.first {
                    location = NGDMLocation(manifestObject: obj)
                }
                
                break
                
            case NVPairName.Zoom:
                zoomLevel = Float(obj.Integer ?? 0)
                break
                
            case NVPairName.VideoId:
                if let id = obj.PresentationID {
                    presentation = NGDMPresentation.getById(id)
                    audioVisual = NGDMAudioVisual.getById(id)
                }
                
                break
                
            case NVPairName.GalleryId:
                if let id = obj.Gallery?.GalleryID {
                    gallery = NGDMGallery.getById(id)
                }
                
                break
                
            case NVPairName.VideoThumbnail, NVPairName.GalleryThumbnail:
                if let id = obj.PictureID {
                    imageURL = NGDMImage.getById(id)?.url
                }
                
                break
                
            case NVPairName.LocationThumbnail:
                if let id = obj.PictureID {
                    locationImageURL = NGDMImage.getById(id)?.url
                }
                
            default:
                break
            }
        }
    }
    
}