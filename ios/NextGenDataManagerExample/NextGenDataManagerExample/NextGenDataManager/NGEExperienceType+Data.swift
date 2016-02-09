//
//  NGEExperienceType+Data.swift
//  NextGenDataManagerExample
//
//  Created by Alec Ananian on 2/8/16.
//  Copyright © 2016 Warner Bros. All rights reserved.
//

import Foundation

extension NGEExperienceType {
    
    func metadata() -> NGEInventoryMetadataType? {
        return NextGenDataManager.sharedInstance.metadataByContentId(self.ContentID!)
    }
    
}