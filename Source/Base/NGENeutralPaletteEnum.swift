
import Foundation

enum NGENeutralPaletteEnum : Int {
    case Unknown = -1
    case light
    case dark
    
    private static let namesArray = ["Unknown","light","dark"]
    
    static func toString(enumType:NGENeutralPaletteEnum) -> String {
        let i = enumType.rawValue + 1
        return namesArray[i];
    }
    
    static func fromString(enumString:String?) -> NGENeutralPaletteEnum {
        if var enumString = enumString {
            if(NumberFormatter().number(from: enumString) != nil) {
                enumString = "Value\(enumString)"
            }
            if let i = namesArray.index(of: enumString) {
                if let enumType = NGENeutralPaletteEnum(rawValue:i-1) {
                    return enumType
                }
            }
        }
        return .Unknown
        
    }
}

