import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEBackgroundOverlayAreaType : NGEImageSubAreaType {
    
    var tag: String?
    
    var priority: Int?
    
    override func readAttributes(reader: xmlTextReaderPtr) {
        super.readAttributes(reader)
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let tagAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "tag").UTF8String)
        let tagAttrValue = xmlTextReaderGetAttribute(reader, tagAttrName)
        if(tagAttrValue != nil) {
            
            self.tag = String.fromCString(UnsafePointer<CChar>(tagAttrValue))
            xmlFree(tagAttrValue)
        }
        let priorityAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "priority").UTF8String)
        let priorityAttrValue = xmlTextReaderGetAttribute(reader, priorityAttrName)
        if(priorityAttrValue != nil) {
            
            self.priority = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(priorityAttrValue))!)!.integerValue
            xmlFree(priorityAttrValue)
        }
    }
    
    override init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init(reader: reader)
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        var _readerOk:Int32=1
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if(true) {
                    print("Ignoring unexpected in NGEBackgroundOverlayAreaType: \(_currentElementName)")
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
    
    /*override var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        for (name, value) in super.dictionary {
            dict[name] = value
        }
        
        if(self.tag != nil) {
            
            dict["tag"] = self.tag!
            
        }
        
        if(self.priority != nil) {
            
            dict["priority"] = self.priority!
            
        }
        
        return dict
    }*/
    
}

