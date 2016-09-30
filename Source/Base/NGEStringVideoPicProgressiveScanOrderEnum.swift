
import Foundation

enum NGEStringVideoPicProgressiveScanOrderEnum : Int {
    case Unknown = -1
    case BFF
    case TFF
    case PPF
    
    private static let namesArray = ["Unknown","BFF","TFF","PPF"]
    
    static func toString(enumType:NGEStringVideoPicProgressiveScanOrderEnum) -> String {
        let i = enumType.rawValue + 1
        return namesArray[i];
    }
    
    static func fromString(enumString:String?) -> NGEStringVideoPicProgressiveScanOrderEnum {
        if var enumString = enumString {
            if(NumberFormatter().number(from: enumString) != nil) {
                enumString = "Value\(enumString)"
            }
            if let i = namesArray.index(of: enumString) {
                if let enumType = NGEStringVideoPicProgressiveScanOrderEnum(rawValue:i-1) {
                    return enumType
                }
            }
        }
        return .Unknown
        
    }
}

