
import Foundation

@objc
class NGEContactInfoType : NSObject{
    
    var Name: String?
    
    var PrimaryEmail: String?
    
    var AlternateEmailList: [String]?
    
    var AddressList: [String]?
    
    var PhoneList: [NGEPhone]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var AlternateEmailListArray = [String]()
        var AddressListArray = [String]()
        var PhoneListArray = [NGEPhone]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Name" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let NameElementValue = xmlTextReaderConstValue(reader)
                    if NameElementValue != nil {
                        
                        self.Name = String.fromCString(UnsafePointer<CChar>(NameElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PrimaryEmail" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PrimaryEmailElementValue = xmlTextReaderConstValue(reader)
                    if PrimaryEmailElementValue != nil {
                        
                        self.PrimaryEmail = String.fromCString(UnsafePointer<CChar>(PrimaryEmailElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("AlternateEmail" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AlternateEmailElementValue = xmlTextReaderConstValue(reader)
                    if AlternateEmailElementValue != nil {
                        
                        AlternateEmailListArray.append(String.fromCString(UnsafePointer<CChar>(AlternateEmailElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Address" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AddressElementValue = xmlTextReaderConstValue(reader)
                    if AddressElementValue != nil {
                        
                        AddressListArray.append(String.fromCString(UnsafePointer<CChar>(AddressElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Phone" == _currentElementName) {
                    
                    PhoneListArray.append(NGEPhone(reader: reader))
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
        
        if(AlternateEmailListArray.count > 0) { self.AlternateEmailList = AlternateEmailListArray }
        if(AddressListArray.count > 0) { self.AddressList = AddressListArray }
        if(PhoneListArray.count > 0) { self.PhoneList = PhoneListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Name != nil) {
            
            dict["Name"] = self.Name!
            
        }
        
        if(self.PrimaryEmail != nil) {
            
            dict["PrimaryEmail"] = self.PrimaryEmail!
            
        }
        
        if(self.AlternateEmailList != nil) {
            
            dict["AlternateEmailList"] = self.AlternateEmailList!
            
        }
        
        if(self.AddressList != nil) {
            
            dict["AddressList"] = self.AddressList!
            
        }
        
        if(self.PhoneList != nil) {
            dict["PhoneList"] = self.PhoneList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

