//
//  ViewController.swift
//  NextGenDataManagerExample
//
//  Created by Alec Ananian on 2/1/16.
//  Copyright © 2016 Warner Bros. All rights reserved.
//

import UIKit
import NextGenDataManager

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try NGDMManifest.sharedInstance.loadManifestXMLFile(Bundle.main.path(forResource: "mos_hls_manifest_r60-v0.4", ofType: "xml")!)
            print("Main Experience ID: \(NGDMManifest.sharedInstance.mainExperience?.id)")
        } catch {
            print("Error loading manifest file")
        }
    }
    
}

