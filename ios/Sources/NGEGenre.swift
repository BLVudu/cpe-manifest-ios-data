
import Foundation

@objc
class NGEGenre : NSObject{
    
    var source: NSURL?
    
    var identifier: String?
    
    var level: Int?
    
    /**
    the type's underlying value
    */
    var value: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let sourceAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "source").UTF8String)
        let sourceAttrValue = xmlTextReaderGetAttribute(reader, sourceAttrName)
        if(sourceAttrValue != nil) {
            
            self.source = NSURL(string: String.fromCString(UnsafePointer<CChar>(sourceAttrValue))!)
            xmlFree(sourceAttrValue)
        }
        let idAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "id").UTF8String)
        let idAttrValue = xmlTextReaderGetAttribute(reader, idAttrName)
        if(idAttrValue != nil) {
            
            self.identifier = String.fromCString(UnsafePointer<CChar>(idAttrValue))
            xmlFree(idAttrValue)
        }
        let levelAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "level").UTF8String)
        let levelAttrValue = xmlTextReaderGetAttribute(reader, levelAttrName)
        if(levelAttrValue != nil) {
            
            self.level = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(levelAttrValue))!)!.integerValue
            xmlFree(levelAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
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
                    print("Ignoring unexpected: \(_currentElementName)")
                    //break
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.source != nil) {
            
            dict["source"] = self.source!
            
        }
        
        if(self.identifier != nil) {
            
            dict["identifier"] = self.identifier!
            
        }
        
        if(self.level != nil) {
            
            dict["level"] = self.level!
            
        }
        
        if(self.value != nil) {
            
            dict["value"] = self.value!
            
        }
        
        return dict
    }*/
    
}

