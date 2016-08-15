//
//  NGDMMetadata.swift
//

import Foundation

// Wrapper class for `NGEBasicMetadataInfoType` Manifest object
class NGDMLocalizedInfo {
    
    /// Metadata
    var language: String
    var title: String
    var description: String?
    var imageURL: NSURL?
    
    // MARK: Initialization
    /**
        Initializes a new LocalizedInfo
     
        - Parameters:
            - manifestObject: Raw Manifest data object
     */
    init(manifestObject: NGEBasicMetadataInfoType) {
        language = manifestObject.language
        title = manifestObject.TitleDisplayUnlimited ?? manifestObject.TitleDisplay60 ?? manifestObject.TitleDisplay19 ?? manifestObject.TitleSort
        description = manifestObject.Summary4000?.value ?? manifestObject.Summary400?.value ?? manifestObject.Summary190.value
        
        if let url = manifestObject.ArtReferenceList?.reverse().first?.value {
            if url.containsString("file://") {
                let tempURL = NSURL(fileURLWithPath: url.stringByReplacingOccurrencesOfString("file://", withString: ""))
                imageURL = NSBundle.mainBundle().URLForResource(tempURL.URLByDeletingPathExtension!.path, withExtension: tempURL.pathExtension)
            } else {
                imageURL = NSURL(string: url)
            }
        }
    }
    
}

// Wrapper class for `NGEInventoryMetadataType` Manifest object
public class NGDMMetadata {
    
    // MARK: Static Variables
    /// Static mapping of all Metadatas - ContentID: Metadata
    private static var objectMap = [String: NGDMMetadata]()
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// Mapping of all LocalizedInfos for this Metadata - Language: LocalizedInfo
    private var _defaultLocalizedInfo: NGDMLocalizedInfo?
    private var _localizedInfoMap = [String: NGDMLocalizedInfo]()
    private var _localizedInfo: NGDMLocalizedInfo? {
        return _localizedInfoMap[NSLocale.deviceLanguage()] ?? _localizedInfoMap[NSLocale.deviceLanguageBackup()] ?? _defaultLocalizedInfo ?? _localizedInfoMap["en-US"] ?? _localizedInfoMap["en"]
    }
    
    /// Mapping of all content identifiers for this Metadata - Namespace: Identifier
    private var _contentIdentifiers: [String: String]?
    
    /// Full title associated with this Metadata
    public var title: String? {
        return _localizedInfo?.title
    }
    
    /// Full description or summary associated with this Metadata
    public var description: String? {
        return _localizedInfo?.description
    }
    
    /// Image URL to be used for display
    var imageURL: NSURL? {
        return _localizedInfo?.imageURL
    }
    
    /// Mapping of all Talents for this Metadata - PeopleOtherID: Talent
    var talents: [String: NGDMTalent]?
    
    // MARK: Initialization
    /**
        Initializes a new Metadata
     
        - Parameters:
            - manifestObject: Raw Manifest data object
     */
    init(manifestObject: NGEInventoryMetadataType) {
        id = manifestObject.ContentID
        
        if let objList = manifestObject.BasicMetadata?.LocalizedInfoList {
            for obj in objList {
                let localizedInfo = NGDMLocalizedInfo(manifestObject: obj)
                _localizedInfoMap[localizedInfo.language] = localizedInfo
                
                if obj.isDefault != nil && obj.isDefault! {
                    _defaultLocalizedInfo = localizedInfo
                }
            }
        }
        
        if let objList = manifestObject.BasicMetadata?.AltIdentifierList {
            _contentIdentifiers = [String: String]()
            
            for obj in objList {
                _contentIdentifiers![obj.Namespace] = obj.Identifier
            }
        }
        
        if let objList = manifestObject.BasicMetadata?.PeopleList {
            talents = [String: NGDMTalent]()
            
            for obj in objList {
                let talent = NGDMTalent(manifestObject: obj)
                talents![talent.id] = talent
            }
        }
    }
    
    // MARK: Helper Methods
    /**
        Find any custom identifier associated with this Experience
     
        - Parameters:
            - namespace: The namespace of the custom identifier used in the Manifest (e.g. "thetake")
     
        - Returns: The value of the custom identifier if it exists
     */
    func customIdentifier(namespace: String) -> String? {
        return _contentIdentifiers?[namespace]
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMMetadata` object by unique identifier
     
        - Parameters:
            - id: Unique identifier to search for
     
        - Returns: Object associated with identifier if it exists
     */
    static func getById(id: String) -> NGDMMetadata? {
        return NGDMManifest.sharedInstance.metadatas[id]
    }
    
}