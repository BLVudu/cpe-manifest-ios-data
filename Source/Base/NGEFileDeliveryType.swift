import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEFileDeliveryType : NSObject{
    
    var `UpdateNum`: String?
    
    var `DeliveryMethod`: String!
    
    var `TransferLocation`: String?
    
    var `Organization`: NGEOrgNameType?
    
    var `Contact`: NGEContactInfoType?
    
    var `EstDeliveryDate`: Date?
    
    var `OtherInstructions`: String?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {let dateOnlyFormatter = DateFormatter()
    dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
    dateOnlyFormatter.timeZone = TimeZone(abbreviation:"UTC")
    
}

init(_ reader: xmlTextReaderPtr) {
    let _complexTypeXmlDept = xmlTextReaderDepth(reader)
    super.init()
    let dateOnlyFormatter = DateFormatter()
    dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
    dateOnlyFormatter.timeZone = TimeZone(abbreviation:"UTC")
    
    self.readAttributes(reader)
    
    var _readerOk = xmlTextReaderRead(reader)
    var _currentNodeType = xmlTextReaderNodeType(reader)
    var _currentXmlDept = xmlTextReaderDepth(reader)
    
    while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
        var handledInChild = false
        if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
            if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                let _currentElementName = String(cString: _currentElementNameXmlChar)
                if("UpdateNum" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    if let elementValue = xmlTextReaderConstValue(reader) {
                        
                        self.UpdateNum = String(cString: elementValue)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("DeliveryMethod" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    if let elementValue = xmlTextReaderConstValue(reader) {
                        
                        self.DeliveryMethod = String(cString: elementValue)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TransferLocation" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    if let elementValue = xmlTextReaderConstValue(reader) {
                        
                        self.TransferLocation = String(cString: elementValue)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Organization" == _currentElementName) {
                    
                    self.Organization = NGEOrgNameType(reader)
                    handledInChild = true
                    
                } else if("Contact" == _currentElementName) {
                    
                    self.Contact = NGEContactInfoType(reader)
                    handledInChild = true
                    
                } else if("EstDeliveryDate" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    if let elementValue = xmlTextReaderConstValue(reader) {
                        
                        self.EstDeliveryDate = dateOnlyFormatter.date(from: String(cString: elementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("OtherInstructions" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    if let elementValue = xmlTextReaderConstValue(reader) {
                        
                        self.OtherInstructions = String(cString: elementValue)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEFileDeliveryType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
        }
        _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
        _currentNodeType = xmlTextReaderNodeType(reader)
        _currentXmlDept = xmlTextReaderDepth(reader)
    }
    
}

}

