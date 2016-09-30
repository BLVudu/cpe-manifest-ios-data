//
//  NGDMTheme.swift
//

import Foundation

open class NGDMTheme {
    
    // MARK: Instance Variables
    /// Unique identifier
    var id: String
    
    /// Overlay buttons
    var buttons = [String: NGDMImage]() // Label: NGDMImage
    
    // MARK: Initialization
    /**
        Initializes a new Theme
     
        - Parameters:
            - manifestObject: Raw Manifest data object
     */
    init(manifestObject: NGEThemeType) {
        id = manifestObject.ThemeID
        
        if let objList = manifestObject.ButtonImageSet?.ButtonList {
            for obj in objList {
                if let label = obj.label {
                    buttons[label] = NGDMImage.getById(obj.Default.BaseImage)
                }
            }
        }
    }
    
}
