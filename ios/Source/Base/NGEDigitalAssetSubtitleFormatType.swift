
import Foundation

@objc
class NGEDigitalAssetSubtitleFormatType : NSObject{
    
    var SDImage: Bool?
    
    var HDImage: Bool?
    
    var UHDImage: Bool?
    
    /**
    the type's underlying value
    */
    var value: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let SDImageAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "SDImage").UTF8String)
        let SDImageAttrValue = xmlTextReaderGetAttribute(reader, SDImageAttrName)
        if(SDImageAttrValue != nil) {
            
            self.SDImage = (String.fromCString(UnsafePointer<CChar>(SDImageAttrValue)) == "true")
            xmlFree(SDImageAttrValue)
        }
        let HDImageAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "HDImage").UTF8String)
        let HDImageAttrValue = xmlTextReaderGetAttribute(reader, HDImageAttrName)
        if(HDImageAttrValue != nil) {
            
            self.HDImage = (String.fromCString(UnsafePointer<CChar>(HDImageAttrValue)) == "true")
            xmlFree(HDImageAttrValue)
        }
        let UHDImageAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "UHDImage").UTF8String)
        let UHDImageAttrValue = xmlTextReaderGetAttribute(reader, UHDImageAttrName)
        if(UHDImageAttrValue != nil) {
            
            self.UHDImage = (String.fromCString(UnsafePointer<CChar>(UHDImageAttrValue)) == "true")
            xmlFree(UHDImageAttrValue)
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
                    print("Ignoring unexpected in NGEDigitalAssetSubtitleFormatType: \(_currentElementName)")
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
        
        if(self.SDImage != nil) {
            
            dict["SDImage"] = self.SDImage!
            
        }
        
        if(self.HDImage != nil) {
            
            dict["HDImage"] = self.HDImage!
            
        }
        
        if(self.UHDImage != nil) {
            
            dict["UHDImage"] = self.UHDImage!
            
        }
        
        if(self.value != nil) {
            
            dict["value"] = self.value!
            
        }
        
        return dict
    }*/
    
}

