
import Foundation

@objc
class NGEVideoFrameTimecode : NGETimecodeType {
    
    var VideoTrackID: String!
    
    override func readAttributes(reader: xmlTextReaderPtr) {
        super.readAttributes(reader)
        
        let VideoTrackIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "VideoTrackID").UTF8String)
        let VideoTrackIDAttrValue = xmlTextReaderGetAttribute(reader, VideoTrackIDAttrName)
        if(VideoTrackIDAttrValue != nil) {
            
            self.VideoTrackID = String.fromCString(UnsafePointer<CChar>(VideoTrackIDAttrValue))
            xmlFree(VideoTrackIDAttrValue)
        }
    }
    
    override init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init(reader: reader)
        
        var _readerOk:Int32=1
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if(true) {
                    print("Ignoring unexpected: \(_currentElementName)")
                    //break
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*override var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        for (name, value) in super.dictionary {
            dict[name] = value
        }
        
        if(self.VideoTrackID != nil) {
            
            dict["VideoTrackID"] = self.VideoTrackID!
            
        }
        
        return dict
    }*/
    
}

