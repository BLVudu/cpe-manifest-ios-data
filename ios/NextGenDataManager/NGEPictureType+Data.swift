//
//  NGEPictureType+Data.swift
//  NextGen
//
//  Created by Alec Ananian on 2/11/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

extension NGEPictureType {
    
    func imageURL() -> NSURL? {
        if let image = NextGenDataManager.sharedInstance.imageById(self.ImageID), imageURL = image.ContainerReference?.ContainerLocation {
            return NSURL(string: imageURL)!
        }
        
        return nil
    }
    
    func thumbnailImageURL() -> NSURL? {
        if let thumbnailImageId = self.ThumbnailImageID, image = NextGenDataManager.sharedInstance.imageById(thumbnailImageId), imageURL = image.ContainerReference?.ContainerLocation {
            return NSURL(string: imageURL)!
        }
        
        return nil
    }
    
}