import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEPresentationType : NSObject{
    
    var `PresentationID`: String!
    
    var `TrackMetadataList`: [NGETrackMetadata]!
    
    var `LanguagePairList`: [NGEPresentationLanguagePairType]?
    
    var `Chapters`: NGEChapterListType?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "PresentationID") {
            
            self.PresentationID = String(cString: attrValue)
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var TrackMetadataListArray = [NGETrackMetadata]()
        var LanguagePairListArray = [NGEPresentationLanguagePairType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("TrackMetadata" == _currentElementName) {
                        
                        TrackMetadataListArray.append(NGETrackMetadata(reader))
                        handledInChild = true
                        
                    } else if("LanguagePair" == _currentElementName) {
                        
                        LanguagePairListArray.append(NGEPresentationLanguagePairType(reader))
                        handledInChild = true
                        
                    } else if("Chapters" == _currentElementName) {
                        
                        self.Chapters = NGEChapterListType(reader)
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEPresentationType: \(_currentElementName)")
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
        
        if(TrackMetadataListArray.count > 0) { self.TrackMetadataList = TrackMetadataListArray }
        if(LanguagePairListArray.count > 0) { self.LanguagePairList = LanguagePairListArray }
        
    }
    
}

