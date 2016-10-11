import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDateTimeRangeType : NSObject{
    
    var `Start`: Date!
    
    var `End`: Date!
    
    func readAttributes(_ reader: xmlTextReaderPtr) {let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
}

init(_ reader: xmlTextReaderPtr) {
    let _complexTypeXmlDept = xmlTextReaderDepth(reader)
    super.init()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    self.readAttributes(reader)
    
    var _readerOk = xmlTextReaderRead(reader)
    var _currentNodeType = xmlTextReaderNodeType(reader)
    var _currentXmlDept = xmlTextReaderDepth(reader)
    
    while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
        
        if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
            if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                let _currentElementName = String(cString: _currentElementNameXmlChar)
                if("Start" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    if let elementValue = xmlTextReaderConstValue(reader) {
                        
                        self.Start = dateFormatter.date(from: String(cString: elementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("End" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    if let elementValue = xmlTextReaderConstValue(reader) {
                        
                        self.End = dateFormatter.date(from: String(cString: elementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEDateTimeRangeType: \(_currentElementName)")
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

