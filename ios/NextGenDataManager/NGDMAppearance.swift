//
//  NGDMAppearance.swift
//  NextGen
//
//  Created by Sedinam Gadzekpo on 4/28/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

enum NGDMAppearanceType {
    case Main
    case InMovie
    case OutOfMovie
}

//Wrapper class for app appreance: animated background, buttons, background image, etc
class NGDMAppearance {
    
    private struct NGDMAppearanceTitle {
        static let ManOfSteel = "md:experiencedid:eidr-x:C80F-C561-EE65-C5E4-C039-U:feature"
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
            } else if type == .Main {
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
                switch type {
                case .Main:
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_title_treatment.png")
                    
                case .OutOfMovie:
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/backgrounds/MOS_Extras_title.png")
                    
                default:
                    return nil
                }
            }
            
            return nil
        }
    }
    
    var titleImageOrigin: CGPoint? {
        get {
            if type == .Main {
                return CGPointMake(121, 245)
            }
            
            return nil
        }
    }
    
    var titleImageSize: CGSize? {
        get {
            if type == .Main {
                return CGSizeMake(345, 55)
            }
            
            return nil
        }
    }
    
    var buttonImageURL: NSURL? {
        get {
            if CurrentManifest.mainExperience.id == NGDMAppearanceTitle.ManOfSteel {
                switch type {
                case .InMovie:
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/buttons/MOS_Play_button.png")
                    
                case .OutOfMovie:
                    return NSURL(string: "http://wb-extras.warnerbros.com/extrasplus/staging/Manifest/MOS/artwork/buttons/MOS_Extras_button.png")
                    
                default:
                    return nil
                }
            }
            
            return nil
        }
    }
    
    var buttonOrigin: CGPoint? {
        get {
            switch type {
            case .InMovie:
                return CGPointMake(110, 303)
                
            case .OutOfMovie:
                return CGPointMake(195, 390)
                
            default:
                return nil
            }
        }
    }
    
    var buttonSize: CGSize? {
        get {
            switch type {
            case .InMovie:
                return CGSizeMake(370, 100)
                
            case .OutOfMovie:
                return CGSizeMake(200, 77)
                
            default:
                return nil
            }
        }
    }
    
    required init(type: NGDMAppearanceType) {
        self.type = type
    }
    
}