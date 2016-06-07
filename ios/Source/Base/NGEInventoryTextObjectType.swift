
import Foundation

@objc
class NGEInventoryTextObjectType : NSObject{
    
    var TextObjectID: String!
    
    var language: String?
    
    var ContainerReference: NGEContainerReference!
    
    var SubtitleID: String!
    
    var TextStringList: [NGETextString]!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let TextObjectIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "TextObjectID").UTF8String)
        let TextObjectIDAttrValue = xmlTextReaderGetAttribute(reader, TextObjectIDAttrName)
        if(TextObjectIDAttrValue != nil) {
            
            self.TextObjectID = String.fromCString(UnsafePointer<CChar>(TextObjectIDAttrValue))
            xmlFree(TextObjectIDAttrValue)
        }
        let languageAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "language").UTF8String)
        let languageAttrValue = xmlTextReaderGetAttribute(reader, languageAttrName)
        if(languageAttrValue != nil) {
            
            self.language = String.fromCString(UnsafePointer<CChar>(languageAttrValue))
            xmlFree(languageAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var TextStringListArray = [NGETextString]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("ContainerReference" == _currentElementName) {
                    
                    self.ContainerReference = NGEContainerReference(reader: reader)
                    handledInChild = true
                    
                } else if("SubtitleID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SubtitleIDElementValue = xmlTextReaderConstValue(reader)
                    if SubtitleIDElementValue != nil {
                        
                        self.SubtitleID = String.fromCString(UnsafePointer<CChar>(SubtitleIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TextString" == _currentElementName) {
                    
                    TextStringListArray.append(NGETextString(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEInventoryTextObjectType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(TextStringListArray.count > 0) { self.TextStringList = TextStringListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.TextObjectID != nil) {
            
            dict["TextObjectID"] = self.TextObjectID!
            
        }
        
        if(self.language != nil) {
            
            dict["language"] = self.language!
            
        }
        
        if(self.ContainerReference != nil) {
            dict["ContainerReference"] = self.ContainerReference!
        }
        
        if(self.SubtitleID != nil) {
            
            dict["SubtitleID"] = self.SubtitleID!
            
        }
        
        if(self.TextStringList != nil) {
            dict["TextStringList"] = self.TextStringList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

