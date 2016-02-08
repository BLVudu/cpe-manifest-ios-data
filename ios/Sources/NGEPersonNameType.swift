
import Foundation

@objc
class NGEPersonNameType : NSObject{
    
    var DisplayNameList: [NGEStringAndLanguageType]?
    
    var SortNameList: [NGEStringAndLanguageType]?
    
    var FirstGivenName: String?
    
    var SecondGivenName: String?
    
    var FamilyName: String?
    
    var Suffix: String?
    
    var Moniker: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var DisplayNameListArray = [NGEStringAndLanguageType]()
        var SortNameListArray = [NGEStringAndLanguageType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("DisplayName" == _currentElementName) {
                    
                    DisplayNameListArray.append(NGEStringAndLanguageType(reader: reader))
                    handledInChild = true
                    
                } else if("SortName" == _currentElementName) {
                    
                    SortNameListArray.append(NGEStringAndLanguageType(reader: reader))
                    handledInChild = true
                    
                } else if("FirstGivenName" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let FirstGivenNameElementValue = xmlTextReaderConstValue(reader)
                    if FirstGivenNameElementValue != nil {
                        
                        self.FirstGivenName = String.fromCString(UnsafePointer<CChar>(FirstGivenNameElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SecondGivenName" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SecondGivenNameElementValue = xmlTextReaderConstValue(reader)
                    if SecondGivenNameElementValue != nil {
                        
                        self.SecondGivenName = String.fromCString(UnsafePointer<CChar>(SecondGivenNameElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("FamilyName" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let FamilyNameElementValue = xmlTextReaderConstValue(reader)
                    if FamilyNameElementValue != nil {
                        
                        self.FamilyName = String.fromCString(UnsafePointer<CChar>(FamilyNameElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Suffix" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SuffixElementValue = xmlTextReaderConstValue(reader)
                    if SuffixElementValue != nil {
                        
                        self.Suffix = String.fromCString(UnsafePointer<CChar>(SuffixElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Moniker" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let MonikerElementValue = xmlTextReaderConstValue(reader)
                    if MonikerElementValue != nil {
                        
                        self.Moniker = String.fromCString(UnsafePointer<CChar>(MonikerElementValue))
                        
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
        
        if(DisplayNameListArray.count > 0) { self.DisplayNameList = DisplayNameListArray }
        if(SortNameListArray.count > 0) { self.SortNameList = SortNameListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.DisplayNameList != nil) {
            dict["DisplayNameList"] = self.DisplayNameList!.map({$0.dictionary})
        }
        
        if(self.SortNameList != nil) {
            dict["SortNameList"] = self.SortNameList!.map({$0.dictionary})
        }
        
        if(self.FirstGivenName != nil) {
            
            dict["FirstGivenName"] = self.FirstGivenName!
            
        }
        
        if(self.SecondGivenName != nil) {
            
            dict["SecondGivenName"] = self.SecondGivenName!
            
        }
        
        if(self.FamilyName != nil) {
            
            dict["FamilyName"] = self.FamilyName!
            
        }
        
        if(self.Suffix != nil) {
            
            dict["Suffix"] = self.Suffix!
            
        }
        
        if(self.Moniker != nil) {
            
            dict["Moniker"] = self.Moniker!
            
        }
        
        return dict
    }*/
    
}

