import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGECompObjEntryType : NSObject{
    
    var DisplayNameList: [NGEStringAndLanguageType]?
    
    var EntryNumber: String?
    
    var EntryClass: String?
    
    var EntryList: [NGECompObjEntryType]?
    
    var ContentID: String!
    
    var BasicMetadata: NGEBasicMetadataType!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var DisplayNameListArray = [NGEStringAndLanguageType]()
        
        var EntryListArray = [NGECompObjEntryType]()
        
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
                    
                } else if("EntryNumber" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let EntryNumberElementValue = xmlTextReaderConstValue(reader)
                    if EntryNumberElementValue != nil {
                        
                        self.EntryNumber = String.fromCString(UnsafePointer<CChar>(EntryNumberElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("EntryClass" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let EntryClassElementValue = xmlTextReaderConstValue(reader)
                    if EntryClassElementValue != nil {
                        
                        self.EntryClass = String.fromCString(UnsafePointer<CChar>(EntryClassElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Entry" == _currentElementName) {
                    
                    EntryListArray.append(NGECompObjEntryType(reader: reader))
                    handledInChild = true
                    
                } else if("ContentID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ContentIDElementValue = xmlTextReaderConstValue(reader)
                    if ContentIDElementValue != nil {
                        
                        self.ContentID = String.fromCString(UnsafePointer<CChar>(ContentIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("BasicMetadata" == _currentElementName) {
                    
                    self.BasicMetadata = NGEBasicMetadataType(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGECompObjEntryType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(DisplayNameListArray.count > 0) { self.DisplayNameList = DisplayNameListArray }
        
        if(EntryListArray.count > 0) { self.EntryList = EntryListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.DisplayNameList != nil) {
            dict["DisplayNameList"] = self.DisplayNameList!.map({$0.dictionary})
        }
        
        if(self.EntryNumber != nil) {
            
            dict["EntryNumber"] = self.EntryNumber!
            
        }
        
        if(self.EntryClass != nil) {
            
            dict["EntryClass"] = self.EntryClass!
            
        }
        
        if(self.EntryList != nil) {
            dict["EntryList"] = self.EntryList!.map({$0.dictionary})
        }
        
        if(self.ContentID != nil) {
            
            dict["ContentID"] = self.ContentID!
            
        }
        
        if(self.BasicMetadata != nil) {
            dict["BasicMetadata"] = self.BasicMetadata!
        }
        
        return dict
    }*/
    
}

