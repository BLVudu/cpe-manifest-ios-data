import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGECompObjDataType : NGECompObjType {
    
    var `CompObjID`: String?
    
    var `DisplayNameList`: [NGEDisplayName]?
    
    override func readAttributes(_ reader: xmlTextReaderPtr) {
        super.readAttributes(reader)
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "CompObjID") {
            
            self.CompObjID = String(cString: attrValue)
            xmlFree(attrValue)
        }
    }
    
    override init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init(reader)
        
        var DisplayNameListArray = [NGEDisplayName]()
        
        var _readerOk:Int32=1
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("DisplayName" == _currentElementName) {
                        
                        DisplayNameListArray.append(NGEDisplayName(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGECompObjDataType: \(_currentElementName)")
                        if superclass != NSObject.self {
                            break
                        }
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(DisplayNameListArray.count > 0) { self.DisplayNameList = DisplayNameListArray }
    }
    
}

