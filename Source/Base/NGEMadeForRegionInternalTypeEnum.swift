
import Foundation

enum NGEMadeForRegionInternalTypeEnum : Int {
    case Unknown = -1
    case Domestic
    case International
    
    private static let namesArray = ["Unknown","Domestic","International"]
    
    static func toString(enumType:NGEMadeForRegionInternalTypeEnum) -> String {
        let i = enumType.rawValue + 1
        return namesArray[i];
    }
    
    static func fromString(enumString:String?) -> NGEMadeForRegionInternalTypeEnum {
        if var enumString = enumString {
            if(NumberFormatter().number(from: enumString) != nil) {
                enumString = "Value\(enumString)"
            }
            if let i = namesArray.index(of: enumString) {
                if let enumType = NGEMadeForRegionInternalTypeEnum(rawValue:i-1) {
                    return enumType
                }
            }
        }
        return .Unknown
        
    }
}

