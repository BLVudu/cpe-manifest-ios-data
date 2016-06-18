//
//  String+Utils.swift
//

import Foundation

extension String {
    
    func stringByAddingPercentEncodingForURLQueryValue() -> String? {
        let allowedCharacters = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        return self.stringByAddingPercentEncodingWithAllowedCharacters(allowedCharacters)
    }
    
    func iso8601TimeInSeconds() -> NSTimeInterval {
        if self.characters.count > 2 && self[0] == "P" && self[1] == "T" {
            var currentNumberString = ""
            var hours = 0, minutes = 0, seconds = 0
            
            let timeString = self[2...self.characters.count - 1]
            for i in 0 ..< timeString.characters.count {
                if timeString[i] == "H" {
                    hours = Int(currentNumberString)!
                    currentNumberString = ""
                } else if timeString[i] == "M" {
                    minutes = Int(currentNumberString)!
                    currentNumberString = ""
                } else if timeString[i] == "S" {
                    seconds = Int(currentNumberString)!
                    currentNumberString = ""
                } else {
                    currentNumberString += timeString[i]
                }
            }
            
            return NSTimeInterval((hours * 3600) + (minutes * 60) + seconds)
        }
        
        return 0
    }
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = startIndex.advancedBy(r.startIndex)
        let end = start.advancedBy(r.endIndex - r.startIndex)
        return self[start ..< end]
    }
    
}