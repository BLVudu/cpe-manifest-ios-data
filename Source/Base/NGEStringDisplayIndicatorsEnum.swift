
import Foundation

enum NGEStringDisplayIndicatorsEnum : Int {
    case Unknown = -1
    case CC
    case F
    case P
    case DD
    case SAP
    case DVS
    
    private static let namesArray = ["Unknown","CC","F","P","DD","SAP","DVS"]
    
    static func toString(enumType:NGEStringDisplayIndicatorsEnum) -> String {
        let i = enumType.rawValue + 1
        return namesArray[i];
    }
    
    static func fromString(enumString:String?) -> NGEStringDisplayIndicatorsEnum {
        if var enumString = enumString {
            if(NumberFormatter().number(from: enumString) != nil) {
                enumString = "Value\(enumString)"
            }
            if let i = namesArray.index(of: enumString) {
                if let enumType = NGEStringDisplayIndicatorsEnum(rawValue:i-1) {
                    return enumType
                }
            }
        }
        return .Unknown
        
    }
}

