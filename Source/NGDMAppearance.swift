//
//  NGDMAppearance.swift
//  NextGen
//
//  Created by Sedinam Gadzekpo on 4/28/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation
import UIKit

enum NGDMAppearanceType {
    case Main
    case InMovie
    case OutOfMovie
}

//Wrapper class for app appreance: animated background, buttons, background image, etc
class NGDMAppearance {
    
    private struct NGDMAppearanceTitle {
        static let ManOfSteel = "md:experiencedid:eidr-x:C80F-C561-EE65-C5E4-C039-U:feature"
        static let Minions = "md:experiencedid:eidr-x:F1F8-3CDA-0844-0D78-E520-Q:main.1"
        static let Sisters = "md:experiencedid:eidr-x:3026-0E8C-3824-6701-A2FC-8:main.1"
        static let SistersUnrated = "md:experiencedid:eidr-x:D2E8-4520-9446-BFAD-B106-4:main.1"
    }
    
    private var type = NGDMAppearanceType.Main
    
    var backgroundImageURL: NSURL? {
        get {
            if CurrentManifest.mainExperience.id == NGDMAppearanceTitle.ManOfSteel {
                if type == .InMovie {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_IME_bg.jpg")
                }
                
                if type == .OutOfMovie {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_Extras_bg.jpg")
                }
            }
            
            // FIXME: This appears to be the way Comcast defines background images
            if type == .Main {
                return CurrentManifest.outOfMovieExperience.metadata?.imageURL
            }
            
            return nil
        }
    }
    
    var backgroundVideoURL: NSURL? {
        get {
            if CurrentManifest.mainExperience.id == NGDMAppearanceTitle.ManOfSteel {
                return NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("mos-nextgen-background", ofType: "mp4")!)
            }
            
            return nil
        }
    }
    
    var backgroundVideoFadeTime: Double {
        get {
            if CurrentManifest.mainExperience.id == NGDMAppearanceTitle.ManOfSteel {
                return 8.5
            }
            
            return 0
        }
    }
    
    var backgroundVideoLoopTime: Double {
        get {
            return 14
        }
    }
    
    var titleImageURL: NSURL? {
        get {
            if CurrentManifest.mainExperience.id == NGDMAppearanceTitle.ManOfSteel {
                if type == .Main {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_title_treatment.png")
                }
                
                if type == .OutOfMovie {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_Extras_title.png")
                }
            }
            
            // FIXME: This appears to be the way Comcast defines title treatment
            if type == .Main {
                return CurrentManifest.inMovieExperience.metadata?.imageURL
            }
            
            return nil
        }
    }
    
    var titleImageCenterOffset: CGPoint? {
        get {
            if type == .Main {
                if CurrentManifest.mainExperience.id != NGDMAppearanceTitle.ManOfSteel {
                    return CGPointMake(0.5, 0.08)
                }
            }
            
            return nil
        }
    }
    
    var titleImageSizeOffset: CGSize? {
        get {
            if type == .Main {
                if CurrentManifest.mainExperience.id != NGDMAppearanceTitle.ManOfSteel {
                    return CGSizeMake(0.36, 0.16)
                }
            }
            
            return nil
        }
    }
    
    var buttonImageURL: NSURL? {
        get {
            if CurrentManifest.mainExperience.id == NGDMAppearanceTitle.ManOfSteel {
                if type == .InMovie {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/buttons/MOS_Play_button.png")
                }
                
                if type == .OutOfMovie {
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/buttons/MOS_Extras_button.png")
                }
            }
            
            return nil
        }
    }
    
    var buttonCenterOffset: CGPoint? {
        get {
            if CurrentManifest.mainExperience.id == NGDMAppearanceTitle.ManOfSteel {
                if type == .InMovie {
                    return CGPointMake(0.29, 0.46)
                }
                
                if type == .OutOfMovie {
                    return CGPointMake(0.29, 0.56)
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
    
    var buttonSizeOffset: CGSize? {
        get {
            if CurrentManifest.mainExperience.id == NGDMAppearanceTitle.ManOfSteel {
                if type == .InMovie {
                    return CGSizeMake(0.36, 0.13)
                }
                
                if type == .OutOfMovie {
                    return CGSizeMake(0.2, 0.1)
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
    
    required init(type: NGDMAppearanceType) {
        self.type = type
    }
    
}