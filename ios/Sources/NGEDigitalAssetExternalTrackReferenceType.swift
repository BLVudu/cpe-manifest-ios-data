
import Foundation

@objc
class NGEDigitalAssetExternalTrackReferenceType : NSObject{
    
    var namespace: String?
    
    var location: String?
    
    var trackReference: String?
    
    /**
    the type's underlying value
    */
    var value: NSURL?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let namespaceAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "namespace").UTF8String)
        let namespaceAttrValue = xmlTextReaderGetAttribute(reader, namespaceAttrName)
        if(namespaceAttrValue != nil) {
            
            self.namespace = String.fromCString(UnsafePointer<CChar>(namespaceAttrValue))
            xmlFree(namespaceAttrValue)
        }
        let locationAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "location").UTF8String)
        let locationAttrValue = xmlTextReaderGetAttribute(reader, locationAttrName)
        if(locationAttrValue != nil) {
            
            self.location = String.fromCString(UnsafePointer<CChar>(locationAttrValue))
            xmlFree(locationAttrValue)
        }
        let trackReferenceAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "trackReference").UTF8String)
        let trackReferenceAttrValue = xmlTextReaderGetAttribute(reader, trackReferenceAttrName)
        if(trackReferenceAttrValue != nil) {
            
            self.trackReference = String.fromCString(UnsafePointer<CChar>(trackReferenceAttrValue))
            xmlFree(trackReferenceAttrValue)
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
                        self.value = NSURL(string: value!)
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
        
        if(self.namespace != nil) {
            
            dict["namespace"] = self.namespace!
            
        }
        
        if(self.location != nil) {
            
            dict["location"] = self.location!
            
        }
        
        if(self.trackReference != nil) {
            
            dict["trackReference"] = self.trackReference!
            
        }
        
        if(self.value != nil) {
            
            dict["value"] = self.value!
            
        }
        
        return dict
    }*/
    
}

