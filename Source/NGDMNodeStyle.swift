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

public enum BackgroundScaleMethod: String {
    case BestFit = "BestFit"
    case Full = "Full"
    case Tiled = "Tiled"
}

public enum BackgroundPositionMethod: String {
    case UpperLeft = "upperleft"
    case UpperRight = "upperright"
    case Centered = "centered"
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
    
    /// Background properties
    public var backgroundColor = UIColor.blackColor()
    public var backgroundScaleMethod = BackgroundScaleMethod.BestFit
    public var backgroundPositionMethod = BackgroundPositionMethod.Centered
    
    /// Background image
    public var backgroundImageURL: NSURL?
    
    /// Background video
    var backgroundPresentation: NGDMPresentation?
    public var backgroundVideoLoops = false
    public var backgroundVideoLoopTimecode = 0.0
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
            
            if let colorString = backgroundObj.Color {
                backgroundColor = UIColor(hexString: colorString)
            }
            
            if let backgroundAdaptationObj = backgroundObj.Adaptation {
                if let rawString = backgroundAdaptationObj.ScaleMethod, scaleMethod = BackgroundScaleMethod(rawValue: rawString) {
                    backgroundScaleMethod = scaleMethod
                }
                
                if let rawString = backgroundAdaptationObj.PositioningMethod, positionMethod = BackgroundPositionMethod(rawValue: rawString) {
                    backgroundPositionMethod = positionMethod
                }
            }
            
            if let backgroundVideoObj = backgroundObj.Video {
                if let id = backgroundVideoObj.PresentationID {
                    backgroundPresentation = NGDMPresentation.getById(id)
                }
                
                if let timecodeString = backgroundVideoObj.LoopTimecode?.value {
                    backgroundVideoLoopTimecode = Double(timecodeString) ?? 0.0
                }
            }
            
            if let backgroundImagePictureGroupId = backgroundObj.Image?.PictureGroupID {
                backgroundImageURL = NGDMManifest.sharedInstance.pictureGroups[backgroundImagePictureGroupId]?.first?.imageURL
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