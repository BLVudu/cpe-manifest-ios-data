import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEBackgroundOverlayAreaType : NGEImageSubAreaType {
    
    var `tag`: String?
    
    var `priority`: Int?
    
    override func readAttributes(_ reader: xmlTextReaderPtr) {
        super.readAttributes(reader)
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "tag") {
            
            self.tag = String(cString: attrValue)
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "priority") {
            
            self.priority = numFormatter.number(from: String(cString: attrValue))!.intValue
            xmlFree(attrValue)
        }
    }
    
    override init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init(reader)
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        var _readerOk:Int32=1
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if(true) {
                        print("Ignoring unexpected in NGEBackgroundOverlayAreaType: \(_currentElementName)")
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

