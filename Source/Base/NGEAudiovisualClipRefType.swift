import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEAudiovisualClipRefType : NSObject{
    
    var `sequence`: Int?
    
    var `seamless`: Bool?
    
    var `audioLanguage`: String?
    
    var `PresentationID`: String!
    
    var `EntryPointTimecode`: NGETimecodeType?
    
    var `ExitPointTimecode`: NGETimecodeType?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "sequence") {
            
            self.sequence = numFormatter.number(from: String(cString: attrValue))!.intValue
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "seamless") {
            
            self.seamless = (String(cString: attrValue) == "true")
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "audioLanguage") {
            
            self.audioLanguage = String(cString: attrValue)
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
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("PresentationID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.PresentationID = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("EntryPointTimecode" == _currentElementName) {
                        
                        self.EntryPointTimecode = NGETimecodeType(reader)
                        handledInChild = true
                        
                    } else if("ExitPointTimecode" == _currentElementName) {
                        
                        self.ExitPointTimecode = NGETimecodeType(reader)
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEAudiovisualClipRefType: \(_currentElementName)")
                        if superclass != NSObject.self {
                            break
                        }
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
}

