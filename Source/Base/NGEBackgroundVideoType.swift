import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEBackgroundVideoType : NSObject{
    
    var Inherit: Bool!
    
    var PresentationID: String!
    
    var PlayableSequenceID: String!
    
    var LoopTimecode: NGETimecodeType?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Inherit" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let InheritElementValue = xmlTextReaderConstValue(reader)
                    if InheritElementValue != nil {
                        
                        self.Inherit = String.fromCString(UnsafePointer<CChar>(InheritElementValue)) == "true"
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PresentationID" == _currentElementName) {
                    
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
                    
                } else if("LoopTimecode" == _currentElementName) {
                    
                    self.LoopTimecode = NGETimecodeType(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEBackgroundVideoType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Inherit != nil) {
            
            dict["Inherit"] = self.Inherit!
            
        }
        
        if(self.PresentationID != nil) {
            
            dict["PresentationID"] = self.PresentationID!
            
        }
        
        if(self.PlayableSequenceID != nil) {
            
            dict["PlayableSequenceID"] = self.PlayableSequenceID!
            
        }
        
        if(self.LoopTimecode != nil) {
            dict["LoopTimecode"] = self.LoopTimecode!
        }
        
        return dict
    }*/
    
}

