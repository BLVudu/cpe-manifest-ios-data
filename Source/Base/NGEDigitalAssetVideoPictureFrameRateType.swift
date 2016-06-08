import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDigitalAssetVideoPictureFrameRateType : NSObject{
    
    var multiplier: NGEStringVideoPicFrameRateMultiplierEnum?
    
    var timecode: String?
    
    /**
    the type's underlying value
    */
    var value: Int?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let multiplierAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "multiplier").UTF8String)
        let multiplierAttrValue = xmlTextReaderGetAttribute(reader, multiplierAttrName)
        if(multiplierAttrValue != nil) {
            
            self.multiplier = NGEStringVideoPicFrameRateMultiplierEnum.fromString(String.fromCString(UnsafePointer<CChar>(multiplierAttrValue)))
            
            xmlFree(multiplierAttrValue)
        }
        let timecodeAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "timecode").UTF8String)
        let timecodeAttrValue = xmlTextReaderGetAttribute(reader, timecodeAttrName)
        if(timecodeAttrValue != nil) {
            
            self.timecode = String.fromCString(UnsafePointer<CChar>(timecodeAttrValue))
            xmlFree(timecodeAttrValue)
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
                        
                        let numFormatter = NSNumberFormatter()
                        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
                        
                        let value = String.fromCString(UnsafePointer<CChar>(contentValue))
                        if value != nil {
                            let trimmed = value!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                            self.value = numFormatter.numberFromString(trimmed)!.integerValue
                        }
                    }
                } else  if(true) {
                    print("Ignoring unexpected in NGEDigitalAssetVideoPictureFrameRateType: \(_currentElementName)")
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
        
        if(self.multiplier != nil) {
            
            let obj = NGEStringVideoPicFrameRateMultiplierEnum.toString(self.multiplier!)
            dict["multiplier"] = obj
            
        }
        
        if(self.timecode != nil) {
            
            dict["timecode"] = self.timecode!
            
        }
        
        if(self.value != nil) {
            
            dict["value"] = self.value!
            
        }
        
        return dict
    }*/
    
}

