//
//  NGDMMetadata.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

class NGDMMetadata {
    
    private static var objectMap = [String: NGDMMetadata]()
    private var _manifestObject: NGEInventoryMetadataType!
    
    var id: String {
        get {
            return _manifestObject.ContentID
        }
    }
    
    private var _localizedInfoManifestObjectMap = [String: NGEBasicMetadataInfoType]()
    private var _localizedInfo: NGEBasicMetadataInfoType? {
        get {
            return localizedInfo("en")
        }
    }
    
    var title: String {
        get {
            if let str = _localizedInfo?.TitleDisplayUnlimited {
                return str
            }
            
            return ""
        }
    }
    
    var description: String {
        get {
            if let str = _localizedInfo?.Summary4000?.value {
                return str
            }
            
            if let str = _localizedInfo?.Summary400?.value {
                return str
            }
            
            if let str = _localizedInfo?.Summary190?.value {
                return str
            }
            
            return ""
        }
    }
    
    var thumbnailImagePath: String? {
        get {
            if let artReferenceList = _localizedInfo?.ArtReferenceList, artReference = artReferenceList.first {
                return artReference.value
            }
            
            return nil
        }
    }
    
    init(manifestObject: NGEInventoryMetadataType) {
        _manifestObject = manifestObject
    }
    
    func localizedInfo(language: String) -> NGEBasicMetadataInfoType? {
        if _localizedInfoManifestObjectMap.count == 0 {
            if let localizedInfoList = _manifestObject.BasicMetadata?.LocalizedInfoList {
                for localizedInfo in localizedInfoList {
                    _localizedInfoManifestObjectMap[localizedInfo.language] = localizedInfo
                }
            }
        }
        
        return _localizedInfoManifestObjectMap[language]
    }
    
    static func getById(id: String) -> NGDMMetadata? {
        if objectMap.count == 0 {
            if let objList = NextGenDataManager.sharedInstance.manifest.Inventory.MetadataList {
                for obj in objList {
                    objectMap[obj.ContentID] = NGDMMetadata(manifestObject: obj)
                }
            }
        }
        
        return objectMap[id]
    }
    
}