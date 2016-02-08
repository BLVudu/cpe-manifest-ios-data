
import Foundation

@objc
class NGEDateTimeRangeType : NSObject{
    
    var Start: NSDate?
    
    var End: NSDate?
    
    func readAttributes(reader: xmlTextReaderPtr) {let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
}

init(reader: xmlTextReaderPtr) {
    let _complexTypeXmlDept = xmlTextReaderDepth(reader)
    super.init()
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    self.readAttributes(reader)
    
    var _readerOk = xmlTextReaderRead(reader)
    var _currentNodeType = xmlTextReaderNodeType(reader)
    var _currentXmlDept = xmlTextReaderDepth(reader)
    
    while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
        
        if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
            let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
            let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
            if("Start" == _currentElementName) {
                
                _readerOk = xmlTextReaderRead(reader)
                _currentNodeType = xmlTextReaderNodeType(reader)
                let StartElementValue = xmlTextReaderConstValue(reader)
                if StartElementValue != nil {
                    
                    self.Start = dateFormatter.dateFromString(String.fromCString(UnsafePointer<CChar>(StartElementValue))!)
                    
                }
                _readerOk = xmlTextReaderRead(reader)
                _currentNodeType = xmlTextReaderNodeType(reader)
                
            } else if("End" == _currentElementName) {
                
                _readerOk = xmlTextReaderRead(reader)
                _currentNodeType = xmlTextReaderNodeType(reader)
                let EndElementValue = xmlTextReaderConstValue(reader)
                if EndElementValue != nil {
                    
                    self.End = dateFormatter.dateFromString(String.fromCString(UnsafePointer<CChar>(EndElementValue))!)
                    
                }
                _readerOk = xmlTextReaderRead(reader)
                _currentNodeType = xmlTextReaderNodeType(reader)
                
            } else   if(true) {
                print("Ignoring unexpected: \(_currentElementName)")
                //break
            }
        }
        _readerOk = xmlTextReaderRead(reader)
        _currentNodeType = xmlTextReaderNodeType(reader)
        _currentXmlDept = xmlTextReaderDepth(reader)
    }
    
}

/*var dictionary: [String: AnyObject] {
    var dict = [String: AnyObject]()
    
    if(self.Start != nil) {
        
        dict["Start"] = self.Start!
        
    }
    
    if(self.End != nil) {
        
        dict["End"] = self.End!
        
    }
    
    return dict
}*/

}

