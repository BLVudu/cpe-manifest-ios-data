//
//  NSLocale+Utils.swift
//
//

import Foundation

extension NSLocale {
    
    public static func deviceLanguage() -> String {
        return NSLocale.currentLocale().localeIdentifier.stringByReplacingOccurrencesOfString("_", withString: "-")
    }
    
    public static func deviceLanguageBackup() -> String {
        let deviceLanguage = self.deviceLanguage()
        return deviceLanguage[deviceLanguage.startIndex ..< deviceLanguage.startIndex.advancedBy(2)]
    }
    
}