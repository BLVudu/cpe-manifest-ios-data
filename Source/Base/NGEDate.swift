import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDate : NSObject{
    
    var `scheduled`: Bool?
    
    /**
    the type's underlying value
    */
    var value: Date?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {let dateOnlyFormatter = DateFormatter()
    dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
    dateOnlyFormatter.timeZone = TimeZone(abbreviation:"UTC")
    
    if let attrValue = xmlTextReaderGetAttribute(reader, "scheduled") {
        
        self.scheduled = (String(cString: attrValue) == "true")
        xmlFree(attrValue)
    }
}

init(_ reader: xmlTextReaderPtr) {
    let _complexTypeXmlDept = xmlTextReaderDepth(reader)
    super.init()
    let dateOnlyFormatter = DateFormatter()
    dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
    dateOnlyFormatter.timeZone = TimeZone(abbreviation:"UTC")
    
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
                        let dateOnlyFormatter = DateFormatter()
                        dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
                        dateOnlyFormatter.timeZone = TimeZone(abbreviation:"UTC")
                        
                        let value = String(cString: contentValue)
                        let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
                        self.value = dateOnlyFormatter.date(from: trimmed)
                        
                    }
                } else  if(true) {
                    print("Ignoring unexpected in NGEDate: \(_currentElementName)")
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

