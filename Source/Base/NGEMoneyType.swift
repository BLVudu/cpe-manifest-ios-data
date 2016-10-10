import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEMoneyType : NSObject{
    
    var `currency`: String?
    
    /**
    the type's underlying value
    */
    var value: Double?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        let decFormatter = NumberFormatter()
        decFormatter.numberStyle = .decimal
        decFormatter.decimalSeparator = "."
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "currency") {
            
            self.currency = String(cString: attrValue)
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let decFormatter = NumberFormatter()
        decFormatter.numberStyle = .decimal
        decFormatter.decimalSeparator = "."
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("#text" == _currentElementName){
                        if let contentValue = xmlTextReaderConstValue(reader) {
                            
                            let decFormatter = NumberFormatter()
                            decFormatter.numberStyle = .decimal
                            decFormatter.decimalSeparator = "."
                            
                            let value = String(cString: contentValue)
                            let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
                            self.value = decFormatter.number(from: trimmed)!.doubleValue
                            
                        }
                    } else  if(true) {
                        print("Ignoring unexpected in NGEMoneyType: \(_currentElementName)")
                        if superclass != NSObject.self {
                            break
                        }
                    }
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
}

