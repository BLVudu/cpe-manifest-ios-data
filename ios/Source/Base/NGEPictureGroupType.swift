import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEPictureGroupType : NSObject{
    
    var PictureGroupID: String?
    
    var PictureList: [NGEPictureType]!
    
    var Type: String?
    
    var SubTypeList: [String]?
    
    var StyleRefList: [String]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let PictureGroupIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "PictureGroupID").UTF8String)
        let PictureGroupIDAttrValue = xmlTextReaderGetAttribute(reader, PictureGroupIDAttrName)
        if(PictureGroupIDAttrValue != nil) {
            
            self.PictureGroupID = String.fromCString(UnsafePointer<CChar>(PictureGroupIDAttrValue))
            xmlFree(PictureGroupIDAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var PictureListArray = [NGEPictureType]()
        
        var SubTypeListArray = [String]()
        var StyleRefListArray = [String]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Picture" == _currentElementName) {
                    
                    PictureListArray.append(NGEPictureType(reader: reader))
                    handledInChild = true
                    
                } else if("Type" == _currentElementName) {
                    
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
                    
                } else if("StyleRef" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let StyleRefElementValue = xmlTextReaderConstValue(reader)
                    if StyleRefElementValue != nil {
                        
                        StyleRefListArray.append(String.fromCString(UnsafePointer<CChar>(StyleRefElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEPictureGroupType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(PictureListArray.count > 0) { self.PictureList = PictureListArray }
        
        if(SubTypeListArray.count > 0) { self.SubTypeList = SubTypeListArray }
        if(StyleRefListArray.count > 0) { self.StyleRefList = StyleRefListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.PictureGroupID != nil) {
            
            dict["PictureGroupID"] = self.PictureGroupID!
            
        }
        
        if(self.PictureList != nil) {
            dict["PictureList"] = self.PictureList!.map({$0.dictionary})
        }
        
        if(self.Type != nil) {
            
            dict["Type"] = self.Type!
            
        }
        
        if(self.SubTypeList != nil) {
            
            dict["SubTypeList"] = self.SubTypeList!
            
        }
        
        if(self.StyleRefList != nil) {
            
            dict["StyleRefList"] = self.StyleRefList!
            
        }
        
        return dict
    }*/
    
}

