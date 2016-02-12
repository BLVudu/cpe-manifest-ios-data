//
//  NGEGalleryType+Data.swift
//  NextGen
//
//  Created by Alec Ananian on 2/11/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

extension NGEGalleryType {
    
    func metadata() -> NGEInventoryMetadataType? {
        return NextGenDataManager.sharedInstance.metadataByContentId(self.ContentID!)
    }
    
    func pictures() -> [NGEPictureType] {
        if let pictureGroup = NextGenDataManager.sharedInstance.pictureGroupById(self.PictureGroupID) {
            return pictureGroup.PictureList
        }
        
        return []
    }
    
}