
import Foundation

@objc
class NGETrackMetadataType : NSObject{
    
    var TrackSelectionNumber: Int!
    
    var VideoTrackReferenceList: [NGEVideoTrackReferenceType]?
    
    var AudioTrackReferenceList: [NGEAudioTrackReferenceType]?
    
    var SubtitleTrackReferenceList: [NGESubtitleTrackReferenceType]?
    
    var AncillaryTrackReferenceList: [NGEAncillaryTrackReferenceType]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
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
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("TrackSelectionNumber" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TrackSelectionNumberElementValue = xmlTextReaderConstValue(reader)
                    if TrackSelectionNumberElementValue != nil {
                        
                        self.TrackSelectionNumber = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(TrackSelectionNumberElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("VideoTrackReference" == _currentElementName) {
                    
                    VideoTrackReferenceListArray.append(NGEVideoTrackReferenceType(reader: reader))
                    handledInChild = true
                    
                } else if("AudioTrackReference" == _currentElementName) {
                    
                    AudioTrackReferenceListArray.append(NGEAudioTrackReferenceType(reader: reader))
                    handledInChild = true
                    
                } else if("SubtitleTrackReference" == _currentElementName) {
                    
                    SubtitleTrackReferenceListArray.append(NGESubtitleTrackReferenceType(reader: reader))
                    handledInChild = true
                    
                } else if("AncillaryTrackReference" == _currentElementName) {
                    
                    AncillaryTrackReferenceListArray.append(NGEAncillaryTrackReferenceType(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGETrackMetadataType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
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
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.TrackSelectionNumber != nil) {
            
            dict["TrackSelectionNumber"] = self.TrackSelectionNumber!
            
        }
        
        if(self.VideoTrackReferenceList != nil) {
            dict["VideoTrackReferenceList"] = self.VideoTrackReferenceList!.map({$0.dictionary})
        }
        
        if(self.AudioTrackReferenceList != nil) {
            dict["AudioTrackReferenceList"] = self.AudioTrackReferenceList!.map({$0.dictionary})
        }
        
        if(self.SubtitleTrackReferenceList != nil) {
            dict["SubtitleTrackReferenceList"] = self.SubtitleTrackReferenceList!.map({$0.dictionary})
        }
        
        if(self.AncillaryTrackReferenceList != nil) {
            dict["AncillaryTrackReferenceList"] = self.AncillaryTrackReferenceList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

