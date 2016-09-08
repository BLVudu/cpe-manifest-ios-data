import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDeviceClass : NSObject{
    
    var subClass: String?
    
    /**
    the type's underlying value
    */
    var value: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let subClassAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "subClass").UTF8String)
        let subClassAttrValue = xmlTextReaderGetAttribute(reader, subClassAttrName)
        if(subClassAttrValue != nil) {
            
            self.subClass = String.fromCString(UnsafePointer<CChar>(subClassAttrValue))
            xmlFree(subClassAttrValue)
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
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("#text" == _currentElementName){
                    let contentValue = xmlTextReaderConstValue(reader)
                    if(contentValue != nil) {
                        let value = String.fromCString(UnsafePointer<CChar>(contentValue))
                        self.value = value
                    }
                } else  if(true) {
                    print("Ignoring unexpected in NGEDeviceClass: \(_currentElementName)")
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
        
        if(self.subClass != nil) {
            
            dict["subClass"] = self.subClass!
            
        }
        
        if(self.value != nil) {
            
            dict["value"] = self.value!
            
        }
        
        return dict
    }*/
    
}

