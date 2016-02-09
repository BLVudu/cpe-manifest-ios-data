
import Foundation

@objc
class NGEALIDExperienceMapType : NSObject{
    
    var ALIDList: [String]!
    
    var ExperienceIDList: [NGEExperienceID]!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var ALIDListArray = [String]()
        var ExperienceIDListArray = [NGEExperienceID]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("ALID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ALIDElementValue = xmlTextReaderConstValue(reader)
                    if ALIDElementValue != nil {
                        
                        ALIDListArray.append(String.fromCString(UnsafePointer<CChar>(ALIDElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ExperienceID" == _currentElementName) {
                    
                    ExperienceIDListArray.append(NGEExperienceID(reader: reader))
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
        
        if(ALIDListArray.count > 0) { self.ALIDList = ALIDListArray }
        if(ExperienceIDListArray.count > 0) { self.ExperienceIDList = ExperienceIDListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.ALIDList != nil) {
            
            dict["ALIDList"] = self.ALIDList!
            
        }
        
        if(self.ExperienceIDList != nil) {
            dict["ExperienceIDList"] = self.ExperienceIDList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

