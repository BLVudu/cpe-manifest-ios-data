import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEColorPaletteType : NSObject{
    
    var NeutralPalette: NGENeutralPaletteEnum!
    
    var Base: NGEColorPaletteInstanceType!
    
    var Highlight: NGEColorPaletteInstanceType!
    
    var Defocus: NGEColorPaletteInstanceType!
    
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
                if("NeutralPalette" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let NeutralPaletteElementValue = xmlTextReaderConstValue(reader)
                    if NeutralPaletteElementValue != nil {
                        
                        self.NeutralPalette = NGENeutralPaletteEnum.fromString(String.fromCString(UnsafePointer<CChar>(NeutralPaletteElementValue)))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Base" == _currentElementName) {
                    
                    self.Base = NGEColorPaletteInstanceType(reader: reader)
                    handledInChild = true
                    
                } else if("Highlight" == _currentElementName) {
                    
                    self.Highlight = NGEColorPaletteInstanceType(reader: reader)
                    handledInChild = true
                    
                } else if("Defocus" == _currentElementName) {
                    
                    self.Defocus = NGEColorPaletteInstanceType(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEColorPaletteType: \(_currentElementName)")
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
        
        if(self.NeutralPalette != nil) {
            
            let obj = NGENeutralPaletteEnum.toString(NeutralPalette!)
            dict["value"] = obj
            
        }
        
        if(self.Base != nil) {
            dict["Base"] = self.Base!
        }
        
        if(self.Highlight != nil) {
            dict["Highlight"] = self.Highlight!
        }
        
        if(self.Defocus != nil) {
            dict["Defocus"] = self.Defocus!
        }
        
        return dict
    }*/
    
}

