import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGETrackMetadataType : NSObject{
    
    var `TrackSelectionNumber`: Int!
    
    var `VideoTrackReferenceList`: [NGEVideoTrackReferenceType]?
    
    var `AudioTrackReferenceList`: [NGEAudioTrackReferenceType]?
    
    var `SubtitleTrackReferenceList`: [NGESubtitleTrackReferenceType]?
    
    var `AncillaryTrackReferenceList`: [NGEAncillaryTrackReferenceType]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        self.readAttributes(reader)
        
        var VideoTrackReferenceListArray = [NGEVideoTrackReferenceType]()
        var AudioTrackReferenceListArray = [NGEAudioTrackReferenceType]()
        var SubtitleTrackReferenceListArray = [NGESubtitleTrackReferenceType]()
        var AncillaryTrackReferenceListArray = [NGEAncillaryTrackReferenceType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("TrackSelectionNumber" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.TrackSelectionNumber = numFormatter.number(from: String(cString: elementValue))!.intValue
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("VideoTrackReference" == _currentElementName) {
                        
                        VideoTrackReferenceListArray.append(NGEVideoTrackReferenceType(reader))
                        handledInChild = true
                        
                    } else if("AudioTrackReference" == _currentElementName) {
                        
                        AudioTrackReferenceListArray.append(NGEAudioTrackReferenceType(reader))
                        handledInChild = true
                        
                    } else if("SubtitleTrackReference" == _currentElementName) {
                        
                        SubtitleTrackReferenceListArray.append(NGESubtitleTrackReferenceType(reader))
                        handledInChild = true
                        
                    } else if("AncillaryTrackReference" == _currentElementName) {
                        
                        AncillaryTrackReferenceListArray.append(NGEAncillaryTrackReferenceType(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGETrackMetadataType: \(_currentElementName)")
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
        
        if(VideoTrackReferenceListArray.count > 0) { self.VideoTrackReferenceList = VideoTrackReferenceListArray }
        if(AudioTrackReferenceListArray.count > 0) { self.AudioTrackReferenceList = AudioTrackReferenceListArray }
        if(SubtitleTrackReferenceListArray.count > 0) { self.SubtitleTrackReferenceList = SubtitleTrackReferenceListArray }
        if(AncillaryTrackReferenceListArray.count > 0) { self.AncillaryTrackReferenceList = AncillaryTrackReferenceListArray }
    }
    
}

