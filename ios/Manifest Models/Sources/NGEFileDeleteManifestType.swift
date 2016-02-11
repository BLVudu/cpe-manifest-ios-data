
import Foundation

@objc
class NGEFileDeleteManifestType : NGEFileManifestType {
    
    var type: String!
    
    var reference: String?
    
    var Description: String?
    
    var Instructions: String?
    
    override func readAttributes(reader: xmlTextReaderPtr) {
        super.readAttributes(reader)
        
        let typeAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "type").UTF8String)
        let typeAttrValue = xmlTextReaderGetAttribute(reader, typeAttrName)
        if(typeAttrValue != nil) {
            
            self.type = String.fromCString(UnsafePointer<CChar>(typeAttrValue))
            xmlFree(typeAttrValue)
        }
        let referenceAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "reference").UTF8String)
        let referenceAttrValue = xmlTextReaderGetAttribute(reader, referenceAttrName)
        if(referenceAttrValue != nil) {
            
            self.reference = String.fromCString(UnsafePointer<CChar>(referenceAttrValue))
            xmlFree(referenceAttrValue)
        }
    }
    
    override init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init(reader: reader)
        
        var _readerOk:Int32=1
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Description" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let DescriptionElementValue = xmlTextReaderConstValue(reader)
                    if DescriptionElementValue != nil {
                        
                        self.Description = String.fromCString(UnsafePointer<CChar>(DescriptionElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Instructions" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let InstructionsElementValue = xmlTextReaderConstValue(reader)
                    if InstructionsElementValue != nil {
                        
                        self.Instructions = String.fromCString(UnsafePointer<CChar>(InstructionsElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEFileDeleteManifestType: \(_currentElementName)")
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
        
        if(self.type != nil) {
            
            dict["type"] = self.type!
            
        }
        
        if(self.reference != nil) {
            
            dict["reference"] = self.reference!
            
        }
        
        if(self.Description != nil) {
            
            dict["Description"] = self.Description!
            
        }
        
        if(self.Instructions != nil) {
            
            dict["Instructions"] = self.Instructions!
            
        }
        
        return dict
    }*/
    
}

