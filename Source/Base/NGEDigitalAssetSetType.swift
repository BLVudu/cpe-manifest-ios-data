import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDigitalAssetSetType : NSObject{
    
    var `AudioList`: [NGEDigitalAssetAudioDataType]?
    
    var `VideoList`: [NGEDigitalAssetVideoDataType]?
    
    var `SubtitleList`: [NGEDigitalAssetSubtitleDataType]?
    
    var `ImageList`: [NGEDigitalAssetImageDataType]?
    
    var `InteractiveList`: [NGEDigitalAssetInteractiveDataType]?
    
    var `AncillaryList`: [NGEDigitalAssetAncillaryDataType]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
    }
    
    init(_ reader: xmlTextReaderPtr) {
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
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("Audio" == _currentElementName) {
                        
                        AudioListArray.append(NGEDigitalAssetAudioDataType(reader))
                        handledInChild = true
                        
                    } else if("Video" == _currentElementName) {
                        
                        VideoListArray.append(NGEDigitalAssetVideoDataType(reader))
                        handledInChild = true
                        
                    } else if("Subtitle" == _currentElementName) {
                        
                        SubtitleListArray.append(NGEDigitalAssetSubtitleDataType(reader))
                        handledInChild = true
                        
                    } else if("Image" == _currentElementName) {
                        
                        ImageListArray.append(NGEDigitalAssetImageDataType(reader))
                        handledInChild = true
                        
                    } else if("Interactive" == _currentElementName) {
                        
                        InteractiveListArray.append(NGEDigitalAssetInteractiveDataType(reader))
                        handledInChild = true
                        
                    } else if("Ancillary" == _currentElementName) {
                        
                        AncillaryListArray.append(NGEDigitalAssetAncillaryDataType(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEDigitalAssetSetType: \(_currentElementName)")
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
    }
    
}

