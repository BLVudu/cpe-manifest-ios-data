import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEContainerTrackMetadataType : NSObject{
    
    var `Audio`: NGEDigitalAssetAudioDataType!
    
    var `Video`: NGEDigitalAssetVideoDataType!
    
    var `Subtitle`: NGEDigitalAssetSubtitleDataType!
    
    var `Image`: NGEDigitalAssetImageDataType!
    
    var `Interactive`: NGEDigitalAssetInteractiveDataType!
    
    var `Container`: NGEContainerMetadataType!
    
    var `ExternalTrackReference`: NGEDigitalAssetExternalTrackReferenceType!
    
    var `InternalTrackReference`: String!
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("Audio" == _currentElementName) {
                        
                        self.Audio = NGEDigitalAssetAudioDataType(reader)
                        handledInChild = true
                        
                    } else if("Video" == _currentElementName) {
                        
                        self.Video = NGEDigitalAssetVideoDataType(reader)
                        handledInChild = true
                        
                    } else if("Subtitle" == _currentElementName) {
                        
                        self.Subtitle = NGEDigitalAssetSubtitleDataType(reader)
                        handledInChild = true
                        
                    } else if("Image" == _currentElementName) {
                        
                        self.Image = NGEDigitalAssetImageDataType(reader)
                        handledInChild = true
                        
                    } else if("Interactive" == _currentElementName) {
                        
                        self.Interactive = NGEDigitalAssetInteractiveDataType(reader)
                        handledInChild = true
                        
                    } else if("Container" == _currentElementName) {
                        
                        self.Container = NGEContainerMetadataType(reader)
                        handledInChild = true
                        
                    } else if("ExternalTrackReference" == _currentElementName) {
                        
                        self.ExternalTrackReference = NGEDigitalAssetExternalTrackReferenceType(reader)
                        handledInChild = true
                        
                    } else if("InternalTrackReference" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.InternalTrackReference = String(cString: elementValue)
                            
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
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
}

