import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEBackgroundType : NSObject{
    
    var looping: Bool?
    
    var Color: String?
    
    var Image: NGEImage?
    
    var Video: NGEVideo?
    
    var AudioLoop: NGEBackgroundAudioType?
    
    var Adaptation: NGEBackgroundAdaptationType?
    
    var OverlayAreaList: [NGEBackgroundOverlayAreaType]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let loopingAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "looping").UTF8String)
        let loopingAttrValue = xmlTextReaderGetAttribute(reader, loopingAttrName)
        if(loopingAttrValue != nil) {
            
            self.looping = (String.fromCString(UnsafePointer<CChar>(loopingAttrValue)) == "true")
            xmlFree(loopingAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
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
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Color" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ColorElementValue = xmlTextReaderConstValue(reader)
                    if ColorElementValue != nil {
                        
                        self.Color = String.fromCString(UnsafePointer<CChar>(ColorElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Image" == _currentElementName) {
                    
                    self.Image = NGEImage(reader: reader)
                    handledInChild = true
                    
                } else if("Video" == _currentElementName) {
                    
                    self.Video = NGEVideo(reader: reader)
                    handledInChild = true
                    
                } else if("AudioLoop" == _currentElementName) {
                    
                    self.AudioLoop = NGEBackgroundAudioType(reader: reader)
                    handledInChild = true
                    
                } else if("Adaptation" == _currentElementName) {
                    
                    self.Adaptation = NGEBackgroundAdaptationType(reader: reader)
                    handledInChild = true
                    
                } else if("OverlayArea" == _currentElementName) {
                    
                    OverlayAreaListArray.append(NGEBackgroundOverlayAreaType(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEBackgroundType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(OverlayAreaListArray.count > 0) { self.OverlayAreaList = OverlayAreaListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.looping != nil) {
            
            dict["looping"] = self.looping!
            
        }
        
        if(self.Color != nil) {
            
            dict["Color"] = self.Color!
            
        }
        
        if(self.Image != nil) {
            dict["Image"] = self.Image!
        }
        
        if(self.Video != nil) {
            dict["Video"] = self.Video!
        }
        
        if(self.AudioLoop != nil) {
            dict["AudioLoop"] = self.AudioLoop!
        }
        
        if(self.Adaptation != nil) {
            dict["Adaptation"] = self.Adaptation!
        }
        
        if(self.OverlayAreaList != nil) {
            dict["OverlayAreaList"] = self.OverlayAreaList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

