
import Foundation

enum NGEGenderEnum : Int {
    case Unknown = -1
    case male
    case female
    case neutral
    case plural
    
    private static let namesArray = ["Unknown","male","female","neutral","plural"]
    
    static func toString(enumType:NGEGenderEnum) -> String {
        let i = enumType.rawValue + 1
        return namesArray[i];
    }
    
    static func fromString(enumString:String?) -> NGEGenderEnum {
        if var enumString = enumString {
            if(NumberFormatter().number(from: enumString) != nil) {
                enumString = "Value\(enumString)"
            }
            if let i = namesArray.index(of: enumString) {
                if let enumType = NGEGenderEnum(rawValue:i-1) {
                    return enumType
                }
            }
        }
        return .Unknown
        
    }
}

