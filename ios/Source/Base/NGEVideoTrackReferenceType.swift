
import Foundation

@objc
class NGEVideoTrackReferenceType : NSObject{
    
    var priority: Int?
    
    var VideoTrackIDList: [String]!
    
    var AdaptationSetID: NGEAdaptationSetID?
    
    var TrackProfileList: [NGEMediaProfileType]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let priorityAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "priority").UTF8String)
        let priorityAttrValue = xmlTextReaderGetAttribute(reader, priorityAttrName)
        if(priorityAttrValue != nil) {
            
            self.priority = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(priorityAttrValue))!)!.integerValue
            xmlFree(priorityAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        self.readAttributes(reader)
        
        var VideoTrackIDListArray = [String]()
        
        var TrackProfileListArray = [NGEMediaProfileType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("VideoTrackID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let VideoTrackIDElementValue = xmlTextReaderConstValue(reader)
                    if VideoTrackIDElementValue != nil {
                        
                        VideoTrackIDListArray.append(String.fromCString(UnsafePointer<CChar>(VideoTrackIDElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("AdaptationSetID" == _currentElementName) {
                    
                    self.AdaptationSetID = NGEAdaptationSetID(reader: reader)
                    handledInChild = true
                    
                } else if("TrackProfile" == _currentElementName) {
                    
                    TrackProfileListArray.append(NGEMediaProfileType(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEVideoTrackReferenceType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(VideoTrackIDListArray.count > 0) { self.VideoTrackIDList = VideoTrackIDListArray }
        
        if(TrackProfileListArray.count > 0) { self.TrackProfileList = TrackProfileListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.priority != nil) {
            
            dict["priority"] = self.priority!
            
        }
        
        if(self.VideoTrackIDList != nil) {
            
            dict["VideoTrackIDList"] = self.VideoTrackIDList!
            
        }
        
        if(self.AdaptationSetID != nil) {
            dict["AdaptationSetID"] = self.AdaptationSetID!
        }
        
        if(self.TrackProfileList != nil) {
            dict["TrackProfileList"] = self.TrackProfileList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

