
import Foundation

@objc
class NGECompObjType : NSObject{
    
    var EntryList: [NGECompObjEntryType]?
    
    var CompilationClass: NGECompObjClassType?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var EntryListArray = [NGECompObjEntryType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Entry" == _currentElementName) {
                    
                    EntryListArray.append(NGECompObjEntryType(reader: reader))
                    handledInChild = true
                    
                } else if("CompilationClass" == _currentElementName) {
                    
                    self.CompilationClass = NGECompObjClassType(reader: reader)
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
        
        if(EntryListArray.count > 0) { self.EntryList = EntryListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.EntryList != nil) {
            dict["EntryList"] = self.EntryList!.map({$0.dictionary})
        }
        
        if(self.CompilationClass != nil) {
            dict["CompilationClass"] = self.CompilationClass!
        }
        
        return dict
    }*/
    
}

