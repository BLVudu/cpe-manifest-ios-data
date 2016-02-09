
import Foundation

@objc
class NGEReleaseHistoryType : NSObject{
    
    var ReleaseType: NGEReleaseType!
    
    var DistrTerritory: NGERegionType?
    
    var Date: NGEDate!
    
    var Description: String?
    
    var ReleaseOrgList: [NGEOrgNameType]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var ReleaseOrgListArray = [NGEOrgNameType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("ReleaseType" == _currentElementName) {
                    
                    self.ReleaseType = NGEReleaseType(reader: reader)
                    handledInChild = true
                    
                } else if("DistrTerritory" == _currentElementName) {
                    
                    self.DistrTerritory = NGERegionType(reader: reader)
                    handledInChild = true
                    
                } else if("Date" == _currentElementName) {
                    
                    self.Date = NGEDate(reader: reader)
                    handledInChild = true
                    
                } else if("Description" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let DescriptionElementValue = xmlTextReaderConstValue(reader)
                    if DescriptionElementValue != nil {
                        
                        self.Description = String.fromCString(UnsafePointer<CChar>(DescriptionElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ReleaseOrg" == _currentElementName) {
                    
                    ReleaseOrgListArray.append(NGEOrgNameType(reader: reader))
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
        
        if(ReleaseOrgListArray.count > 0) { self.ReleaseOrgList = ReleaseOrgListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.ReleaseType != nil) {
            dict["ReleaseType"] = self.ReleaseType!
        }
        
        if(self.DistrTerritory != nil) {
            dict["DistrTerritory"] = self.DistrTerritory!
        }
        
        if(self.Date != nil) {
            dict["Date"] = self.Date!
        }
        
        if(self.Description != nil) {
            
            dict["Description"] = self.Description!
            
        }
        
        if(self.ReleaseOrgList != nil) {
            dict["ReleaseOrgList"] = self.ReleaseOrgList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

