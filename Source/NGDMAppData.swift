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
        static let ExperienceId = "experience_id"
    }
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String!
    
    /// Metadata
    public var title: String? {
        return experience?.title
    }
    
    public var thumbnailImageURL: NSURL? {
        return experience?.imageURL
    }
    
    public var description: String? {
        return experience?.description
    }
    
    /// Media
    var experience: NGDMExperience?
    public var location: NGDMLocation?
    public var zoomLevel: Float = 0
    public var mediaCount: Int {
        return experience?.childExperiences?.count ?? 0
    }
    
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
                
            case NVPairName.ExperienceId:
                if let id = obj.ExperienceID {
                    experience = NGDMExperience.getById(id)
                }
                
                break
                
            default:
                break
            }
        }
    }
    
    // MARK: Helper Methods
    /**
        Finds the Experience media associated with the AppData at the specified index
     
        - Parameters:
            - index: Media index to search
     
        - Returns: Associated Experience if it exists
     */
    public func mediaAtIndex(index: Int) -> NGDMExperience? {
        if let experiences = experience?.childExperiences where index < mediaCount {
            return experiences[index]
        }
        
        return nil
    }
    
}