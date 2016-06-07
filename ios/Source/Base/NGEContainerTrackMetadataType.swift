
import Foundation

@objc
class NGEContainerTrackMetadataType : NSObject{
    
    var Audio: NGEDigitalAssetAudioDataType!
    
    var Video: NGEDigitalAssetVideoDataType!
    
    var Subtitle: NGEDigitalAssetSubtitleDataType!
    
    var Image: NGEDigitalAssetImageDataType!
    
    var Interactive: NGEDigitalAssetInteractiveDataType!
    
    var Container: NGEContainerMetadataType!
    
    var ExternalTrackReference: NGEDigitalAssetExternalTrackReferenceType!
    
    var InternalTrackReference: String!
    
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
                    
                } else if("Container" == _currentElementName) {
                    
                    self.Container = NGEContainerMetadataType(reader: reader)
                    handledInChild = true
                    
                } else if("ExternalTrackReference" == _currentElementName) {
                    
                    self.ExternalTrackReference = NGEDigitalAssetExternalTrackReferenceType(reader: reader)
                    handledInChild = true
                    
                } else if("InternalTrackReference" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let InternalTrackReferenceElementValue = xmlTextReaderConstValue(reader)
                    if InternalTrackReferenceElementValue != nil {
                        
                        self.InternalTrackReference = String.fromCString(UnsafePointer<CChar>(InternalTrackReferenceElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEContainerTrackMetadataType: \(_currentElementName)")
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
        
        if(self.Container != nil) {
            dict["Container"] = self.Container!
        }
        
        if(self.ExternalTrackReference != nil) {
            dict["ExternalTrackReference"] = self.ExternalTrackReference!
        }
        
        if(self.InternalTrackReference != nil) {
            
            dict["InternalTrackReference"] = self.InternalTrackReference!
            
        }
        
        return dict
    }*/
    
}

