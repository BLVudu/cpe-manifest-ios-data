
import Foundation

enum NGEStringVideoPicFrameRateMultiplierEnum : Int {
    case Unknown = -1
    case Value1000Over1001
    
    private static let namesArray = ["Unknown","Value1000Over1001"]
    
    static func toString(enumType:NGEStringVideoPicFrameRateMultiplierEnum) -> String {
        let i = enumType.rawValue + 1
        return namesArray[i];
    }
    
    static func fromString(enumString:String?) -> NGEStringVideoPicFrameRateMultiplierEnum {
        if var enumString = enumString {
            if(NumberFormatter().number(from: enumString) != nil) {
                enumString = "Value\(enumString)"
            }
            if let i = namesArray.index(of: enumString) {
                if let enumType = NGEStringVideoPicFrameRateMultiplierEnum(rawValue:i-1) {
                    return enumType
                }
            }
        }
        return .Unknown
        
    }
}

