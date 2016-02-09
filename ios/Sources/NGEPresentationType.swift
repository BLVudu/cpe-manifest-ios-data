
import Foundation

@objc
class NGEPresentationType : NSObject{
    
    var PresentationID: String!
    
    var TrackMetadataList: [NGETrackMetadata]!
    
    var LanguagePairList: [NGEPresentationLanguagePairType]?
    
    var Chapters: NGEChapterListType?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let PresentationIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "PresentationID").UTF8String)
        let PresentationIDAttrValue = xmlTextReaderGetAttribute(reader, PresentationIDAttrName)
        if(PresentationIDAttrValue != nil) {
            
            self.PresentationID = String.fromCString(UnsafePointer<CChar>(PresentationIDAttrValue))
            xmlFree(PresentationIDAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
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
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("TrackMetadata" == _currentElementName) {
                    
                    TrackMetadataListArray.append(NGETrackMetadata(reader: reader))
                    handledInChild = true
                    
                } else if("LanguagePair" == _currentElementName) {
                    
                    LanguagePairListArray.append(NGEPresentationLanguagePairType(reader: reader))
                    handledInChild = true
                    
                } else if("Chapters" == _currentElementName) {
                    
                    self.Chapters = NGEChapterListType(reader: reader)
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
        
        if(TrackMetadataListArray.count > 0) { self.TrackMetadataList = TrackMetadataListArray }
        if(LanguagePairListArray.count > 0) { self.LanguagePairList = LanguagePairListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.PresentationID != nil) {
            
            dict["PresentationID"] = self.PresentationID!
            
        }
        
        if(self.TrackMetadataList != nil) {
            dict["TrackMetadataList"] = self.TrackMetadataList!.map({$0.dictionary})
        }
        
        if(self.LanguagePairList != nil) {
            dict["LanguagePairList"] = self.LanguagePairList!.map({$0.dictionary})
        }
        
        if(self.Chapters != nil) {
            dict["Chapters"] = self.Chapters!
        }
        
        return dict
    }*/
    
}

