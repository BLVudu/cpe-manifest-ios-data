
import Foundation

enum NGEStringVideoPicPixelAspectEnum : Int {
    case Unknown = -1
    case NTSC
    case PAL
    case square
    case other
    
    private static let namesArray = ["Unknown","NTSC","PAL","square","other"]
    
    static func toString(enumType:NGEStringVideoPicPixelAspectEnum) -> String {
        let i = enumType.rawValue + 1
        return namesArray[i];
    }
    
    static func fromString(enumString:String?) -> NGEStringVideoPicPixelAspectEnum {
        if var enumString = enumString {
            if(NumberFormatter().number(from: enumString) != nil) {
                enumString = "Value\(enumString)"
            }
            if let i = namesArray.index(of: enumString) {
                if let enumType = NGEStringVideoPicPixelAspectEnum(rawValue:i-1) {
                    return enumType
                }
            }
        }
        return .Unknown
        
    }
}

