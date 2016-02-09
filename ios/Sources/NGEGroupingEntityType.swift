
import Foundation

@objc
class NGEGroupingEntityType : NSObject{
    
    var Type: String!
    
    var GroupIdentity: String!
    
    var DisplayNameList: [NGEDisplayName]!
    
    var Region: NGERegionType?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var DisplayNameListArray = [NGEDisplayName]()
        
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
                    
                } else if("GroupIdentity" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let GroupIdentityElementValue = xmlTextReaderConstValue(reader)
                    if GroupIdentityElementValue != nil {
                        
                        self.GroupIdentity = String.fromCString(UnsafePointer<CChar>(GroupIdentityElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("DisplayName" == _currentElementName) {
                    
                    DisplayNameListArray.append(NGEDisplayName(reader: reader))
                    handledInChild = true
                    
                } else if("Region" == _currentElementName) {
                    
                    self.Region = NGERegionType(reader: reader)
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
        
        if(DisplayNameListArray.count > 0) { self.DisplayNameList = DisplayNameListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Type != nil) {
            
            dict["Type"] = self.Type!
            
        }
        
        if(self.GroupIdentity != nil) {
            
            dict["GroupIdentity"] = self.GroupIdentity!
            
        }
        
        if(self.DisplayNameList != nil) {
            dict["DisplayNameList"] = self.DisplayNameList!.map({$0.dictionary})
        }
        
        if(self.Region != nil) {
            dict["Region"] = self.Region!
        }
        
        return dict
    }*/
    
}

