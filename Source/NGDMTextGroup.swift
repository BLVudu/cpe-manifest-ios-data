//
//  NGDMTextGroup.swift
//

import Foundation

// Wrapper class for `NGETextGroupType` Manifest object
class NGDMTextGroup {
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// TextObject associated with this TextGroup
    var textObject: NGDMTextObject?
    
    // MARK: Initialization
    /**
        Initializes a new TextGroup
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGETextGroupType) {
        id = manifestObject.TextGroupID
        
        if let id = manifestObject.TextObjectIDList?.first {
            textObject = NGDMTextObject.getById(id)
        }
    }
    
    // MARK: Helper Methods
    /**
        Find child TextItem object by index
    
        - Parameters:
            - index: The index of the child TextString to look up
    
        - Returns: Value of the child TextString at the given `index` if it exists
    */
    func textItem(_ index: Int) -> String? {
        return textObject?.textItem(index)
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMTextGroup` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(_ id: String) -> NGDMTextGroup? {
        return NGDMManifest.sharedInstance.textGroups[id]
    }
    
}
