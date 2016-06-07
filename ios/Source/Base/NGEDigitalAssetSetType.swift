
import Foundation

@objc
class NGEDigitalAssetSetType : NSObject{
    
    var AudioList: [NGEDigitalAssetAudioDataType]?
    
    var VideoList: [NGEDigitalAssetVideoDataType]?
    
    var SubtitleList: [NGEDigitalAssetSubtitleDataType]?
    
    var ImageList: [NGEDigitalAssetImageDataType]?
    
    var InteractiveList: [NGEDigitalAssetInteractiveDataType]?
    
    var AncillaryList: [NGEDigitalAssetAncillaryDataType]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var AudioListArray = [NGEDigitalAssetAudioDataType]()
        var VideoListArray = [NGEDigitalAssetVideoDataType]()
        var SubtitleListArray = [NGEDigitalAssetSubtitleDataType]()
        var ImageListArray = [NGEDigitalAssetImageDataType]()
        var InteractiveListArray = [NGEDigitalAssetInteractiveDataType]()
        var AncillaryListArray = [NGEDigitalAssetAncillaryDataType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Audio" == _currentElementName) {
                    
                    AudioListArray.append(NGEDigitalAssetAudioDataType(reader: reader))
                    handledInChild = true
                    
                } else if("Video" == _currentElementName) {
                    
                    VideoListArray.append(NGEDigitalAssetVideoDataType(reader: reader))
                    handledInChild = true
                    
                } else if("Subtitle" == _currentElementName) {
                    
                    SubtitleListArray.append(NGEDigitalAssetSubtitleDataType(reader: reader))
                    handledInChild = true
                    
                } else if("Image" == _currentElementName) {
                    
                    ImageListArray.append(NGEDigitalAssetImageDataType(reader: reader))
                    handledInChild = true
                    
                } else if("Interactive" == _currentElementName) {
                    
                    InteractiveListArray.append(NGEDigitalAssetInteractiveDataType(reader: reader))
                    handledInChild = true
                    
                } else if("Ancillary" == _currentElementName) {
                    
                    AncillaryListArray.append(NGEDigitalAssetAncillaryDataType(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEDigitalAssetSetType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(AudioListArray.count > 0) { self.AudioList = AudioListArray }
        if(VideoListArray.count > 0) { self.VideoList = VideoListArray }
        if(SubtitleListArray.count > 0) { self.SubtitleList = SubtitleListArray }
        if(ImageListArray.count > 0) { self.ImageList = ImageListArray }
        if(InteractiveListArray.count > 0) { self.InteractiveList = InteractiveListArray }
        if(AncillaryListArray.count > 0) { self.AncillaryList = AncillaryListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.AudioList != nil) {
            dict["AudioList"] = self.AudioList!.map({$0.dictionary})
        }
        
        if(self.VideoList != nil) {
            dict["VideoList"] = self.VideoList!.map({$0.dictionary})
        }
        
        if(self.SubtitleList != nil) {
            dict["SubtitleList"] = self.SubtitleList!.map({$0.dictionary})
        }
        
        if(self.ImageList != nil) {
            dict["ImageList"] = self.ImageList!.map({$0.dictionary})
        }
        
        if(self.InteractiveList != nil) {
            dict["InteractiveList"] = self.InteractiveList!.map({$0.dictionary})
        }
        
        if(self.AncillaryList != nil) {
            dict["AncillaryList"] = self.AncillaryList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

