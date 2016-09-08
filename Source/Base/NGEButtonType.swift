import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEButtonType : NSObject{
    
    var label: String?
    
    var Default: NGEDefault!
    
    var LocalizedList: [NGELocalized]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let labelAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "label").UTF8String)
        let labelAttrValue = xmlTextReaderGetAttribute(reader, labelAttrName)
        if(labelAttrValue != nil) {
            
            self.label = String.fromCString(UnsafePointer<CChar>(labelAttrValue))
            xmlFree(labelAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var LocalizedListArray = [NGELocalized]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Default" == _currentElementName) {
                    
                    self.Default = NGEDefault(reader: reader)
                    handledInChild = true
                    
                } else if("Localized" == _currentElementName) {
                    
                    LocalizedListArray.append(NGELocalized(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEButtonType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(LocalizedListArray.count > 0) { self.LocalizedList = LocalizedListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.label != nil) {
            
            dict["label"] = self.label!
            
        }
        
        if(self.Default != nil) {
            dict["Default"] = self.Default!
        }
        
        if(self.LocalizedList != nil) {
            dict["LocalizedList"] = self.LocalizedList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

