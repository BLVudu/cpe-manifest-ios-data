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

open class NGDMNodeStyle {
    
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
    open var backgroundColor = UIColor.black
    open var backgroundScaleMethod = BackgroundScaleMethod.BestFit
    open var backgroundPositionMethod = BackgroundPositionMethod.Centered
    
    /// Background image
    open var backgroundImage: NGDMImage?
    
    /// Background video
    private var backgroundPresentation: NGDMPresentation?
    open var backgroundVideoLoops = false
    open var backgroundVideoLoopTimecode = 0.0
    open var backgroundVideo: NGDMVideo? {
        return backgroundPresentation?.video
    }
    
    /// Background audio
    open var backgroundAudio: NGDMAudio?
    
    /// Button overlay
    open var buttonOverlaySize: CGSize?
    open var buttonOverlayBottomLeft: CGPoint?
    
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
                if let rawString = backgroundAdaptationObj.ScaleMethod, let scaleMethod = BackgroundScaleMethod(rawValue: rawString) {
                    backgroundScaleMethod = scaleMethod
                }
                
                if let rawString = backgroundAdaptationObj.PositioningMethod, let positionMethod = BackgroundPositionMethod(rawValue: rawString) {
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
                backgroundImage = NGDMManifest.sharedInstance.pictureGroups[backgroundImagePictureGroupId]?.first?.image
            }
            
            if let backgroundAudioObj = backgroundObj.AudioLoop {
                if let id = backgroundAudioObj.AudioTrackID {
                    backgroundAudio = NGDMAudio.getById(id)
                }
            }
            
            if let overlayObjList = backgroundObj.OverlayAreaList {
                for overlayObj in overlayObjList {
                    if overlayObj.tag == "button" {
                        buttonOverlaySize = CGSize(width: CGFloat(overlayObj.WidthPixels), height: CGFloat(overlayObj.HeightPixels))
                        buttonOverlayBottomLeft = CGPoint(x: CGFloat(overlayObj.PixelsFromLeft), y: CGFloat(overlayObj.PixelsFromBottom))
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
    open func getButtonImage(_ label: String) -> NGDMImage? {
        return theme.buttons[label]
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMNodeStyle` object by unique identifier
     
        - Parameters:
            - id: Unique identifier to search for
     
        - Returns: Object associated with identifier if it exists
     */
    open static func getById(_ id: String) -> NGDMNodeStyle? {
        return NGDMManifest.sharedInstance.nodeStyles[id]
    }
    
}
