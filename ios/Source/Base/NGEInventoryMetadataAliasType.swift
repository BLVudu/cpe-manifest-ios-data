
import Foundation

@objc
class NGEInventoryMetadataAliasType : NSObject{
    
    var ContentID: String!
    
    var LocalizedPairList: [NGEInventoryMetadataLocalizedPairType]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let ContentIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "ContentID").UTF8String)
        let ContentIDAttrValue = xmlTextReaderGetAttribute(reader, ContentIDAttrName)
        if(ContentIDAttrValue != nil) {
            
            self.ContentID = String.fromCString(UnsafePointer<CChar>(ContentIDAttrValue))
            xmlFree(ContentIDAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
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
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("LocalizedPair" == _currentElementName) {
                    
                    LocalizedPairListArray.append(NGEInventoryMetadataLocalizedPairType(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEInventoryMetadataAliasType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(LocalizedPairListArray.count > 0) { self.LocalizedPairList = LocalizedPairListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.ContentID != nil) {
            
            dict["ContentID"] = self.ContentID!
            
        }
        
        if(self.LocalizedPairList != nil) {
            dict["LocalizedPairList"] = self.LocalizedPairList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

