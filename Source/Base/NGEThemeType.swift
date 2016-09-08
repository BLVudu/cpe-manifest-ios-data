import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEThemeType : NSObject{
    
    var ThemeID: String!
    
    var ColorPalette: NGEColorPaletteType?
    
    var ButtonImageSet: NGEButtonSetType?
    
    var Fonts: NGEFontsType?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let ThemeIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "ThemeID").UTF8String)
        let ThemeIDAttrValue = xmlTextReaderGetAttribute(reader, ThemeIDAttrName)
        if(ThemeIDAttrValue != nil) {
            
            self.ThemeID = String.fromCString(UnsafePointer<CChar>(ThemeIDAttrValue))
            xmlFree(ThemeIDAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("ColorPalette" == _currentElementName) {
                    
                    self.ColorPalette = NGEColorPaletteType(reader: reader)
                    handledInChild = true
                    
                } else if("ButtonImageSet" == _currentElementName) {
                    
                    self.ButtonImageSet = NGEButtonSetType(reader: reader)
                    handledInChild = true
                    
                } else if("Fonts" == _currentElementName) {
                    
                    self.Fonts = NGEFontsType(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEThemeType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.ThemeID != nil) {
            
            dict["ThemeID"] = self.ThemeID!
            
        }
        
        if(self.ColorPalette != nil) {
            dict["ColorPalette"] = self.ColorPalette!
        }
        
        if(self.ButtonImageSet != nil) {
            dict["ButtonImageSet"] = self.ButtonImageSet!
        }
        
        if(self.Fonts != nil) {
            dict["Fonts"] = self.Fonts!
        }
        
        return dict
    }*/
    
}

