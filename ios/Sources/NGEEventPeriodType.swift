
import Foundation

@objc
class NGEEventPeriodType : NSObject{
    
    var absolute: Bool?
    
    var Type: NGEType?
    
    var Name: String?
    
    var Start: NSDate!
    
    var End: NSDate?
    
    var FictionalStart: NGEFictionalStart!
    
    var FictionalEnd: NGEFictionalEnd?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        let dateOnlyFormatter = NSDateFormatter()
        dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
        dateOnlyFormatter.timeZone = NSTimeZone(name:"UTC")
        
        let absoluteAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "absolute").UTF8String)
        let absoluteAttrValue = xmlTextReaderGetAttribute(reader, absoluteAttrName)
        if(absoluteAttrValue != nil) {
            
            self.absolute = (String.fromCString(UnsafePointer<CChar>(absoluteAttrValue)) == "true")
            xmlFree(absoluteAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let dateOnlyFormatter = NSDateFormatter()
        dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
        dateOnlyFormatter.timeZone = NSTimeZone(name:"UTC")
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Type" == _currentElementName) {
                    
                    self.Type = NGEType(reader: reader)
                    handledInChild = true
                    
                } else if("Name" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let NameElementValue = xmlTextReaderConstValue(reader)
                    if NameElementValue != nil {
                        
                        self.Name = String.fromCString(UnsafePointer<CChar>(NameElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Start" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let StartElementValue = xmlTextReaderConstValue(reader)
                    if StartElementValue != nil {
                        
                        self.Start = dateOnlyFormatter.dateFromString(String.fromCString(UnsafePointer<CChar>(StartElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("End" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let EndElementValue = xmlTextReaderConstValue(reader)
                    if EndElementValue != nil {
                        
                        self.End = dateOnlyFormatter.dateFromString(String.fromCString(UnsafePointer<CChar>(EndElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("FictionalStart" == _currentElementName) {
                    
                    self.FictionalStart = NGEFictionalStart(reader: reader)
                    handledInChild = true
                    
                } else if("FictionalEnd" == _currentElementName) {
                    
                    self.FictionalEnd = NGEFictionalEnd(reader: reader)
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
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.absolute != nil) {
            
            dict["absolute"] = self.absolute!
            
        }
        
        if(self.Type != nil) {
            dict["Type"] = self.Type!
        }
        
        if(self.Name != nil) {
            
            dict["Name"] = self.Name!
            
        }
        
        if(self.Start != nil) {
            
            dict["Start"] = self.Start!
            
        }
        
        if(self.End != nil) {
            
            dict["End"] = self.End!
            
        }
        
        if(self.FictionalStart != nil) {
            dict["FictionalStart"] = self.FictionalStart!
        }
        
        if(self.FictionalEnd != nil) {
            dict["FictionalEnd"] = self.FictionalEnd!
        }
        
        return dict
    }*/
    
}

