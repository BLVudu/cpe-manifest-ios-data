//
//  NGDMNodeStyle.swift
//

import Foundation

public enum DeviceTargetClass: String {
    case Mobile = "Mobile"
}

public enum DeviceTargetSubClass: String {
    case Tablet = "Tablet"
    case Phone = "Phone"
}

public class NGDMNodeStyle {
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// Properties
    var supportsLandscape = false
    var supportsPortrait = false
    var supportsTablet = false
    var supportsPhone = false
    
    /// General theme (includes buttons)
    var theme: NGDMTheme!
    
    /// Background video
    var backgroundPresentation: NGDMPresentation?
    public var backgroundVideoLoops = false
    public var backgroundVideoURL: NSURL? {
        return backgroundPresentation?.videoURL
    }
    
    /// Button overlay
    public var buttonOverlaySize: CGSize?
    public var buttonOverlayBottomLeft: CGPoint?
    
    // MARK: Initialization
    /**
        Initializes a new NodeStyle
     
        - Parameters:
            - manifestObject: Raw Manifest data object
     */
    init(manifestObject: NGENodeStyleType) {
        id = manifestObject.NodeStyleID
        
        if let backgroundObj = manifestObject.Background {
            backgroundVideoLoops = backgroundObj.looping != nil && backgroundObj.looping!
            
            if let id = backgroundObj.Video?.PresentationID {
                backgroundPresentation = NGDMPresentation.getById(id)
            }
            
            if let overlayObjList = backgroundObj.OverlayAreaList {
                for overlayObj in overlayObjList {
                    if overlayObj.tag == "button" {
                        buttonOverlaySize = CGSizeMake(CGFloat(overlayObj.WidthPixels), CGFloat(overlayObj.HeightPixels))
                        buttonOverlayBottomLeft = CGPointMake(CGFloat(overlayObj.PixelsFromLeft), CGFloat(overlayObj.PixelsFromBottom))
                    }
                }
            }
        }
    }
    
    // MARK: Helper Methods
    /**
        Finds a button image with the given label

        - Parameters:
            - label: Button label name to search
 
        - Returns: Button image if it exists
    */
    public func getButtonImage(label: String) -> NGDMImage? {
        return theme.buttons[label]
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMNodeStyle` object by unique identifier
     
        - Parameters:
            - id: Unique identifier to search for
     
        - Returns: Object associated with identifier if it exists
     */
    public static func getById(id: String) -> NGDMNodeStyle? {
        return NGDMManifest.sharedInstance.nodeStyles[id]
    }
    
}