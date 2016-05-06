
import Foundation

@objc
class NGEAppDataGalleryType : NSObject{
    
    var GalleryID: String!
    
    var AutoNextSlideTime: String?
    
    var Loop: Bool?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("GalleryID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let GalleryIDElementValue = xmlTextReaderConstValue(reader)
                    if GalleryIDElementValue != nil {
                        
                        self.GalleryID = String.fromCString(UnsafePointer<CChar>(GalleryIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("AutoNextSlideTime" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AutoNextSlideTimeElementValue = xmlTextReaderConstValue(reader)
                    if AutoNextSlideTimeElementValue != nil {
                        
                        self.AutoNextSlideTime = String.fromCString(UnsafePointer<CChar>(AutoNextSlideTimeElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Loop" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let LoopElementValue = xmlTextReaderConstValue(reader)
                    if LoopElementValue != nil {
                        
                        self.Loop = String.fromCString(UnsafePointer<CChar>(LoopElementValue)) == "true"
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEAppDataGalleryType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.GalleryID != nil) {
            
            dict["GalleryID"] = self.GalleryID!
            
        }
        
        if(self.AutoNextSlideTime != nil) {
            
            dict["AutoNextSlideTime"] = self.AutoNextSlideTime!
            
        }
        
        if(self.Loop != nil) {
            
            dict["Loop"] = self.Loop!
            
        }
        
        return dict
    }*/
    
}

