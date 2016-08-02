//
//  NGDMAppearance.swift
//

import Foundation
import UIKit

public enum NGDMAppearanceType {
    case Main
    case InMovie
    case OutOfMovie
}

//Wrapper class for app appreance: animated background, buttons, background image, etc
public class NGDMAppearance {
    
    private struct NGDMAppearanceTitle {
        static let ManOfSteel = "md:experiencedid:eidr-x:C80F-C561-EE65-C5E4-C039-U:feature"
        static let BvS = "md:experiencedid:eidr-x:B257-8696-871C-A12B-B8C1-S:feature"
        static let Minions = "md:experiencedid:eidr-x:F1F8-3CDA-0844-0D78-E520-Q:main.1"
        static let Sisters = "md:experiencedid:eidr-x:3026-0E8C-3824-6701-A2FC-8:main.1"
        static let SistersUnrated = "md:experiencedid:eidr-x:D2E8-4520-9446-BFAD-B106-4:main.1"
    }
    
    private var type = NGDMAppearanceType.Main
    
    public var backgroundImageURL: NSURL? {
        get {
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.ManOfSteel {
                if type == .InMovie {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_IME_bg.jpg")
                }
                
                if type == .OutOfMovie {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_Extras_bg_notitle.jpg")
                }
            }
            
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.BvS {
                if type == .InMovie {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_IME_bg.jpg")
                }
                
                if type == .OutOfMovie {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/prod/Manifest/BatmanvSuperman/artwork/backgrounds/BVS_EXTRAS_BG.jpg")
                }
            }
            
            // FIXME: This appears to be the way Comcast defines background images
            if type == .Main {
                return NGDMManifest.sharedInstance.outOfMovieExperience?.metadata?.imageURL
            }
            
            return nil
        }
    }
    
    public var backgroundVideoURL: NSURL? {
        get {
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.ManOfSteel {
                return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_INTRO_BG.mp4")
            }
            
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.BvS {
                return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/prod/Manifest/BatmanvSuperman/artwork/backgrounds/BVS_INTRO_BG.mp4")
            }
            
            return nil
        }
    }
    
    public var backgroundVideoFadeTime: Double {
        get {
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.ManOfSteel {
                return 8.5
            }
            
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.BvS {
                return 2
            }
            
            return 0
        }
    }
    
    public var backgroundVideoLoopTime: Double {
        get {
            return 14
        }
    }
    
    public var titleImageURL: NSURL? {
        get {
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.ManOfSteel {
                if type == .Main {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_title_treatment.png")
                }
                
                if type == .OutOfMovie {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_Extras_title.png")
                }
            }
            
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.BvS {
                return nil
            }
            
            // FIXME: This appears to be the way Comcast defines title treatment
            if type == .Main {
                return NGDMManifest.sharedInstance.inMovieExperience?.metadata?.imageURL
            }
            
            return nil
        }
    }
    
    public var titleImageCenterOffset: CGPoint? {
        get {
            if type == .Main {
                if NGDMManifest.sharedInstance.mainExperience?.id != NGDMAppearanceTitle.ManOfSteel {
                    return CGPointMake(0.5, 0.08)
                }
            }
            
            return nil
        }
    }
    
    public var titleImageSizeOffset: CGSize? {
        get {
            if type == .Main {
                if NGDMManifest.sharedInstance.mainExperience?.id != NGDMAppearanceTitle.ManOfSteel {
                    return CGSizeMake(0.36, 0.16)
                }
            }
            
            return nil
        }
    }
    
    public var buttonImageURL: NSURL? {
        get {
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.ManOfSteel {
                if type == .InMovie {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/buttons/MOS_Play_button.png")
                }
                
                if type == .OutOfMovie {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/buttons/MOS_Extras_button.png")
                }
            }
            
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.BvS {
                if type == .InMovie {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/prod/Manifest/BatmanvSuperman/artwork/buttons/BVS_BTN_PLAYMOVIE.png")
                }
                
                if type == .OutOfMovie {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/prod/Manifest/BatmanvSuperman/artwork/buttons/BVS_BTN_EXTRAS.png")
                }
            }
            
            return nil
        }
    }
    
    public var buttonCenterOffset: CGPoint? {
        get {
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.ManOfSteel {
                if type == .InMovie {
                    return CGPointMake(0.29, 0.46)
                }
                
                if type == .OutOfMovie {
                    return CGPointMake(0.29, 0.56)
                }
            }
            
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.BvS {
                if type == .InMovie {
                    return CGPointMake(260 / 1024, 515 / 768)
                }
                
                if type == .OutOfMovie {
                    return CGPointMake(260 / 1024, 570 / 768)
                }
            }
            
            if type == .InMovie {
                return CGPointMake(0.5, 0.2)
            }
            
            if type == .OutOfMovie {
                return CGPointMake(0.5, 0.28)
            }
            
            return nil
        }
    }
    
    public var buttonSizeOffset: CGSize? {
        get {
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.ManOfSteel {
                if type == .InMovie {
                    return CGSizeMake(0.36, 0.13)
                }
                
                if type == .OutOfMovie {
                    return CGSizeMake(0.2, 0.1)
                }
            }
            
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.BvS {
                if type == .InMovie {
                    return CGSizeMake(274 / 1024, 58 / 768)
                }
                
                if type == .OutOfMovie {
                    return CGSizeMake(174 / 1024, 48 / 768)
                }
            }
            
            if type == .InMovie {
                return CGSizeMake(0.36, 0.08)
            }
            
            if type == .OutOfMovie {
                return CGSizeMake(0.2, 0.06)
            }
            
            return nil
        }
    }
    
    required public init(type: NGDMAppearanceType) {
        self.type = type
    }
    
}