import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEOrgNameType : NSObject{
    
    var organizationID: String?
    
    var idType: String?
    
    var DisplayName: String!
    
    var SortName: String?
    
    var AlternateNameList: [String]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let organizationIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "organizationID").UTF8String)
        let organizationIDAttrValue = xmlTextReaderGetAttribute(reader, organizationIDAttrName)
        if(organizationIDAttrValue != nil) {
            
            self.organizationID = String.fromCString(UnsafePointer<CChar>(organizationIDAttrValue))
            xmlFree(organizationIDAttrValue)
        }
        let idTypeAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "idType").UTF8String)
        let idTypeAttrValue = xmlTextReaderGetAttribute(reader, idTypeAttrName)
        if(idTypeAttrValue != nil) {
            
            self.idType = String.fromCString(UnsafePointer<CChar>(idTypeAttrValue))
            xmlFree(idTypeAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var AlternateNameListArray = [String]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("DisplayName" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let DisplayNameElementValue = xmlTextReaderConstValue(reader)
                    if DisplayNameElementValue != nil {
                        
                        self.DisplayName = String.fromCString(UnsafePointer<CChar>(DisplayNameElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SortName" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SortNameElementValue = xmlTextReaderConstValue(reader)
                    if SortNameElementValue != nil {
                        
                        self.SortName = String.fromCString(UnsafePointer<CChar>(SortNameElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("AlternateName" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AlternateNameElementValue = xmlTextReaderConstValue(reader)
                    if AlternateNameElementValue != nil {
                        
                        AlternateNameListArray.append(String.fromCString(UnsafePointer<CChar>(AlternateNameElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEOrgNameType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(AlternateNameListArray.count > 0) { self.AlternateNameList = AlternateNameListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.organizationID != nil) {
            
            dict["organizationID"] = self.organizationID!
            
        }
        
        if(self.idType != nil) {
            
            dict["idType"] = self.idType!
            
        }
        
        if(self.DisplayName != nil) {
            
            dict["DisplayName"] = self.DisplayName!
            
        }
        
        if(self.SortName != nil) {
            
            dict["SortName"] = self.SortName!
            
        }
        
        if(self.AlternateNameList != nil) {
            
            dict["AlternateNameList"] = self.AlternateNameList!
            
        }
        
        return dict
    }*/
    
}

