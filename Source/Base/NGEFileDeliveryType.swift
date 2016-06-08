import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEFileDeliveryType : NSObject{
    
    var UpdateNum: String?
    
    var DeliveryMethod: String!
    
    var TransferLocation: String?
    
    var Organization: NGEOrgNameType?
    
    var Contact: NGEContactInfoType?
    
    var EstDeliveryDate: NSDate?
    
    var OtherInstructions: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        let dateOnlyFormatter = NSDateFormatter()
        dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
        dateOnlyFormatter.timeZone = NSTimeZone(name:"UTC")
        
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
                if("UpdateNum" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let UpdateNumElementValue = xmlTextReaderConstValue(reader)
                    if UpdateNumElementValue != nil {
                        
                        self.UpdateNum = String.fromCString(UnsafePointer<CChar>(UpdateNumElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("DeliveryMethod" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let DeliveryMethodElementValue = xmlTextReaderConstValue(reader)
                    if DeliveryMethodElementValue != nil {
                        
                        self.DeliveryMethod = String.fromCString(UnsafePointer<CChar>(DeliveryMethodElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TransferLocation" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TransferLocationElementValue = xmlTextReaderConstValue(reader)
                    if TransferLocationElementValue != nil {
                        
                        self.TransferLocation = String.fromCString(UnsafePointer<CChar>(TransferLocationElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Organization" == _currentElementName) {
                    
                    self.Organization = NGEOrgNameType(reader: reader)
                    handledInChild = true
                    
                } else if("Contact" == _currentElementName) {
                    
                    self.Contact = NGEContactInfoType(reader: reader)
                    handledInChild = true
                    
                } else if("EstDeliveryDate" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let EstDeliveryDateElementValue = xmlTextReaderConstValue(reader)
                    if EstDeliveryDateElementValue != nil {
                        
                        self.EstDeliveryDate = dateOnlyFormatter.dateFromString(String.fromCString(UnsafePointer<CChar>(EstDeliveryDateElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("OtherInstructions" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let OtherInstructionsElementValue = xmlTextReaderConstValue(reader)
                    if OtherInstructionsElementValue != nil {
                        
                        self.OtherInstructions = String.fromCString(UnsafePointer<CChar>(OtherInstructionsElementValue))
                        
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
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.UpdateNum != nil) {
            
            dict["UpdateNum"] = self.UpdateNum!
            
        }
        
        if(self.DeliveryMethod != nil) {
            
            dict["DeliveryMethod"] = self.DeliveryMethod!
            
        }
        
        if(self.TransferLocation != nil) {
            
            dict["TransferLocation"] = self.TransferLocation!
            
        }
        
        if(self.Organization != nil) {
            dict["Organization"] = self.Organization!
        }
        
        if(self.Contact != nil) {
            dict["Contact"] = self.Contact!
        }
        
        if(self.EstDeliveryDate != nil) {
            
            dict["EstDeliveryDate"] = self.EstDeliveryDate!
            
        }
        
        if(self.OtherInstructions != nil) {
            
            dict["OtherInstructions"] = self.OtherInstructions!
            
        }
        
        return dict
    }*/
    
}

