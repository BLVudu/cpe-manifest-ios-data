//
//  NGDMAppearance.swift
//

import Foundation
import UIKit

public enum NGDMAppearanceType {
    case main
    case inMovie
    case outOfMovie
}

//Wrapper class for app appreance: animated background, buttons, background image, etc
open class NGDMAppearance {
    
    fileprivate struct NGDMAppearanceTitle {
        static let ManOfSteel = "md:experiencedid:eidr-x:C80F-C561-EE65-C5E4-C039-U:feature"
        static let BvS = "md:experiencedid:eidr-x:B257-8696-871C-A12B-B8C1-S:feature"
        static let Minions = "md:experiencedid:eidr-x:F1F8-3CDA-0844-0D78-E520-Q:main.1"
        static let Sisters = "md:experiencedid:eidr-x:3026-0E8C-3824-6701-A2FC-8:main.1"
        static let SistersUnrated = "md:experiencedid:eidr-x:D2E8-4520-9446-BFAD-B106-4:main.1"
    }
    
    fileprivate var type = NGDMAppearanceType.main
    
    open var backgroundImageURL: URL? {
        get {
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.ManOfSteel {
                if type == .inMovie {
                    return URL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_IME_bg.jpg")
                }
                
                if type == .outOfMovie {
                    return URL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_Extras_bg_notitle.jpg")
                }
            }
            
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.BvS {
                if type == .inMovie {
                    return URL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_IME_bg.jpg")
                }
                
                if type == .outOfMovie {
                    return URL(string: "http://wb-extras.warnerbros.com/extrasplus/prod/Manifest/BatmanvSuperman/artwork/backgrounds/BVS_EXTRAS_BG.jpg")
                }
            }
            
            // FIXME: This appears to be the way Comcast defines background images
            if type == .main {
                return NGDMManifest.sharedInstance.outOfMovieExperience?.metadata?.imageURL as URL?
            }
            
            return nil
        }
    }
    
    open var backgroundVideoURL: URL? {
        get {
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.ManOfSteel {
                return URL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_INTRO_BG.mp4")
            }
            
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.BvS {
                return URL(string: "http://wb-extras.warnerbros.com/extrasplus/prod/Manifest/BatmanvSuperman/artwork/backgrounds/BVS_INTRO_BG.mp4")
            }
            
            return nil
        }
    }
    
    open var backgroundVideoFadeTime: Double {
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
    
    open var backgroundVideoLoopTime: Double {
        get {
            return 14
        }
    }
    
    open var titleImageURL: URL? {
        get {
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.ManOfSteel {
                if type == .main {
                    return URL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_title_treatment.png")
                }
                
                if type == .outOfMovie {
                    return URL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_Extras_title.png")
                }
            }
            
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.BvS {
                return nil
            }
            
            // FIXME: This appears to be the way Comcast defines title treatment
            if type == .main {
                return NGDMManifest.sharedInstance.inMovieExperience?.metadata?.imageURL as URL?
            }
            
            return nil
        }
    }
    
    open var titleImageCenterOffset: CGPoint? {
        get {
            if type == .main {
                if NGDMManifest.sharedInstance.mainExperience?.id != NGDMAppearanceTitle.ManOfSteel {
                    return CGPoint(x: 0.5, y: 0.08)
                }
            }
            
            return nil
        }
    }
    
    open var titleImageSizeOffset: CGSize? {
        get {
            if type == .main {
                if NGDMManifest.sharedInstance.mainExperience?.id != NGDMAppearanceTitle.ManOfSteel {
                    return CGSize(width: 0.36, height: 0.16)
                }
            }
            
            return nil
        }
    }
    
    open var buttonImageURL: URL? {
        get {
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.ManOfSteel {
                if type == .inMovie {
                    return URL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/buttons/MOS_Play_button.png")
                }
                
                if type == .outOfMovie {
                    return URL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/buttons/MOS_Extras_button.png")
                }
            }
            
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.BvS {
                if type == .inMovie {
                    return URL(string: "http://wb-extras.warnerbros.com/extrasplus/prod/Manifest/BatmanvSuperman/artwork/buttons/BVS_BTN_PLAYMOVIE.png")
                }
                
                if type == .outOfMovie {
                    return URL(string: "http://wb-extras.warnerbros.com/extrasplus/prod/Manifest/BatmanvSuperman/artwork/buttons/BVS_BTN_EXTRAS.png")
                }
            }
            
            return nil
        }
    }
    
    open var buttonCenterOffset: CGPoint? {
        get {
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.ManOfSteel {
                if type == .inMovie {
                    return CGPoint(x: 0.29, y: 0.46)
                }
                
                if type == .outOfMovie {
                    return CGPoint(x: 0.29, y: 0.56)
                }
            }
            
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.BvS {
                if type == .inMovie {
                    return CGPoint(x: 260 / 1024, y: 515 / 768)
                }
                
                if type == .outOfMovie {
                    return CGPoint(x: 260 / 1024, y: 570 / 768)
                }
            }
            
            if type == .inMovie {
                return CGPoint(x: 0.5, y: 0.2)
            }
            
            if type == .outOfMovie {
                return CGPoint(x: 0.5, y: 0.28)
            }
            
            return nil
        }
    }
    
    open var buttonSizeOffset: CGSize? {
        get {
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.ManOfSteel {
                if type == .inMovie {
                    return CGSize(width: 0.36, height: 0.13)
                }
                
                if type == .outOfMovie {
                    return CGSize(width: 0.2, height: 0.1)
                }
            }
            
            if NGDMManifest.sharedInstance.mainExperience?.id == NGDMAppearanceTitle.BvS {
                if type == .inMovie {
                    return CGSize(width: 274 / 1024, height: 58 / 768)
                }
                
                if type == .outOfMovie {
                    return CGSize(width: 174 / 1024, height: 48 / 768)
                }
            }
            
            if type == .inMovie {
                return CGSize(width: 0.36, height: 0.08)
            }
            
            if type == .outOfMovie {
                return CGSize(width: 0.2, height: 0.06)
            }
            
            return nil
        }
    }
    
    required public init(type: NGDMAppearanceType) {
        self.type = type
    }
    
}
