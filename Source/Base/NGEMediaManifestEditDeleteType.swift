import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEMediaManifestEditDeleteType : NSObject{
    
    var `AudioTrackIDList`: [String]?
    
    var `VideoTrackIDList`: [String]?
    
    var `SubtitleTrackIDList`: [String]?
    
    var `ImageIDList`: [String]?
    
    var `InteractiveTrackIDList`: [String]?
    
    var `TextObjectIDList`: [String]?
    
    var `PlayableSequenceIDList`: [String]?
    
    var `PresentationIDList`: [String]?
    
    var `PictureIDList`: [String]?
    
    var `GalleryIDList`: [String]?
    
    var `AppGroupIDList`: [String]?
    
    var `TextGroupIDList`: [String]?
    
    var `TimedSequenceIDList`: [String]?
    
    var `ExperienceIDList`: [String]?
    
    var `ALIDExperienceMapList`: [NGEALIDExperienceMapType]?
    
    var `ContentIDList`: [String]?
    
    var `LocalizedInfoRefList`: [NGEMediaManifestEditLocRefType]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var AudioTrackIDListArray = [String]()
        var VideoTrackIDListArray = [String]()
        var SubtitleTrackIDListArray = [String]()
        var ImageIDListArray = [String]()
        var InteractiveTrackIDListArray = [String]()
        var TextObjectIDListArray = [String]()
        var PlayableSequenceIDListArray = [String]()
        var PresentationIDListArray = [String]()
        var PictureIDListArray = [String]()
        var GalleryIDListArray = [String]()
        var AppGroupIDListArray = [String]()
        var TextGroupIDListArray = [String]()
        var TimedSequenceIDListArray = [String]()
        var ExperienceIDListArray = [String]()
        var ALIDExperienceMapListArray = [NGEALIDExperienceMapType]()
        var ContentIDListArray = [String]()
        var LocalizedInfoRefListArray = [NGEMediaManifestEditLocRefType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("AudioTrackID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            AudioTrackIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("VideoTrackID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            VideoTrackIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("SubtitleTrackID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            SubtitleTrackIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ImageID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            ImageIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("InteractiveTrackID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            InteractiveTrackIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("TextObjectID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            TextObjectIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("PlayableSequenceID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            PlayableSequenceIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("PresentationID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            PresentationIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("PictureID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            PictureIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("GalleryID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            GalleryIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("AppGroupID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            AppGroupIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("TextGroupID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            TextGroupIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("TimedSequenceID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            TimedSequenceIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ExperienceID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            ExperienceIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ALIDExperienceMap" == _currentElementName) {
                        
                        ALIDExperienceMapListArray.append(NGEALIDExperienceMapType(reader))
                        handledInChild = true
                        
                    } else if("ContentID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            ContentIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("LocalizedInfoRef" == _currentElementName) {
                        
                        LocalizedInfoRefListArray.append(NGEMediaManifestEditLocRefType(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEMediaManifestEditDeleteType: \(_currentElementName)")
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
        
        if(AudioTrackIDListArray.count > 0) { self.AudioTrackIDList = AudioTrackIDListArray }
        if(VideoTrackIDListArray.count > 0) { self.VideoTrackIDList = VideoTrackIDListArray }
        if(SubtitleTrackIDListArray.count > 0) { self.SubtitleTrackIDList = SubtitleTrackIDListArray }
        if(ImageIDListArray.count > 0) { self.ImageIDList = ImageIDListArray }
        if(InteractiveTrackIDListArray.count > 0) { self.InteractiveTrackIDList = InteractiveTrackIDListArray }
        if(TextObjectIDListArray.count > 0) { self.TextObjectIDList = TextObjectIDListArray }
        if(PlayableSequenceIDListArray.count > 0) { self.PlayableSequenceIDList = PlayableSequenceIDListArray }
        if(PresentationIDListArray.count > 0) { self.PresentationIDList = PresentationIDListArray }
        if(PictureIDListArray.count > 0) { self.PictureIDList = PictureIDListArray }
        if(GalleryIDListArray.count > 0) { self.GalleryIDList = GalleryIDListArray }
        if(AppGroupIDListArray.count > 0) { self.AppGroupIDList = AppGroupIDListArray }
        if(TextGroupIDListArray.count > 0) { self.TextGroupIDList = TextGroupIDListArray }
        if(TimedSequenceIDListArray.count > 0) { self.TimedSequenceIDList = TimedSequenceIDListArray }
        if(ExperienceIDListArray.count > 0) { self.ExperienceIDList = ExperienceIDListArray }
        if(ALIDExperienceMapListArray.count > 0) { self.ALIDExperienceMapList = ALIDExperienceMapListArray }
        if(ContentIDListArray.count > 0) { self.ContentIDList = ContentIDListArray }
        if(LocalizedInfoRefListArray.count > 0) { self.LocalizedInfoRefList = LocalizedInfoRefListArray }
    }
    
}

