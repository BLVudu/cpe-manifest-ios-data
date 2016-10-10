import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEInventoryMetadataAliasType : NSObject{
    
    var `ContentID`: String!
    
    var `LocalizedPairList`: [NGEInventoryMetadataLocalizedPairType]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "ContentID") {
            
            self.ContentID = String(cString: attrValue)
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var LocalizedPairListArray = [NGEInventoryMetadataLocalizedPairType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("LocalizedPair" == _currentElementName) {
                        
                        LocalizedPairListArray.append(NGEInventoryMetadataLocalizedPairType(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEInventoryMetadataAliasType: \(_currentElementName)")
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
        
        if(LocalizedPairListArray.count > 0) { self.LocalizedPairList = LocalizedPairListArray }
    }
    
}

