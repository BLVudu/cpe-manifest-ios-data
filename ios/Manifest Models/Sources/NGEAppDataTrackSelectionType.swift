
import Foundation

@objc
class NGEAppDataTrackSelectionType : NSObject{
    
    var PresentationID: String!
    
    var SelectVideoTrack: Bool!
    
    var SelectSubtitleTrack: Bool!
    
    var SelectAudioTrack: Bool!
    
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
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("PresentationID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PresentationIDElementValue = xmlTextReaderConstValue(reader)
                    if PresentationIDElementValue != nil {
                        
                        self.PresentationID = String.fromCString(UnsafePointer<CChar>(PresentationIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SelectVideoTrack" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SelectVideoTrackElementValue = xmlTextReaderConstValue(reader)
                    if SelectVideoTrackElementValue != nil {
                        
                        self.SelectVideoTrack = String.fromCString(UnsafePointer<CChar>(SelectVideoTrackElementValue)) == "true"
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SelectSubtitleTrack" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SelectSubtitleTrackElementValue = xmlTextReaderConstValue(reader)
                    if SelectSubtitleTrackElementValue != nil {
                        
                        self.SelectSubtitleTrack = String.fromCString(UnsafePointer<CChar>(SelectSubtitleTrackElementValue)) == "true"
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SelectAudioTrack" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SelectAudioTrackElementValue = xmlTextReaderConstValue(reader)
                    if SelectAudioTrackElementValue != nil {
                        
                        self.SelectAudioTrack = String.fromCString(UnsafePointer<CChar>(SelectAudioTrackElementValue)) == "true"
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEAppDataTrackSelectionType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.PresentationID != nil) {
            
            dict["PresentationID"] = self.PresentationID!
            
        }
        
        if(self.SelectVideoTrack != nil) {
            
            dict["SelectVideoTrack"] = self.SelectVideoTrack!
            
        }
        
        if(self.SelectSubtitleTrack != nil) {
            
            dict["SelectSubtitleTrack"] = self.SelectSubtitleTrack!
            
        }
        
        if(self.SelectAudioTrack != nil) {
            
            dict["SelectAudioTrack"] = self.SelectAudioTrack!
            
        }
        
        return dict
    }*/
    
}

