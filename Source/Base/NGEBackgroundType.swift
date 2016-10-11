import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEBackgroundType : NSObject{
    
    var `looping`: Bool?
    
    var `Color`: String?
    
    var `Image`: NGEImage?
    
    var `Video`: NGEVideo?
    
    var `AudioLoop`: NGEBackgroundAudioType?
    
    var `Adaptation`: NGEBackgroundAdaptationType?
    
    var `OverlayAreaList`: [NGEBackgroundOverlayAreaType]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "looping") {
            
            self.looping = (String(cString: attrValue) == "true")
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var OverlayAreaListArray = [NGEBackgroundOverlayAreaType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("Color" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Color = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Image" == _currentElementName) {
                        
                        self.Image = NGEImage(reader)
                        handledInChild = true
                        
                    } else if("Video" == _currentElementName) {
                        
                        self.Video = NGEVideo(reader)
                        handledInChild = true
                        
                    } else if("AudioLoop" == _currentElementName) {
                        
                        self.AudioLoop = NGEBackgroundAudioType(reader)
                        handledInChild = true
                        
                    } else if("Adaptation" == _currentElementName) {
                        
                        self.Adaptation = NGEBackgroundAdaptationType(reader)
                        handledInChild = true
                        
                    } else if("OverlayArea" == _currentElementName) {
                        
                        OverlayAreaListArray.append(NGEBackgroundOverlayAreaType(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEBackgroundType: \(_currentElementName)")
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
        
        if(OverlayAreaListArray.count > 0) { self.OverlayAreaList = OverlayAreaListArray }
    }
    
}

