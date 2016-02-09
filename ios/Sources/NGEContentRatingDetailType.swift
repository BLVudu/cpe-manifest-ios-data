
import Foundation

@objc
class NGEContentRatingDetailType : NSObject{
    
    var Region: NGERegionType!
    
    var System: String!
    
    var Value: String!
    
    var ReasonList: [String]?
    
    var LinkToLogo: String?
    
    var Description: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var ReasonListArray = [String]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Region" == _currentElementName) {
                    
                    self.Region = NGERegionType(reader: reader)
                    handledInChild = true
                    
                } else if("System" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SystemElementValue = xmlTextReaderConstValue(reader)
                    if SystemElementValue != nil {
                        
                        self.System = String.fromCString(UnsafePointer<CChar>(SystemElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Value" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ValueElementValue = xmlTextReaderConstValue(reader)
                    if ValueElementValue != nil {
                        
                        self.Value = String.fromCString(UnsafePointer<CChar>(ValueElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Reason" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ReasonElementValue = xmlTextReaderConstValue(reader)
                    if ReasonElementValue != nil {
                        
                        ReasonListArray.append(String.fromCString(UnsafePointer<CChar>(ReasonElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("LinkToLogo" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let LinkToLogoElementValue = xmlTextReaderConstValue(reader)
                    if LinkToLogoElementValue != nil {
                        
                        self.LinkToLogo = String.fromCString(UnsafePointer<CChar>(LinkToLogoElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Description" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let DescriptionElementValue = xmlTextReaderConstValue(reader)
                    if DescriptionElementValue != nil {
                        
                        self.Description = String.fromCString(UnsafePointer<CChar>(DescriptionElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected: \(_currentElementName)")
                    //break
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(ReasonListArray.count > 0) { self.ReasonList = ReasonListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Region != nil) {
            dict["Region"] = self.Region!
        }
        
        if(self.System != nil) {
            
            dict["System"] = self.System!
            
        }
        
        if(self.Value != nil) {
            
            dict["Value"] = self.Value!
            
        }
        
        if(self.ReasonList != nil) {
            
            dict["ReasonList"] = self.ReasonList!
            
        }
        
        if(self.LinkToLogo != nil) {
            
            dict["LinkToLogo"] = self.LinkToLogo!
            
        }
        
        if(self.Description != nil) {
            
            dict["Description"] = self.Description!
            
        }
        
        return dict
    }*/
    
}

