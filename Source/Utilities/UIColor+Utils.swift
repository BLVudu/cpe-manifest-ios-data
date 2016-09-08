//
//  UIColor+Utils.swift
//

import Foundation

extension UIColor {
    
    convenience init(hexString: String) {
        var cString = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if cString.hasPrefix("#") {
            cString = cString.substringFromIndex(cString.startIndex.advancedBy(1))
        }
        
        var rgbValue: UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}