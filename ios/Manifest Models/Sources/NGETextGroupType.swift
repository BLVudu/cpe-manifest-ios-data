
import Foundation

@objc
class NGETextGroupType : NSObject{
    
    var TextGroupID: String!
    
    var TextObjectIDList: [String]!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let TextGroupIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "TextGroupID").UTF8String)
        let TextGroupIDAttrValue = xmlTextReaderGetAttribute(reader, TextGroupIDAttrName)
        if(TextGroupIDAttrValue != nil) {
            
            self.TextGroupID = String.fromCString(UnsafePointer<CChar>(TextGroupIDAttrValue))
            xmlFree(TextGroupIDAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var TextObjectIDListArray = [String]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("TextObjectID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TextObjectIDElementValue = xmlTextReaderConstValue(reader)
                    if TextObjectIDElementValue != nil {
                        
                        TextObjectIDListArray.append(String.fromCString(UnsafePointer<CChar>(TextObjectIDElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGETextGroupType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(TextObjectIDListArray.count > 0) { self.TextObjectIDList = TextObjectIDListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.TextGroupID != nil) {
            
            dict["TextGroupID"] = self.TextGroupID!
            
        }
        
        if(self.TextObjectIDList != nil) {
            
            dict["TextObjectIDList"] = self.TextObjectIDList!
            
        }
        
        return dict
    }*/
    
}

