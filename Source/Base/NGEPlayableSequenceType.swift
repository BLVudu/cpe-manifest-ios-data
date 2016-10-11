import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEPlayableSequenceType : NSObject{
    
    var `ClipList`: [NGEAudiovisualClipRefType]!
    
    var `ImageClipList`: [NGEImageClipRefType]?
    
    var `ReferenceIDList`: [NGEContentIdentifierType]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var ClipListArray = [NGEAudiovisualClipRefType]()
        var ImageClipListArray = [NGEImageClipRefType]()
        var ReferenceIDListArray = [NGEContentIdentifierType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("Clip" == _currentElementName) {
                        
                        ClipListArray.append(NGEAudiovisualClipRefType(reader))
                        handledInChild = true
                        
                    } else if("ImageClip" == _currentElementName) {
                        
                        ImageClipListArray.append(NGEImageClipRefType(reader))
                        handledInChild = true
                        
                    } else if("ReferenceID" == _currentElementName) {
                        
                        ReferenceIDListArray.append(NGEContentIdentifierType(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEPlayableSequenceType: \(_currentElementName)")
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
        
        if(ClipListArray.count > 0) { self.ClipList = ClipListArray }
        if(ImageClipListArray.count > 0) { self.ImageClipList = ImageClipListArray }
        if(ReferenceIDListArray.count > 0) { self.ReferenceIDList = ReferenceIDListArray }
    }
    
}

