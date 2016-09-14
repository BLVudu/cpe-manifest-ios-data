
import Foundation

enum NGEOrientationEnum : Int {
    case Unknown = -1
    case Landscape
    case Portrait
    
    private static let namesArray = ["Unknown","Landscape","Portrait"]
    
    static func toString(enumType:NGEOrientationEnum) -> String {
        let i = enumType.rawValue + 1
        return namesArray[i];
    }
    
    static func fromString(enumString:String?) -> NGEOrientationEnum {
        if var enumString = enumString {
            if(NumberFormatter().number(from: enumString) != nil) {
                enumString = "Value\(enumString)"
            }
            if let i = namesArray.index(of: enumString) {
                if let enumType = NGEOrientationEnum(rawValue:i-1) {
                    return enumType
                }
            }
        }
        return .Unknown
        
    }
}

