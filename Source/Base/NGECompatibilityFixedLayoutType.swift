import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGECompatibilityFixedLayoutType : NGECompatibilityType {
    
    var DeviceClass: NGEDeviceClass!
    
    var WidthPixels: Int!
    
    var HeightPixels: Int!
    
    var SafeWidthPixels: Int!
    
    var SafeHeightPixels: Int!
    
    var SafePixelsFromLeft: Int!
    
    var SafePixelsFromBottom: Int!
    
    override func readAttributes(reader: xmlTextReaderPtr) {
        super.readAttributes(reader)
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
    }
    
    override init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init(reader: reader)
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        var _readerOk:Int32=1
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("DeviceClass" == _currentElementName) {
                    
                    self.DeviceClass = NGEDeviceClass(reader: reader)
                    handledInChild = true
                    
                } else if("WidthPixels" == _currentElementName) {
                    
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
                    print("Ignoring unexpected in NGECompatibilityFixedLayoutType: \(_currentElementName)")
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
    
    /*override var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        for (name, value) in super.dictionary {
            dict[name] = value
        }
        
        if(self.DeviceClass != nil) {
            dict["DeviceClass"] = self.DeviceClass!
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

