import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEImageSubAreaType : NSObject{
    
    var WidthPixels: Int!
    
    var HeightPixels: Int!
    
    var PixelsFromLeft: Int!
    
    var PixelsFromBottom: Int!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
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
                    
                } else if("PixelsFromLeft" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PixelsFromLeftElementValue = xmlTextReaderConstValue(reader)
                    if PixelsFromLeftElementValue != nil {
                        
                        self.PixelsFromLeft = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(PixelsFromLeftElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PixelsFromBottom" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PixelsFromBottomElementValue = xmlTextReaderConstValue(reader)
                    if PixelsFromBottomElementValue != nil {
                        
                        self.PixelsFromBottom = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(PixelsFromBottomElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEImageSubAreaType: \(_currentElementName)")
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
        
        if(self.WidthPixels != nil) {
            
            dict["WidthPixels"] = self.WidthPixels!
            
        }
        
        if(self.HeightPixels != nil) {
            
            dict["HeightPixels"] = self.HeightPixels!
            
        }
        
        if(self.PixelsFromLeft != nil) {
            
            dict["PixelsFromLeft"] = self.PixelsFromLeft!
            
        }
        
        if(self.PixelsFromBottom != nil) {
            
            dict["PixelsFromBottom"] = self.PixelsFromBottom!
            
        }
        
        return dict
    }*/
    
}

