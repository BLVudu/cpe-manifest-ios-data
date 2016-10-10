import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGECompObjEntryType : NSObject{
    
    var `DisplayNameList`: [NGEStringAndLanguageType]?
    
    var `EntryNumber`: String?
    
    var `EntryClass`: String?
    
    var `EntryList`: [NGECompObjEntryType]?
    
    var `ContentID`: String!
    
    var `BasicMetadata`: NGEBasicMetadataType!
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
    }
    
    init(_ reader: xmlTextReaderPtr) {
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
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("DisplayName" == _currentElementName) {
                        
                        DisplayNameListArray.append(NGEStringAndLanguageType(reader))
                        handledInChild = true
                        
                    } else if("EntryNumber" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.EntryNumber = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("EntryClass" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.EntryClass = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Entry" == _currentElementName) {
                        
                        EntryListArray.append(NGECompObjEntryType(reader))
                        handledInChild = true
                        
                    } else if("ContentID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.ContentID = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("BasicMetadata" == _currentElementName) {
                        
                        self.BasicMetadata = NGEBasicMetadataType(reader)
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGECompObjEntryType: \(_currentElementName)")
                        if superclass != NSObject.self {
                            break
                        }
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
    
}

