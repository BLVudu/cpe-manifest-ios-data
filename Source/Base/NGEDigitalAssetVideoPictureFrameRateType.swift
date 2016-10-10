import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDigitalAssetVideoPictureFrameRateType : NSObject{
    
    var `multiplier`: NGEStringVideoPicFrameRateMultiplierEnum?
    
    var `timecode`: String?
    
    /**
    the type's underlying value
    */
    var value: Int?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "multiplier") {
            
            self.multiplier = NGEStringVideoPicFrameRateMultiplierEnum.fromString(enumString: String(cString: attrValue))
            
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "timecode") {
            
            self.timecode = String(cString: attrValue)
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("#text" == _currentElementName){
                        if let contentValue = xmlTextReaderConstValue(reader) {
                            
                            let numFormatter = NumberFormatter()
                            numFormatter.numberStyle = .decimal
                            
                            let value = String(cString: contentValue)
                            let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
                            self.value = numFormatter.number(from: trimmed)!.intValue
                            
                        }
                    } else  if(true) {
                        print("Ignoring unexpected in NGEDigitalAssetVideoPictureFrameRateType: \(_currentElementName)")
                        if superclass != NSObject.self {
                            break
                        }
                    }
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
}

