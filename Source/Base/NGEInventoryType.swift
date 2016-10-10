import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEInventoryType : NSObject{
    
    var `AudioList`: [NGEInventoryAudioType]?
    
    var `VideoList`: [NGEInventoryVideoType]?
    
    var `SubtitleList`: [NGEInventorySubtitleType]?
    
    var `ImageList`: [NGEInventoryImageType]?
    
    var `InteractiveList`: [NGEInventoryInteractiveType]?
    
    var `AncillaryList`: [NGEInventoryAncillaryType]?
    
    var `MetadataList`: [NGEInventoryMetadataType]?
    
    var `TextObjectList`: [NGEInventoryTextObjectType]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var AudioListArray = [NGEInventoryAudioType]()
        var VideoListArray = [NGEInventoryVideoType]()
        var SubtitleListArray = [NGEInventorySubtitleType]()
        var ImageListArray = [NGEInventoryImageType]()
        var InteractiveListArray = [NGEInventoryInteractiveType]()
        var AncillaryListArray = [NGEInventoryAncillaryType]()
        var MetadataListArray = [NGEInventoryMetadataType]()
        var TextObjectListArray = [NGEInventoryTextObjectType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("Audio" == _currentElementName) {
                        
                        AudioListArray.append(NGEInventoryAudioType(reader))
                        handledInChild = true
                        
                    } else if("Video" == _currentElementName) {
                        
                        VideoListArray.append(NGEInventoryVideoType(reader))
                        handledInChild = true
                        
                    } else if("Subtitle" == _currentElementName) {
                        
                        SubtitleListArray.append(NGEInventorySubtitleType(reader))
                        handledInChild = true
                        
                    } else if("Image" == _currentElementName) {
                        
                        ImageListArray.append(NGEInventoryImageType(reader))
                        handledInChild = true
                        
                    } else if("Interactive" == _currentElementName) {
                        
                        InteractiveListArray.append(NGEInventoryInteractiveType(reader))
                        handledInChild = true
                        
                    } else if("Ancillary" == _currentElementName) {
                        
                        AncillaryListArray.append(NGEInventoryAncillaryType(reader))
                        handledInChild = true
                        
                    } else if("Metadata" == _currentElementName) {
                        
                        MetadataListArray.append(NGEInventoryMetadataType(reader))
                        handledInChild = true
                        
                    } else if("TextObject" == _currentElementName) {
                        
                        TextObjectListArray.append(NGEInventoryTextObjectType(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEInventoryType: \(_currentElementName)")
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
        
        if(AudioListArray.count > 0) { self.AudioList = AudioListArray }
        if(VideoListArray.count > 0) { self.VideoList = VideoListArray }
        if(SubtitleListArray.count > 0) { self.SubtitleList = SubtitleListArray }
        if(ImageListArray.count > 0) { self.ImageList = ImageListArray }
        if(InteractiveListArray.count > 0) { self.InteractiveList = InteractiveListArray }
        if(AncillaryListArray.count > 0) { self.AncillaryList = AncillaryListArray }
        if(MetadataListArray.count > 0) { self.MetadataList = MetadataListArray }
        if(TextObjectListArray.count > 0) { self.TextObjectList = TextObjectListArray }
    }
    
}

