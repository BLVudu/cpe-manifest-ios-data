
import Foundation

@objc
class NGEExperienceChildType : NSObject{
    
    var Relationship: String?
    
    var SequenceInfo: NGEContentSequenceInfoType?
    
    var ExperienceID: NSURL?
    
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
                if("Relationship" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let RelationshipElementValue = xmlTextReaderConstValue(reader)
                    if RelationshipElementValue != nil {
                        
                        self.Relationship = String.fromCString(UnsafePointer<CChar>(RelationshipElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SequenceInfo" == _currentElementName) {
                    
                    self.SequenceInfo = NGEContentSequenceInfoType(reader: reader)
                    handledInChild = true
                    
                } else if("ExperienceID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ExperienceIDElementValue = xmlTextReaderConstValue(reader)
                    if ExperienceIDElementValue != nil {
                        
                        self.ExperienceID = NSURL(string: String.fromCString(UnsafePointer<CChar>(ExperienceIDElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected: \(_currentElementName)")
                    //break
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Relationship != nil) {
            
            dict["Relationship"] = self.Relationship!
            
        }
        
        if(self.SequenceInfo != nil) {
            dict["SequenceInfo"] = self.SequenceInfo!
        }
        
        if(self.ExperienceID != nil) {
            
            dict["ExperienceID"] = self.ExperienceID!
            
        }
        
        return dict
    }*/
    
}

