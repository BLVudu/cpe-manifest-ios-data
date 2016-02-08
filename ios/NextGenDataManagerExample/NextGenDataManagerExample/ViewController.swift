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
        
        if let manifest = NGEMediaManifestType.NGEMediaManifestTypeFromFile(NSBundle.mainBundle().pathForResource("mos_hls_manifest_v3", ofType: "xml")!) {
            print(manifest.Inventory?.MetadataList?.first?.BasicMetadata?.ReleaseDate)
        }
    }
    
}

