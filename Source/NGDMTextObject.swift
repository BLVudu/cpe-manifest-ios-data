//
//  NGDMTextObject.swift
//

import Foundation

// Wrapper class for `NGEInventoryTextObjectType` Manifest object
class NGDMTextObject {
    
    // MARK: Instance Variables
    /// Child TextStrings associated with this TextObject - Index: TextString value
    var textStrings = [Int: String]()
    
    /// Unique identifier
    var id: String
    
    // MARK: Initialization
    /**
        Initializes a new TextObject
    
        - Parameters:
            - manifestObject: Raw Manifest data object
    */
    init(manifestObject: NGEInventoryTextObjectType) {
        id = manifestObject.TextObjectID
    }

    // MARK: Helper Methods
    /**
        Find child TextString object by index

        - Parameters:
            - index: The index of the child TextString to look up

        - Returns: Value of the child TextString at the given `index` if it exists
    */
    func textItem(_ index: Int) -> String? {
        return textStrings[index]
    }
    
    // MARK: Search Methods
    /**
        Find an `NGDMTextObject` object by unique identifier
    
        - Parameters:
            - id: Unique identifier to search for
    
        - Returns: Object associated with identifier if it exists
    */
    static func getById(_ id: String) -> NGDMTextObject? {
        return NGDMManifest.sharedInstance.textObjects[id]
    }
    
}
