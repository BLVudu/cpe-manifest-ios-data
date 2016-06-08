import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEMoneyType : NSObject{
    
    var currency: String?
    
    /**
    the type's underlying value
    */
    var value: Double?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        let decFormatter = NSNumberFormatter()
        decFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        decFormatter.decimalSeparator = "."
        
        let currencyAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "currency").UTF8String)
        let currencyAttrValue = xmlTextReaderGetAttribute(reader, currencyAttrName)
        if(currencyAttrValue != nil) {
            
            self.currency = String.fromCString(UnsafePointer<CChar>(currencyAttrValue))
            xmlFree(currencyAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let decFormatter = NSNumberFormatter()
        decFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        decFormatter.decimalSeparator = "."
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("#text" == _currentElementName){
                    let contentValue = xmlTextReaderConstValue(reader)
                    if(contentValue != nil) {
                        
                        let decFormatter = NSNumberFormatter()
                        decFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                        decFormatter.decimalSeparator = "."
                        let value = String.fromCString(UnsafePointer<CChar>(contentValue))
                        if value != nil {
                            let trimmed = value!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                            self.value = decFormatter.numberFromString(trimmed)!.doubleValue
                        }
                    }
                } else  if(true) {
                    print("Ignoring unexpected in NGEMoneyType: \(_currentElementName)")
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
        
        if(self.currency != nil) {
            
            dict["currency"] = self.currency!
            
        }
        
        if(self.value != nil) {
            
            dict["value"] = self.value!
            
        }
        
        return dict
    }*/
    
}

