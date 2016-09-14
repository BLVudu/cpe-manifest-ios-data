
import Foundation

enum NGEColorTypeTypeEnum : Int {
    case Unknown = -1
    case color
    case bandw
    case colorized
    case composite
    case unknown
    
    private static let namesArray = ["Unknown","color","bandw","colorized","composite","unknown"]
    
    static func toString(enumType:NGEColorTypeTypeEnum) -> String {
        let i = enumType.rawValue + 1
        return namesArray[i];
    }
    
    static func fromString(enumString:String?) -> NGEColorTypeTypeEnum {
        if var enumString = enumString {
            if(NumberFormatter().number(from: enumString) != nil) {
                enumString = "Value\(enumString)"
            }
            if let i = namesArray.index(of: enumString) {
                if let enumType = NGEColorTypeTypeEnum(rawValue:i-1) {
                    return enumType
                }
            }
        }
        return .Unknown
        
    }
}

