//
//  NGDMLocation.swift
//

// Wrapper class for `NGEEventLocationType` Manifest object
public class NGDMLocation {
    
    // MARK: Instance Variables
    /// Metadata
    public var name: String?
    public var address: String?
    var icon: NGDMImage?
    public var iconImage: UIImage? {
        if let icon = icon {
            return NGDMManifest.sharedInstance.imageCache[icon.id]
        }
        
        return nil
    }
    
    /// Coordinates
    public var latitude: Double = 0
    public var longitude: Double = 0
    
    // MARK: Initialization
    /**
        Initializes a new NGETimedEventType
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEEventLocationType) {
        name = manifestObject.Name
        if let obj = manifestObject as? NGELocation, id = obj.icon {
            icon = NGDMImage.getById(id)
        }
        
        address = manifestObject.Address
        latitude = manifestObject.EarthCoordinate?.Latitude ?? 0
        longitude = manifestObject.EarthCoordinate?.Longitude ?? 0
    }
    
}