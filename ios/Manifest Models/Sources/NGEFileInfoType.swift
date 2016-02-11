
import Foundation

@objc
class NGEFileInfoType : NSObject{
    
    var Location: String!
    
    var IdentifierList: [NGEContentIdentifierType]?
    
    var FileVersion: Int?
    
    var FiileDate: NSDate?
    
    var Type: NGETypeEnum!
    
    var Length: Int?
    
    var Hash: NGEHashType?
    
    var MIMEType: String?
    
    var WrapperFormat: String?
    
    var ContainerMetadata: NGEContainerMetadataType?
    
    var Delivery: NGEFileDeliveryType?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        let dateOnlyFormatter = NSDateFormatter()
        dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
        dateOnlyFormatter.timeZone = NSTimeZone(name:"UTC")
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let dateOnlyFormatter = NSDateFormatter()
        dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
        dateOnlyFormatter.timeZone = NSTimeZone(name:"UTC")
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        self.readAttributes(reader)
        
        var IdentifierListArray = [NGEContentIdentifierType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Location" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let LocationElementValue = xmlTextReaderConstValue(reader)
                    if LocationElementValue != nil {
                        
                        self.Location = String.fromCString(UnsafePointer<CChar>(LocationElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Identifier" == _currentElementName) {
                    
                    IdentifierListArray.append(NGEContentIdentifierType(reader: reader))
                    handledInChild = true
                    
                } else if("FileVersion" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let FileVersionElementValue = xmlTextReaderConstValue(reader)
                    if FileVersionElementValue != nil {
                        
                        self.FileVersion = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(FileVersionElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("FiileDate" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let FiileDateElementValue = xmlTextReaderConstValue(reader)
                    if FiileDateElementValue != nil {
                        
                        self.FiileDate = dateOnlyFormatter.dateFromString(String.fromCString(UnsafePointer<CChar>(FiileDateElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Type" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TypeElementValue = xmlTextReaderConstValue(reader)
                    if TypeElementValue != nil {
                        
                        self.Type = NGETypeEnum.fromString(String.fromCString(UnsafePointer<CChar>(TypeElementValue)))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Length" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let LengthElementValue = xmlTextReaderConstValue(reader)
                    if LengthElementValue != nil {
                        
                        self.Length = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(LengthElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Hash" == _currentElementName) {
                    
                    self.Hash = NGEHashType(reader: reader)
                    handledInChild = true
                    
                } else if("MIMEType" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let MIMETypeElementValue = xmlTextReaderConstValue(reader)
                    if MIMETypeElementValue != nil {
                        
                        self.MIMEType = String.fromCString(UnsafePointer<CChar>(MIMETypeElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("WrapperFormat" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let WrapperFormatElementValue = xmlTextReaderConstValue(reader)
                    if WrapperFormatElementValue != nil {
                        
                        self.WrapperFormat = String.fromCString(UnsafePointer<CChar>(WrapperFormatElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ContainerMetadata" == _currentElementName) {
                    
                    self.ContainerMetadata = NGEContainerMetadataType(reader: reader)
                    handledInChild = true
                    
                } else if("Delivery" == _currentElementName) {
                    
                    self.Delivery = NGEFileDeliveryType(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEFileInfoType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(IdentifierListArray.count > 0) { self.IdentifierList = IdentifierListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Location != nil) {
            
            dict["Location"] = self.Location!
            
        }
        
        if(self.IdentifierList != nil) {
            dict["IdentifierList"] = self.IdentifierList!.map({$0.dictionary})
        }
        
        if(self.FileVersion != nil) {
            
            dict["FileVersion"] = self.FileVersion!
            
        }
        
        if(self.FiileDate != nil) {
            
            dict["FiileDate"] = self.FiileDate!
            
        }
        
        if(self.Type != nil) {
            
            let obj = NGETypeEnum.toString(Type!)
            dict["value"] = obj
            
        }
        
        if(self.Length != nil) {
            
            dict["Length"] = self.Length!
            
        }
        
        if(self.Hash != nil) {
            dict["Hash"] = self.Hash!
        }
        
        if(self.MIMEType != nil) {
            
            dict["MIMEType"] = self.MIMEType!
            
        }
        
        if(self.WrapperFormat != nil) {
            
            dict["WrapperFormat"] = self.WrapperFormat!
            
        }
        
        if(self.ContainerMetadata != nil) {
            dict["ContainerMetadata"] = self.ContainerMetadata!
        }
        
        if(self.Delivery != nil) {
            dict["Delivery"] = self.Delivery!
        }
        
        return dict
    }*/
    
}

