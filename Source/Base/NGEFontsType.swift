import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEFontsType : NSObject{
    
    var FontGroup: String!
    
    var CSSFontFamily: String?
    
    var CSS3FontProperties: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("FontGroup" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let FontGroupElementValue = xmlTextReaderConstValue(reader)
                    if FontGroupElementValue != nil {
                        
                        self.FontGroup = String.fromCString(UnsafePointer<CChar>(FontGroupElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("CSSFontFamily" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let CSSFontFamilyElementValue = xmlTextReaderConstValue(reader)
                    if CSSFontFamilyElementValue != nil {
                        
                        self.CSSFontFamily = String.fromCString(UnsafePointer<CChar>(CSSFontFamilyElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("CSS3FontProperties" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let CSS3FontPropertiesElementValue = xmlTextReaderConstValue(reader)
                    if CSS3FontPropertiesElementValue != nil {
                        
                        self.CSS3FontProperties = String.fromCString(UnsafePointer<CChar>(CSS3FontPropertiesElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEFontsType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.FontGroup != nil) {
            
            dict["FontGroup"] = self.FontGroup!
            
        }
        
        if(self.CSSFontFamily != nil) {
            
            dict["CSSFontFamily"] = self.CSSFontFamily!
            
        }
        
        if(self.CSS3FontProperties != nil) {
            
            dict["CSS3FontProperties"] = self.CSS3FontProperties!
            
        }
        
        return dict
    }*/
    
}

