
import Foundation

@objc
class NGEMediaManifestEditDeleteType : NSObject{
    
    var AudioTrackIDList: [NSURL]?
    
    var VideoTrackIDList: [NSURL]?
    
    var SubtitleTrackIDList: [NSURL]?
    
    var ImageIDList: [NSURL]?
    
    var InteractiveTrackIDList: [NSURL]?
    
    var TextObjectIDList: [NSURL]?
    
    var PlayableSequenceIDList: [NSURL]?
    
    var PresentationIDList: [NSURL]?
    
    var PictureIDList: [NSURL]?
    
    var GalleryIDList: [NSURL]?
    
    var AppGroupIDList: [NSURL]?
    
    var TextGroupIDList: [NSURL]?
    
    var TimedSequenceIDList: [NSURL]?
    
    var ExperienceIDList: [NSURL]?
    
    var ALIDExperienceMapList: [NGEALIDExperienceMapType]?
    
    var ContentIDList: [NSURL]?
    
    var LocalizedInfoRefList: [NGEMediaManifestEditLocRefType]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var AudioTrackIDListArray = [NSURL]()
        var VideoTrackIDListArray = [NSURL]()
        var SubtitleTrackIDListArray = [NSURL]()
        var ImageIDListArray = [NSURL]()
        var InteractiveTrackIDListArray = [NSURL]()
        var TextObjectIDListArray = [NSURL]()
        var PlayableSequenceIDListArray = [NSURL]()
        var PresentationIDListArray = [NSURL]()
        var PictureIDListArray = [NSURL]()
        var GalleryIDListArray = [NSURL]()
        var AppGroupIDListArray = [NSURL]()
        var TextGroupIDListArray = [NSURL]()
        var TimedSequenceIDListArray = [NSURL]()
        var ExperienceIDListArray = [NSURL]()
        var ALIDExperienceMapListArray = [NGEALIDExperienceMapType]()
        var ContentIDListArray = [NSURL]()
        var LocalizedInfoRefListArray = [NGEMediaManifestEditLocRefType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("AudioTrackID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AudioTrackIDElementValue = xmlTextReaderConstValue(reader)
                    if AudioTrackIDElementValue != nil {
                        
                        AudioTrackIDListArray.append(NSURL(string: String.fromCString(UnsafePointer<CChar>(AudioTrackIDElementValue))!)!) //bad unwrapping
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("VideoTrackID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let VideoTrackIDElementValue = xmlTextReaderConstValue(reader)
                    if VideoTrackIDElementValue != nil {
                        
                        VideoTrackIDListArray.append(NSURL(string: String.fromCString(UnsafePointer<CChar>(VideoTrackIDElementValue))!)!) //bad unwrapping
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SubtitleTrackID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SubtitleTrackIDElementValue = xmlTextReaderConstValue(reader)
                    if SubtitleTrackIDElementValue != nil {
                        
                        SubtitleTrackIDListArray.append(NSURL(string: String.fromCString(UnsafePointer<CChar>(SubtitleTrackIDElementValue))!)!) //bad unwrapping
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ImageID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ImageIDElementValue = xmlTextReaderConstValue(reader)
                    if ImageIDElementValue != nil {
                        
                        ImageIDListArray.append(NSURL(string: String.fromCString(UnsafePointer<CChar>(ImageIDElementValue))!)!) //bad unwrapping
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("InteractiveTrackID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let InteractiveTrackIDElementValue = xmlTextReaderConstValue(reader)
                    if InteractiveTrackIDElementValue != nil {
                        
                        InteractiveTrackIDListArray.append(NSURL(string: String.fromCString(UnsafePointer<CChar>(InteractiveTrackIDElementValue))!)!) //bad unwrapping
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TextObjectID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TextObjectIDElementValue = xmlTextReaderConstValue(reader)
                    if TextObjectIDElementValue != nil {
                        
                        TextObjectIDListArray.append(NSURL(string: String.fromCString(UnsafePointer<CChar>(TextObjectIDElementValue))!)!) //bad unwrapping
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PlayableSequenceID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PlayableSequenceIDElementValue = xmlTextReaderConstValue(reader)
                    if PlayableSequenceIDElementValue != nil {
                        
                        PlayableSequenceIDListArray.append(NSURL(string: String.fromCString(UnsafePointer<CChar>(PlayableSequenceIDElementValue))!)!) //bad unwrapping
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PresentationID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PresentationIDElementValue = xmlTextReaderConstValue(reader)
                    if PresentationIDElementValue != nil {
                        
                        PresentationIDListArray.append(NSURL(string: String.fromCString(UnsafePointer<CChar>(PresentationIDElementValue))!)!) //bad unwrapping
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PictureID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PictureIDElementValue = xmlTextReaderConstValue(reader)
                    if PictureIDElementValue != nil {
                        
                        PictureIDListArray.append(NSURL(string: String.fromCString(UnsafePointer<CChar>(PictureIDElementValue))!)!) //bad unwrapping
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("GalleryID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let GalleryIDElementValue = xmlTextReaderConstValue(reader)
                    if GalleryIDElementValue != nil {
                        
                        GalleryIDListArray.append(NSURL(string: String.fromCString(UnsafePointer<CChar>(GalleryIDElementValue))!)!) //bad unwrapping
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("AppGroupID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AppGroupIDElementValue = xmlTextReaderConstValue(reader)
                    if AppGroupIDElementValue != nil {
                        
                        AppGroupIDListArray.append(NSURL(string: String.fromCString(UnsafePointer<CChar>(AppGroupIDElementValue))!)!) //bad unwrapping
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TextGroupID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TextGroupIDElementValue = xmlTextReaderConstValue(reader)
                    if TextGroupIDElementValue != nil {
                        
                        TextGroupIDListArray.append(NSURL(string: String.fromCString(UnsafePointer<CChar>(TextGroupIDElementValue))!)!) //bad unwrapping
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TimedSequenceID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TimedSequenceIDElementValue = xmlTextReaderConstValue(reader)
                    if TimedSequenceIDElementValue != nil {
                        
                        TimedSequenceIDListArray.append(NSURL(string: String.fromCString(UnsafePointer<CChar>(TimedSequenceIDElementValue))!)!) //bad unwrapping
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ExperienceID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ExperienceIDElementValue = xmlTextReaderConstValue(reader)
                    if ExperienceIDElementValue != nil {
                        
                        ExperienceIDListArray.append(NSURL(string: String.fromCString(UnsafePointer<CChar>(ExperienceIDElementValue))!)!) //bad unwrapping
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ALIDExperienceMap" == _currentElementName) {
                    
                    ALIDExperienceMapListArray.append(NGEALIDExperienceMapType(reader: reader))
                    handledInChild = true
                    
                } else if("ContentID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ContentIDElementValue = xmlTextReaderConstValue(reader)
                    if ContentIDElementValue != nil {
                        
                        ContentIDListArray.append(NSURL(string: String.fromCString(UnsafePointer<CChar>(ContentIDElementValue))!)!) //bad unwrapping
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("LocalizedInfoRef" == _currentElementName) {
                    
                    LocalizedInfoRefListArray.append(NGEMediaManifestEditLocRefType(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected: \(_currentElementName)")
                    //break
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
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.AudioTrackIDList != nil) {
            
            dict["AudioTrackIDList"] = self.AudioTrackIDList!
            
        }
        
        if(self.VideoTrackIDList != nil) {
            
            dict["VideoTrackIDList"] = self.VideoTrackIDList!
            
        }
        
        if(self.SubtitleTrackIDList != nil) {
            
            dict["SubtitleTrackIDList"] = self.SubtitleTrackIDList!
            
        }
        
        if(self.ImageIDList != nil) {
            
            dict["ImageIDList"] = self.ImageIDList!
            
        }
        
        if(self.InteractiveTrackIDList != nil) {
            
            dict["InteractiveTrackIDList"] = self.InteractiveTrackIDList!
            
        }
        
        if(self.TextObjectIDList != nil) {
            
            dict["TextObjectIDList"] = self.TextObjectIDList!
            
        }
        
        if(self.PlayableSequenceIDList != nil) {
            
            dict["PlayableSequenceIDList"] = self.PlayableSequenceIDList!
            
        }
        
        if(self.PresentationIDList != nil) {
            
            dict["PresentationIDList"] = self.PresentationIDList!
            
        }
        
        if(self.PictureIDList != nil) {
            
            dict["PictureIDList"] = self.PictureIDList!
            
        }
        
        if(self.GalleryIDList != nil) {
            
            dict["GalleryIDList"] = self.GalleryIDList!
            
        }
        
        if(self.AppGroupIDList != nil) {
            
            dict["AppGroupIDList"] = self.AppGroupIDList!
            
        }
        
        if(self.TextGroupIDList != nil) {
            
            dict["TextGroupIDList"] = self.TextGroupIDList!
            
        }
        
        if(self.TimedSequenceIDList != nil) {
            
            dict["TimedSequenceIDList"] = self.TimedSequenceIDList!
            
        }
        
        if(self.ExperienceIDList != nil) {
            
            dict["ExperienceIDList"] = self.ExperienceIDList!
            
        }
        
        if(self.ALIDExperienceMapList != nil) {
            dict["ALIDExperienceMapList"] = self.ALIDExperienceMapList!.map({$0.dictionary})
        }
        
        if(self.ContentIDList != nil) {
            
            dict["ContentIDList"] = self.ContentIDList!
            
        }
        
        if(self.LocalizedInfoRefList != nil) {
            dict["LocalizedInfoRefList"] = self.LocalizedInfoRefList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

