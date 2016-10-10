import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGECompObjClassType : NSObject{
    
    var `hasOtherInclusions`: Bool?
    
    /**
    the type's underlying value
    */
    var value: String?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "hasOtherInclusions") {
            
            self.hasOtherInclusions = (String(cString: attrValue) == "true")
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
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
                            let value = String(cString: contentValue)
                            self.value = value
                        }
                    } else  if(true) {
                        print("Ignoring unexpected in NGECompObjClassType: \(_currentElementName)")
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

