//
//  NGDMAppearance.swift
//  NextGen
//
//  Created by Sedinam Gadzekpo on 4/28/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

//Wrapper class for app appreance: animated background, buttons, background image, etc
class NGDMAppearance: NSObject{
    
    
    var backgroundImage: UIImage?
    
    var animatedBackground: NSURL?
    
    var playButtonImage: UIImage?
    
    var extrasButtonImage: UIImage?
    
    var titleLogoImage: UIImage?
    
    var playButtonRect: CGRect?
    
    var extrasButtonRect: CGRect?
    
    var titleLogoRect: CGRect?
    
    
    
    override init() {
        
        self.backgroundImage = UIImage(named: "MOSBackground")!
        self.animatedBackground = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("mos-nextgen-background", ofType: "mp4")!)
        self.playButtonImage = UIImage(named: "MOSPlay")!
        self.extrasButtonImage = UIImage(named: "MOSExtras")!
        self.titleLogoImage = UIImage(named: "MOSLogo")
        playButtonRect = CGRectMake(110, 303, 370, 100)
        extrasButtonRect = CGRectMake(195, 390, 200, 77)
        titleLogoRect = CGRectMake(121, 245, 345, 55)
        
        super.init()
        
        
    }
    
    
}