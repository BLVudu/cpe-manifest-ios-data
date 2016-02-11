
import Foundation

@objc
class NGEBasicMetadataParentType : NSObject{
    
    var relationshipType: String?
    
    var Parent: NGEBasicMetadataType!
    
    var ParentContentID: String!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let relationshipTypeAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "relationshipType").UTF8String)
        let relationshipTypeAttrValue = xmlTextReaderGetAttribute(reader, relationshipTypeAttrName)
        if(relationshipTypeAttrValue != nil) {
            
            self.relationshipType = String.fromCString(UnsafePointer<CChar>(relationshipTypeAttrValue))
            xmlFree(relationshipTypeAttrValue)
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
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Parent" == _currentElementName) {
                    
                    self.Parent = NGEBasicMetadataType(reader: reader)
                    handledInChild = true
                    
                } else if("ParentContentID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ParentContentIDElementValue = xmlTextReaderConstValue(reader)
                    if ParentContentIDElementValue != nil {
                        
                        self.ParentContentID = String.fromCString(UnsafePointer<CChar>(ParentContentIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEBasicMetadataParentType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.relationshipType != nil) {
            
            dict["relationshipType"] = self.relationshipType!
            
        }
        
        if(self.Parent != nil) {
            dict["Parent"] = self.Parent!
        }
        
        if(self.ParentContentID != nil) {
            
            dict["ParentContentID"] = self.ParentContentID!
            
        }
        
        return dict
    }*/
    
}

