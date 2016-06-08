import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEGalleryType : NSObject{
    
    var GalleryID: String?
    
    var Type: String!
    
    var SubTypeList: [String]?
    
    var PictureGroupID: String!
    
    var GalleryNameList: [NGEGalleryName]?
    
    var ContentID: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let GalleryIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "GalleryID").UTF8String)
        let GalleryIDAttrValue = xmlTextReaderGetAttribute(reader, GalleryIDAttrName)
        if(GalleryIDAttrValue != nil) {
            
            self.GalleryID = String.fromCString(UnsafePointer<CChar>(GalleryIDAttrValue))
            xmlFree(GalleryIDAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var SubTypeListArray = [String]()
        
        var GalleryNameListArray = [NGEGalleryName]()
        
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
                    
                } else if("PictureGroupID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PictureGroupIDElementValue = xmlTextReaderConstValue(reader)
                    if PictureGroupIDElementValue != nil {
                        
                        self.PictureGroupID = String.fromCString(UnsafePointer<CChar>(PictureGroupIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("GalleryName" == _currentElementName) {
                    
                    GalleryNameListArray.append(NGEGalleryName(reader: reader))
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
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEGalleryType: \(_currentElementName)")
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
        
        if(GalleryNameListArray.count > 0) { self.GalleryNameList = GalleryNameListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.GalleryID != nil) {
            
            dict["GalleryID"] = self.GalleryID!
            
        }
        
        if(self.Type != nil) {
            
            dict["Type"] = self.Type!
            
        }
        
        if(self.SubTypeList != nil) {
            
            dict["SubTypeList"] = self.SubTypeList!
            
        }
        
        if(self.PictureGroupID != nil) {
            
            dict["PictureGroupID"] = self.PictureGroupID!
            
        }
        
        if(self.GalleryNameList != nil) {
            dict["GalleryNameList"] = self.GalleryNameList!.map({$0.dictionary})
        }
        
        if(self.ContentID != nil) {
            
            dict["ContentID"] = self.ContentID!
            
        }
        
        return dict
    }*/
    
}

