
import Foundation

@objc
class NGEBasicMetadataJobType : NSObject{
    
    var JobFunction: NGEJobFunction!
    
    var JobDisplayList: [NGEJobDisplay]?
    
    var BillingBlockOrder: Int?
    
    var CharacterList: [String]?
    
    var Guest: Bool?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        self.readAttributes(reader)
        
        var JobDisplayListArray = [NGEJobDisplay]()
        
        var CharacterListArray = [String]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("JobFunction" == _currentElementName) {
                    
                    self.JobFunction = NGEJobFunction(reader: reader)
                    handledInChild = true
                    
                } else if("JobDisplay" == _currentElementName) {
                    
                    JobDisplayListArray.append(NGEJobDisplay(reader: reader))
                    handledInChild = true
                    
                } else if("BillingBlockOrder" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let BillingBlockOrderElementValue = xmlTextReaderConstValue(reader)
                    if BillingBlockOrderElementValue != nil {
                        
                        self.BillingBlockOrder = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(BillingBlockOrderElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Character" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let CharacterElementValue = xmlTextReaderConstValue(reader)
                    if CharacterElementValue != nil {
                        
                        CharacterListArray.append(String.fromCString(UnsafePointer<CChar>(CharacterElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Guest" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let GuestElementValue = xmlTextReaderConstValue(reader)
                    if GuestElementValue != nil {
                        
                        self.Guest = String.fromCString(UnsafePointer<CChar>(GuestElementValue)) == "true"
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEBasicMetadataJobType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(JobDisplayListArray.count > 0) { self.JobDisplayList = JobDisplayListArray }
        
        if(CharacterListArray.count > 0) { self.CharacterList = CharacterListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.JobFunction != nil) {
            dict["JobFunction"] = self.JobFunction!
        }
        
        if(self.JobDisplayList != nil) {
            dict["JobDisplayList"] = self.JobDisplayList!.map({$0.dictionary})
        }
        
        if(self.BillingBlockOrder != nil) {
            
            dict["BillingBlockOrder"] = self.BillingBlockOrder!
            
        }
        
        if(self.CharacterList != nil) {
            
            dict["CharacterList"] = self.CharacterList!
            
        }
        
        if(self.Guest != nil) {
            
            dict["Guest"] = self.Guest!
            
        }
        
        return dict
    }*/
    
}

