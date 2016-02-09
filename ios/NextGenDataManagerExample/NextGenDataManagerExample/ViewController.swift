//
//  ViewController.swift
//  NextGenDataManagerExample
//
//  Created by Alec Ananian on 2/1/16.
//  Copyright © 2016 Warner Bros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NextGenDataManager.sharedInstance.loadXMLFile(NSBundle.mainBundle().pathForResource("mos_hls_manifest_v3", ofType: "xml")!) {
            for experience in NextGenDataManager.sharedInstance.allExtras() {
                print(experience.metadata()?.BasicMetadata?.LocalizedInfoList?.first?.TitleDisplayUnlimited)
            }
        }
    }
    
}

