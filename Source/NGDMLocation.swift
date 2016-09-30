//
//  NGDMLocation.swift
//

// Wrapper class for `NGEEventLocationType` Manifest object
open class NGDMLocation {
    
    // MARK: Instance Variables
    /// Metadata
    open var name: String?
    open var address: String?
    var icon: NGDMImage?
    open var iconImage: UIImage? {
        if let icon = icon {
            return NGDMManifest.sharedInstance.imageCache[icon.id]
        }
        
        return nil
    }
    
    /// Coordinates
    open var latitude: Double = 0
    open var longitude: Double = 0
    
    // MARK: Initialization
    /**
        Initializes a new NGETimedEventType
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEEventLocationType) {
        name = manifestObject.Name
        if let obj = manifestObject as? NGELocation, let id = obj.icon {
            icon = NGDMImage.getById(id)
        }
        
        address = manifestObject.Address
        latitude = manifestObject.EarthCoordinate?.Latitude ?? 0
        longitude = manifestObject.EarthCoordinate?.Longitude ?? 0
    }
    
}
