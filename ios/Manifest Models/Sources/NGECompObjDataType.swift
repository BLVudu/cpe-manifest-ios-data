
import Foundation

@objc
class NGECompObjDataType : NGECompObjType {
    
    var CompObjID: String?
    
    var DisplayNameList: [NGEDisplayName]?
    
    override func readAttributes(reader: xmlTextReaderPtr) {
        super.readAttributes(reader)
        
        let CompObjIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "CompObjID").UTF8String)
        let CompObjIDAttrValue = xmlTextReaderGetAttribute(reader, CompObjIDAttrName)
        if(CompObjIDAttrValue != nil) {
            
            self.CompObjID = String.fromCString(UnsafePointer<CChar>(CompObjIDAttrValue))
            xmlFree(CompObjIDAttrValue)
        }
    }
    
    override init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init(reader: reader)
        
        var DisplayNameListArray = [NGEDisplayName]()
        
        var _readerOk:Int32=1
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("DisplayName" == _currentElementName) {
                    
                    DisplayNameListArray.append(NGEDisplayName(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGECompObjDataType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(DisplayNameListArray.count > 0) { self.DisplayNameList = DisplayNameListArray }
    }
    
    /*override var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        for (name, value) in super.dictionary {
            dict[name] = value
        }
        
        if(self.CompObjID != nil) {
            
            dict["CompObjID"] = self.CompObjID!
            
        }
        
        if(self.DisplayNameList != nil) {
            dict["DisplayNameList"] = self.DisplayNameList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

