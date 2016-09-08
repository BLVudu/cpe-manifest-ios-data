import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEBackgroundAdaptationType : NSObject{
    
    var ScaleMethod: String?
    
    var PositioningMethod: String?
    
    var FillColor: String?
    
    var SafeArea: NGEImageSubAreaType?
    
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
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("ScaleMethod" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ScaleMethodElementValue = xmlTextReaderConstValue(reader)
                    if ScaleMethodElementValue != nil {
                        
                        self.ScaleMethod = String.fromCString(UnsafePointer<CChar>(ScaleMethodElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PositioningMethod" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PositioningMethodElementValue = xmlTextReaderConstValue(reader)
                    if PositioningMethodElementValue != nil {
                        
                        self.PositioningMethod = String.fromCString(UnsafePointer<CChar>(PositioningMethodElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("FillColor" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let FillColorElementValue = xmlTextReaderConstValue(reader)
                    if FillColorElementValue != nil {
                        
                        self.FillColor = String.fromCString(UnsafePointer<CChar>(FillColorElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SafeArea" == _currentElementName) {
                    
                    self.SafeArea = NGEImageSubAreaType(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEBackgroundAdaptationType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.ScaleMethod != nil) {
            
            dict["ScaleMethod"] = self.ScaleMethod!
            
        }
        
        if(self.PositioningMethod != nil) {
            
            dict["PositioningMethod"] = self.PositioningMethod!
            
        }
        
        if(self.FillColor != nil) {
            
            dict["FillColor"] = self.FillColor!
            
        }
        
        if(self.SafeArea != nil) {
            dict["SafeArea"] = self.SafeArea!
        }
        
        return dict
    }*/
    
}

