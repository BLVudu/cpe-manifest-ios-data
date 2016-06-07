
import Foundation

@objc
class NGETimedEventSequenceType : NSObject{
    
    var TimedSequenceID: String!
    
    var PresentationID: String!
    
    var PlayableSequenceID: String!
    
    var TimedEventList: [NGETimedEventType]!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let TimedSequenceIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "TimedSequenceID").UTF8String)
        let TimedSequenceIDAttrValue = xmlTextReaderGetAttribute(reader, TimedSequenceIDAttrName)
        if(TimedSequenceIDAttrValue != nil) {
            
            self.TimedSequenceID = String.fromCString(UnsafePointer<CChar>(TimedSequenceIDAttrValue))
            xmlFree(TimedSequenceIDAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var TimedEventListArray = [NGETimedEventType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("PresentationID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PresentationIDElementValue = xmlTextReaderConstValue(reader)
                    if PresentationIDElementValue != nil {
                        
                        self.PresentationID = String.fromCString(UnsafePointer<CChar>(PresentationIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PlayableSequenceID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PlayableSequenceIDElementValue = xmlTextReaderConstValue(reader)
                    if PlayableSequenceIDElementValue != nil {
                        
                        self.PlayableSequenceID = String.fromCString(UnsafePointer<CChar>(PlayableSequenceIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TimedEvent" == _currentElementName) {
                    
                    TimedEventListArray.append(NGETimedEventType(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGETimedEventSequenceType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(TimedEventListArray.count > 0) { self.TimedEventList = TimedEventListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.TimedSequenceID != nil) {
            
            dict["TimedSequenceID"] = self.TimedSequenceID!
            
        }
        
        if(self.PresentationID != nil) {
            
            dict["PresentationID"] = self.PresentationID!
            
        }
        
        if(self.PlayableSequenceID != nil) {
            
            dict["PlayableSequenceID"] = self.PlayableSequenceID!
            
        }
        
        if(self.TimedEventList != nil) {
            dict["TimedEventList"] = self.TimedEventList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

