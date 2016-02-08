
import Foundation

@objc
class NGEDigitalAssetVideoPictureProgressiveType : NSObject{
    
    var scanOrder: NGEStringVideoPicProgressiveScanOrderEnum?
    
    /**
    the type's underlying value
    */
    var value: Bool?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let scanOrderAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "scanOrder").UTF8String)
        let scanOrderAttrValue = xmlTextReaderGetAttribute(reader, scanOrderAttrName)
        if(scanOrderAttrValue != nil) {
            
            self.scanOrder = NGEStringVideoPicProgressiveScanOrderEnum.fromString(String.fromCString(UnsafePointer<CChar>(scanOrderAttrValue)))
            
            xmlFree(scanOrderAttrValue)
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
                        self.value = (value == "true")
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
        
        if(self.scanOrder != nil) {
            
            let obj = NGEStringVideoPicProgressiveScanOrderEnum.toString(self.scanOrder!)
            dict["scanOrder"] = obj
            
        }
        
        if(self.value != nil) {
            
            dict["value"] = self.value!
            
        }
        
        return dict
    }*/
    
}

