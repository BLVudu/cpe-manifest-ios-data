import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDigitalAssetVideoPictureLightLevelType : NSObject{
    
    var `ContentMaxList`: [NGEContentMax]?
    
    var `FrameAverageMaxList`: [NGEFrameAverageMax]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var ContentMaxListArray = [NGEContentMax]()
        var FrameAverageMaxListArray = [NGEFrameAverageMax]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("ContentMax" == _currentElementName) {
                        
                        ContentMaxListArray.append(NGEContentMax(reader))
                        handledInChild = true
                        
                    } else if("FrameAverageMax" == _currentElementName) {
                        
                        FrameAverageMaxListArray.append(NGEFrameAverageMax(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEDigitalAssetVideoPictureLightLevelType: \(_currentElementName)")
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
        
        if(ContentMaxListArray.count > 0) { self.ContentMaxList = ContentMaxListArray }
        if(FrameAverageMaxListArray.count > 0) { self.FrameAverageMaxList = FrameAverageMaxListArray }
    }
    
}

