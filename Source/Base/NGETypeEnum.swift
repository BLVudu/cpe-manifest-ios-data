
import Foundation

enum NGETypeEnum : Int {
    case Unknown = -1
    case manifest
    case metadata
    case media
    case transaction
    case ancillary
    
    private static let namesArray = ["Unknown","manifest","metadata","media","transaction","ancillary"]
    
    static func toString(enumType:NGETypeEnum) -> String {
        let i = enumType.rawValue + 1
        return namesArray[i];
    }
    
    static func fromString(enumString:String?) -> NGETypeEnum {
        if var enumString = enumString {
            if(NumberFormatter().number(from: enumString) != nil) {
                enumString = "Value\(enumString)"
            }
            if let i = namesArray.index(of: enumString) {
                if let enumType = NGETypeEnum(rawValue:i-1) {
                    return enumType
                }
            }
        }
        return .Unknown
        
    }
}

