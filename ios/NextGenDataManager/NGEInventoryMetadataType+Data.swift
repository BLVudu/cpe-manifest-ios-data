//
//  NGEInventoryMetadataType+Data.swift
//  NextGenDataManagerExample
//
//  Created by Alec Ananian on 2/9/16.
//  Copyright © 2016 Warner Bros. All rights reserved.
//

import Foundation

extension NGEInventoryMetadataType {
    
    func localizedInfo() -> NGEBasicMetadataInfoType? {
        return localizedInfo("en")
    }
    
    func localizedInfo(language: String) -> NGEBasicMetadataInfoType? {
        if let localizedInfoList = self.BasicMetadata?.LocalizedInfoList {
            if (localizedInfoList.count > 1) {
                for localizedInfo in localizedInfoList {
                    if localizedInfo.language == language {
                        return localizedInfo
                    }
                }
            }
            
            return localizedInfoList.first
        }
        
        return nil
    }
    
    func fullTitle() -> String? {
        if let info = self.localizedInfo() {
            return info.TitleDisplayUnlimited != nil ? info.TitleDisplayUnlimited! : info.TitleSort
        }
        
        return nil
    }
    
    func fullSummary() -> String? {
        if let info = self.localizedInfo() {
            if let summary = info.Summary4000 {
                return summary.value
            }
            
            if let summary = info.Summary400 {
                return summary.value
            }
            
            return info.Summary190.value
        }
        
        return nil
    }
    
    func thumbnailImage() -> String? {
        if let info = self.localizedInfo() {
            if info.ArtReferenceList?.count > 0 {
                return info.ArtReferenceList!.first!.value
            }
        }
        
        return nil
    }
    
}