import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEImageClipRefType : NSObject{
    
    var sequence: Int?
    
    var seamless: Bool?
    
    var audioLanguage: String?
    
    var ImageID: String!
    
    var Duration: String!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let sequenceAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "sequence").UTF8String)
        let sequenceAttrValue = xmlTextReaderGetAttribute(reader, sequenceAttrName)
        if(sequenceAttrValue != nil) {
            
            self.sequence = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(sequenceAttrValue))!)!.integerValue
            xmlFree(sequenceAttrValue)
        }
        let seamlessAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "seamless").UTF8String)
        let seamlessAttrValue = xmlTextReaderGetAttribute(reader, seamlessAttrName)
        if(seamlessAttrValue != nil) {
            
            self.seamless = (String.fromCString(UnsafePointer<CChar>(seamlessAttrValue)) == "true")
            xmlFree(seamlessAttrValue)
        }
        let audioLanguageAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "audioLanguage").UTF8String)
        let audioLanguageAttrValue = xmlTextReaderGetAttribute(reader, audioLanguageAttrName)
        if(audioLanguageAttrValue != nil) {
            
            self.audioLanguage = String.fromCString(UnsafePointer<CChar>(audioLanguageAttrValue))
            xmlFree(audioLanguageAttrValue)
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
                if("ImageID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ImageIDElementValue = xmlTextReaderConstValue(reader)
                    if ImageIDElementValue != nil {
                        
                        self.ImageID = String.fromCString(UnsafePointer<CChar>(ImageIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Duration" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let DurationElementValue = xmlTextReaderConstValue(reader)
                    if DurationElementValue != nil {
                        
                        self.Duration = String.fromCString(UnsafePointer<CChar>(DurationElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEImageClipRefType: \(_currentElementName)")
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
        
        if(self.sequence != nil) {
            
            dict["sequence"] = self.sequence!
            
        }
        
        if(self.seamless != nil) {
            
            dict["seamless"] = self.seamless!
            
        }
        
        if(self.audioLanguage != nil) {
            
            dict["audioLanguage"] = self.audioLanguage!
            
        }
        
        if(self.ImageID != nil) {
            
            dict["ImageID"] = self.ImageID!
            
        }
        
        if(self.Duration != nil) {
            
            dict["Duration"] = self.Duration!
            
        }
        
        return dict
    }*/
    
}

