import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGECompatibilityResolutionType : NSObject{
    
    var rotate: Bool!
    
    var crop: Bool!
    
    var WidthPixels: Int!
    
    var HeightPixels: Int!
    
    var SafeWidthPixels: Int!
    
    var SafeHeightPixels: Int!
    
    var SafePixelsFromLeft: Int!
    
    var SafePixelsFromBottom: Int!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let rotateAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "rotate").UTF8String)
        let rotateAttrValue = xmlTextReaderGetAttribute(reader, rotateAttrName)
        if(rotateAttrValue != nil) {
            
            self.rotate = (String.fromCString(UnsafePointer<CChar>(rotateAttrValue)) == "true")
            xmlFree(rotateAttrValue)
        }
        let cropAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "crop").UTF8String)
        let cropAttrValue = xmlTextReaderGetAttribute(reader, cropAttrName)
        if(cropAttrValue != nil) {
            
            self.crop = (String.fromCString(UnsafePointer<CChar>(cropAttrValue)) == "true")
            xmlFree(cropAttrValue)
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
                if("WidthPixels" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let WidthPixelsElementValue = xmlTextReaderConstValue(reader)
                    if WidthPixelsElementValue != nil {
                        
                        self.WidthPixels = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(WidthPixelsElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("HeightPixels" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let HeightPixelsElementValue = xmlTextReaderConstValue(reader)
                    if HeightPixelsElementValue != nil {
                        
                        self.HeightPixels = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(HeightPixelsElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SafeWidthPixels" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SafeWidthPixelsElementValue = xmlTextReaderConstValue(reader)
                    if SafeWidthPixelsElementValue != nil {
                        
                        self.SafeWidthPixels = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(SafeWidthPixelsElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SafeHeightPixels" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SafeHeightPixelsElementValue = xmlTextReaderConstValue(reader)
                    if SafeHeightPixelsElementValue != nil {
                        
                        self.SafeHeightPixels = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(SafeHeightPixelsElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SafePixelsFromLeft" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SafePixelsFromLeftElementValue = xmlTextReaderConstValue(reader)
                    if SafePixelsFromLeftElementValue != nil {
                        
                        self.SafePixelsFromLeft = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(SafePixelsFromLeftElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SafePixelsFromBottom" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SafePixelsFromBottomElementValue = xmlTextReaderConstValue(reader)
                    if SafePixelsFromBottomElementValue != nil {
                        
                        self.SafePixelsFromBottom = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(SafePixelsFromBottomElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGECompatibilityResolutionType: \(_currentElementName)")
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
        
        if(self.rotate != nil) {
            
            dict["rotate"] = self.rotate!
            
        }
        
        if(self.crop != nil) {
            
            dict["crop"] = self.crop!
            
        }
        
        if(self.WidthPixels != nil) {
            
            dict["WidthPixels"] = self.WidthPixels!
            
        }
        
        if(self.HeightPixels != nil) {
            
            dict["HeightPixels"] = self.HeightPixels!
            
        }
        
        if(self.SafeWidthPixels != nil) {
            
            dict["SafeWidthPixels"] = self.SafeWidthPixels!
            
        }
        
        if(self.SafeHeightPixels != nil) {
            
            dict["SafeHeightPixels"] = self.SafeHeightPixels!
            
        }
        
        if(self.SafePixelsFromLeft != nil) {
            
            dict["SafePixelsFromLeft"] = self.SafePixelsFromLeft!
            
        }
        
        if(self.SafePixelsFromBottom != nil) {
            
            dict["SafePixelsFromBottom"] = self.SafePixelsFromBottom!
            
        }
        
        return dict
    }*/
    
}

