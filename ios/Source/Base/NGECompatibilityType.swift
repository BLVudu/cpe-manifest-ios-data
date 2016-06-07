
import Foundation

@objc
class NGECompatibilityType : NSObject{
    
    var SpecVersion: String!
    
    var SystemList: [String]?
    
    var Profile: String!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var SystemListArray = [String]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("SpecVersion" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SpecVersionElementValue = xmlTextReaderConstValue(reader)
                    if SpecVersionElementValue != nil {
                        
                        self.SpecVersion = String.fromCString(UnsafePointer<CChar>(SpecVersionElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("System" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SystemElementValue = xmlTextReaderConstValue(reader)
                    if SystemElementValue != nil {
                        
                        SystemListArray.append(String.fromCString(UnsafePointer<CChar>(SystemElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Profile" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ProfileElementValue = xmlTextReaderConstValue(reader)
                    if ProfileElementValue != nil {
                        
                        self.Profile = String.fromCString(UnsafePointer<CChar>(ProfileElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGECompatibilityType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(SystemListArray.count > 0) { self.SystemList = SystemListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.SpecVersion != nil) {
            
            dict["SpecVersion"] = self.SpecVersion!
            
        }
        
        if(self.SystemList != nil) {
            
            dict["SystemList"] = self.SystemList!
            
        }
        
        if(self.Profile != nil) {
            
            dict["Profile"] = self.Profile!
            
        }
        
        return dict
    }*/
    
}

