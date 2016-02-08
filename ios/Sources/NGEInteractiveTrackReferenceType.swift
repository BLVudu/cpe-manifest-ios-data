
import Foundation

@objc
class NGEInteractiveTrackReferenceType : NSObject{
    
    var priority: Int?
    
    var InteractiveTrackID: NSURL?
    
    var CompatibilityList: [NGEDigitalAssetInteractiveEncodingType]?
    
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
        
        var CompatibilityListArray = [NGEDigitalAssetInteractiveEncodingType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("InteractiveTrackID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let InteractiveTrackIDElementValue = xmlTextReaderConstValue(reader)
                    if InteractiveTrackIDElementValue != nil {
                        
                        self.InteractiveTrackID = NSURL(string: String.fromCString(UnsafePointer<CChar>(InteractiveTrackIDElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Compatibility" == _currentElementName) {
                    
                    CompatibilityListArray.append(NGEDigitalAssetInteractiveEncodingType(reader: reader))
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
        
        if(CompatibilityListArray.count > 0) { self.CompatibilityList = CompatibilityListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.priority != nil) {
            
            dict["priority"] = self.priority!
            
        }
        
        if(self.InteractiveTrackID != nil) {
            
            dict["InteractiveTrackID"] = self.InteractiveTrackID!
            
        }
        
        if(self.CompatibilityList != nil) {
            dict["CompatibilityList"] = self.CompatibilityList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

