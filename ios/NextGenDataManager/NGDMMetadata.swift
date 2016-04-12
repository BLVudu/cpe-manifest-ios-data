//
//  NGDMMetadata.swift
//  NextGen
//
//  Created by Alec Ananian on 3/8/16.
//  Copyright © 2016 Warner Bros. Entertainment, Inc. All rights reserved.
//

import Foundation

// Wrapper class for `NGEInventoryMetadataType` Manifest object
class NGDMMetadata {
    
    // MARK: Static Variables
    /// Static mapping of all Metadatas - ContentID: Metadata
    private static var objectMap = [String: NGDMMetadata]()
    
    // MARK: Instance Variables
    /// Reference to the root Manifest object
    private var _manifestObject: NGEInventoryMetadataType!
    
    /// Unique identifier
    var id: String {
        get {
            return _manifestObject.ContentID
        }
    }
    
    /// Mapping of all LocalizedInfos for this Metadata - Language: LocalizedInfo
    private var _localizedInfoManifestObjectMap = [String: NGEBasicMetadataInfoType]()
    private var _localizedInfo: NGEBasicMetadataInfoType? {
        get {
            return localizedInfo(NSLocale.currentLanguage())
        }
    }
    
    /// Full title associated with this Metadata
    var title: String? {
        get {
            if let str = _localizedInfo?.TitleDisplayUnlimited {
                return str
            }
            
            return nil
        }
    }
    
    /// Full description or summary associated with this Metadata
    var description: String? {
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
            
            return nil
        }
    }
    
    /// Image URL to be used for display
    private var _imageURL: NSURL!
    var imageURL: NSURL? {
        get {
            if _imageURL == nil {
                if let artReferenceList = _localizedInfo?.ArtReferenceList, artReference = artReferenceList.reverse().first, url = artReference.value {
                    if url.containsString("file://") {
                        let tempURL = NSURL(fileURLWithPath: url.stringByReplacingOccurrencesOfString("file://", withString: ""))
                        _imageURL = NSBundle.mainBundle().URLForResource(tempURL.URLByDeletingPathExtension!.path, withExtension: tempURL.pathExtension)
                    } else {
                        _imageURL = NSURL(string: url)
                    }
                }
            }
            
            return _imageURL
        }
    }
    
    /// Direct access to Manifest PeopleList
    var PeopleList: [NGEBasicMetadataPeopleType]? {
        get {
            return _manifestObject.BasicMetadata?.PeopleList
        }
    }
    
    // MARK: Initialization
    /**
        Initializes a new Metadata
     
        - Parameters:
            - manifestObject: Raw Manifest data object
     */
    init(manifestObject: NGEInventoryMetadataType) {
        _manifestObject = manifestObject
    }
    
    // MARK: Helper Methods
    /**
        Get localized info associated with this Metadata by language

        - Parameters:
            - language: Desired language to search for

        - Returns: LocalizedInfo for the desired language if it exists
    */
    func localizedInfo(language: String) -> NGEBasicMetadataInfoType? {
        if _localizedInfoManifestObjectMap.count == 0 {
            if let localizedInfoList = _manifestObject.BasicMetadata?.LocalizedInfoList {
                for localizedInfo in localizedInfoList {
                    _localizedInfoManifestObjectMap[localizedInfo.language] = localizedInfo
                }
            }
        }
        
        return (_localizedInfoManifestObjectMap[language] != nil ? _localizedInfoManifestObjectMap[language] : _localizedInfoManifestObjectMap["en"])
    }
    
    /**
        Find any custom identifier associated with this Experience
     
        - Parameters:
            - namespace: The namespace of the custom identifier used in the Manifest (e.g. "thetake")
     
        - Returns: The value of the custom identifier if it exists
     */
    func customIdentifier(namespace: String) -> String? {
        if let altIdentifierList = _manifestObject.BasicMetadata?.AltIdentifierList {
            for altIdentifier in altIdentifierList {
                if altIdentifier.Namespace == namespace {
                    return altIdentifier.Identifier
                }
            }
        }
        
        return nil
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMMetadata` object by unique identifier
     
        - Parameters:
            - id: Unique identifier to search for
     
        - Returns: Object associated with identifier if it exists
     */
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