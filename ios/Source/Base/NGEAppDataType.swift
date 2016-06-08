import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEAppDataType : NSObject{
    
    var AppID: String!
    
    var updateNum: Int?
    
    var Type: String?
    
    var SubTypeList: [String]?
    
    var AppGroupID: String?
    
    var NVPairList: [NGEAppNVPairType]!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let AppIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "AppID").UTF8String)
        let AppIDAttrValue = xmlTextReaderGetAttribute(reader, AppIDAttrName)
        if(AppIDAttrValue != nil) {
            
            self.AppID = String.fromCString(UnsafePointer<CChar>(AppIDAttrValue))
            xmlFree(AppIDAttrValue)
        }
        let updateNumAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "updateNum").UTF8String)
        let updateNumAttrValue = xmlTextReaderGetAttribute(reader, updateNumAttrName)
        if(updateNumAttrValue != nil) {
            
            self.updateNum = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(updateNumAttrValue))!)!.integerValue
            xmlFree(updateNumAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        self.readAttributes(reader)
        
        var SubTypeListArray = [String]()
        
        var NVPairListArray = [NGEAppNVPairType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Type" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TypeElementValue = xmlTextReaderConstValue(reader)
                    if TypeElementValue != nil {
                        
                        self.Type = String.fromCString(UnsafePointer<CChar>(TypeElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SubType" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SubTypeElementValue = xmlTextReaderConstValue(reader)
                    if SubTypeElementValue != nil {
                        
                        SubTypeListArray.append(String.fromCString(UnsafePointer<CChar>(SubTypeElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("AppGroupID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AppGroupIDElementValue = xmlTextReaderConstValue(reader)
                    if AppGroupIDElementValue != nil {
                        
                        self.AppGroupID = String.fromCString(UnsafePointer<CChar>(AppGroupIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("NVPair" == _currentElementName) {
                    
                    NVPairListArray.append(NGEAppNVPairType(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEAppDataType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(SubTypeListArray.count > 0) { self.SubTypeList = SubTypeListArray }
        
        if(NVPairListArray.count > 0) { self.NVPairList = NVPairListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.AppID != nil) {
            
            dict["AppID"] = self.AppID!
            
        }
        
        if(self.updateNum != nil) {
            
            dict["updateNum"] = self.updateNum!
            
        }
        
        if(self.Type != nil) {
            
            dict["Type"] = self.Type!
            
        }
        
        if(self.SubTypeList != nil) {
            
            dict["SubTypeList"] = self.SubTypeList!
            
        }
        
        if(self.AppGroupID != nil) {
            
            dict["AppGroupID"] = self.AppGroupID!
            
        }
        
        if(self.NVPairList != nil) {
            dict["NVPairList"] = self.NVPairList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

