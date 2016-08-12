import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGENodeStyleType : NSObject{
    
    var NodeStyleID: String!
    
    var Type: String!
    
    var SubTypeList: [String]?
    
    var ThemeID: String!
    
    var Background: NGEBackgroundType?
    
    var Private: NGEPrivate?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let NodeStyleIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "NodeStyleID").UTF8String)
        let NodeStyleIDAttrValue = xmlTextReaderGetAttribute(reader, NodeStyleIDAttrName)
        if(NodeStyleIDAttrValue != nil) {
            
            self.NodeStyleID = String.fromCString(UnsafePointer<CChar>(NodeStyleIDAttrValue))
            xmlFree(NodeStyleIDAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var SubTypeListArray = [String]()
        
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
                    
                } else if("SubType" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SubTypeElementValue = xmlTextReaderConstValue(reader)
                    if SubTypeElementValue != nil {
                        
                        SubTypeListArray.append(String.fromCString(UnsafePointer<CChar>(SubTypeElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ThemeID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ThemeIDElementValue = xmlTextReaderConstValue(reader)
                    if ThemeIDElementValue != nil {
                        
                        self.ThemeID = String.fromCString(UnsafePointer<CChar>(ThemeIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Background" == _currentElementName) {
                    
                    self.Background = NGEBackgroundType(reader: reader)
                    handledInChild = true
                    
                } else if("Private" == _currentElementName) {
                    
                    self.Private = NGEPrivate(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGENodeStyleType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(SubTypeListArray.count > 0) { self.SubTypeList = SubTypeListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.NodeStyleID != nil) {
            
            dict["NodeStyleID"] = self.NodeStyleID!
            
        }
        
        if(self.Type != nil) {
            
            dict["Type"] = self.Type!
            
        }
        
        if(self.SubTypeList != nil) {
            
            dict["SubTypeList"] = self.SubTypeList!
            
        }
        
        if(self.ThemeID != nil) {
            
            dict["ThemeID"] = self.ThemeID!
            
        }
        
        if(self.Background != nil) {
            dict["Background"] = self.Background!
        }
        
        if(self.Private != nil) {
            dict["Private"] = self.Private!
        }
        
        return dict
    }*/
    
}

