//
//  NSLocale+Utils.swift
//
//

import Foundation

extension Locale {
    
    public static func deviceLanguage() -> String {
        return Locale.current.identifier.replacingOccurrences(of: "_", with: "-")
    }
    
    public static func deviceLanguageBackup() -> String {
        let deviceLanguage = self.deviceLanguage()
        return deviceLanguage[deviceLanguage.startIndex ..< deviceLanguage.characters.index(deviceLanguage.startIndex, offsetBy: 2)]
    }
    
}
