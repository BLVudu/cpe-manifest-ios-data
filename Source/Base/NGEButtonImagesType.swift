import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEButtonImagesType : NSObject{
    
    var BaseImage: String!
    
    var HighlightImage: String!
    
    var DefocusImage: String!
    
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
                if("BaseImage" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let BaseImageElementValue = xmlTextReaderConstValue(reader)
                    if BaseImageElementValue != nil {
                        
                        self.BaseImage = String.fromCString(UnsafePointer<CChar>(BaseImageElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("HighlightImage" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let HighlightImageElementValue = xmlTextReaderConstValue(reader)
                    if HighlightImageElementValue != nil {
                        
                        self.HighlightImage = String.fromCString(UnsafePointer<CChar>(HighlightImageElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("DefocusImage" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let DefocusImageElementValue = xmlTextReaderConstValue(reader)
                    if DefocusImageElementValue != nil {
                        
                        self.DefocusImage = String.fromCString(UnsafePointer<CChar>(DefocusImageElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEButtonImagesType: \(_currentElementName)")
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
        
        if(self.BaseImage != nil) {
            
            dict["BaseImage"] = self.BaseImage!
            
        }
        
        if(self.HighlightImage != nil) {
            
            dict["HighlightImage"] = self.HighlightImage!
            
        }
        
        if(self.DefocusImage != nil) {
            
            dict["DefocusImage"] = self.DefocusImage!
            
        }
        
        return dict
    }*/
    
}

