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
        
        if let filePath = Bundle.main.path(forResource: "mos_manifest", ofType: "xml") {
            NGDMManifest.createInstance()
            
            do {
                try NGDMManifest.sharedInstance.loadManifestXMLFile(filePath)
                print("Main Experience ID: \(NGDMManifest.sharedInstance.mainExperience?.id)")
            } catch {
                print("Error loading Manifest file")
            }
        } else {
            print("No Manifest file found")
        }
    }
    
}

