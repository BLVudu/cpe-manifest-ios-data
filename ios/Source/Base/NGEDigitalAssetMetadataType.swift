import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDigitalAssetMetadataType : NSObject{
    
    var Audio: NGEDigitalAssetAudioDataType!
    
    var Video: NGEDigitalAssetVideoDataType!
    
    var Subtitle: NGEDigitalAssetSubtitleDataType!
    
    var Image: NGEDigitalAssetImageDataType!
    
    var Interactive: NGEDigitalAssetInteractiveDataType!
    
    var Ancillary: NGEDigitalAssetAncillaryDataType!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Audio" == _currentElementName) {
                    
                    self.Audio = NGEDigitalAssetAudioDataType(reader: reader)
                    handledInChild = true
                    
                } else if("Video" == _currentElementName) {
                    
                    self.Video = NGEDigitalAssetVideoDataType(reader: reader)
                    handledInChild = true
                    
                } else if("Subtitle" == _currentElementName) {
                    
                    self.Subtitle = NGEDigitalAssetSubtitleDataType(reader: reader)
                    handledInChild = true
                    
                } else if("Image" == _currentElementName) {
                    
                    self.Image = NGEDigitalAssetImageDataType(reader: reader)
                    handledInChild = true
                    
                } else if("Interactive" == _currentElementName) {
                    
                    self.Interactive = NGEDigitalAssetInteractiveDataType(reader: reader)
                    handledInChild = true
                    
                } else if("Ancillary" == _currentElementName) {
                    
                    self.Ancillary = NGEDigitalAssetAncillaryDataType(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEDigitalAssetMetadataType: \(_currentElementName)")
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
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Audio != nil) {
            dict["Audio"] = self.Audio!
        }
        
        if(self.Video != nil) {
            dict["Video"] = self.Video!
        }
        
        if(self.Subtitle != nil) {
            dict["Subtitle"] = self.Subtitle!
        }
        
        if(self.Image != nil) {
            dict["Image"] = self.Image!
        }
        
        if(self.Interactive != nil) {
            dict["Interactive"] = self.Interactive!
        }
        
        if(self.Ancillary != nil) {
            dict["Ancillary"] = self.Ancillary!
        }
        
        return dict
    }*/
    
}

