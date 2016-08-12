//
//  NGDMImage.swift
//

import Foundation

// Wrapper class for `NGEInventoryImageType` Manifest object
public class NGDMImage {
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// URL associated with this Image
    public var url: NSURL?
    
    /// Size of the Image as specified in Manifest file
    public var size = CGSizeZero
    
    // MARK: Initialization
    /**
        Initializes a new Image
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEInventoryImageType) {
        id = manifestObject.ImageID ?? NSUUID().UUIDString
        
        if let containerLocation = manifestObject.ContainerReference?.ContainerLocationList?.first?.value  {
            if containerLocation.containsString("file://") {
                let tempURL = NSURL(fileURLWithPath: containerLocation.stringByReplacingOccurrencesOfString("file://", withString: ""))
                url = NSBundle.mainBundle().URLForResource(tempURL.URLByDeletingPathExtension!.path, withExtension: tempURL.pathExtension)
            } else {
                url = NSURL(string: containerLocation)
            }
        }
        
        size = CGSizeMake(CGFloat(manifestObject.Width), CGFloat(manifestObject.Height))
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMImage` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(id: String) -> NGDMImage? {
        return NGDMManifest.sharedInstance.images[id]
    }
    
}