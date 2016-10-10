import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGESubtitleTrackReferenceType : NSObject{
    
    var `priority`: Int?
    
    var `SubtitleTrackIDList`: [String]!
    
    var `AdaptationSetID`: NGEAdaptationSetID?
    
    var `TrackProfileList`: [NGEMediaProfileType]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "priority") {
            
            self.priority = numFormatter.number(from: String(cString: attrValue))!.intValue
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        self.readAttributes(reader)
        
        var SubtitleTrackIDListArray = [String]()
        
        var TrackProfileListArray = [NGEMediaProfileType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("SubtitleTrackID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            SubtitleTrackIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("AdaptationSetID" == _currentElementName) {
                        
                        self.AdaptationSetID = NGEAdaptationSetID(reader)
                        handledInChild = true
                        
                    } else if("TrackProfile" == _currentElementName) {
                        
                        TrackProfileListArray.append(NGEMediaProfileType(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGESubtitleTrackReferenceType: \(_currentElementName)")
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
        
        if(SubtitleTrackIDListArray.count > 0) { self.SubtitleTrackIDList = SubtitleTrackIDListArray }
        
        if(TrackProfileListArray.count > 0) { self.TrackProfileList = TrackProfileListArray }
    }
    
}

