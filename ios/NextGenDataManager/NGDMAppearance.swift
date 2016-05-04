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
    
    private var type = NGDMAppearanceType.Main
    
    var backgroundImage: UIImage? {
        get {
            switch type {
            case .InMovie:
                return UIImage(named: "MOSIMEBackground")
                
            case .OutOfMovie:
                return UIImage(named: "MOSExtrasBackground")
                
            default:
                return UIImage(named: "MOSBackground")
            }
        }
    }
    
    var backgroundVideoURL: NSURL? {
        get {
            return NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("mos-nextgen-background", ofType: "mp4")!)
        }
    }
    
    var backgroundVideoFadeTime: Double {
        get {
            return 8.5
        }
    }
    
    var backgroundVideoLoopTime: Double {
        get {
            return 14
        }
    }
    
    var titleImage: UIImage? {
        get {
            switch type {
            case .Main:
                return UIImage(named: "MOSLogo")
                
            case .OutOfMovie:
                return UIImage(named: "MOSExtrasTitle")
                
            default:
                return nil
            }
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
    
    var buttonImage: UIImage? {
        get {
            switch type {
            case .InMovie:
                return UIImage(named: "MOSPlay")
                
            case .OutOfMovie:
                return UIImage(named: "MOSExtras")
                
            default:
                return nil
            }
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