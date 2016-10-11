import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGECPEStyleSetType : NSObject{
    
    var `CPEStyleSetID`: String?
    
    var `updateNum`: Int?
    
    var `specVersion`: String?
    
    var `ExperienceStyleMapList`: [NGEExperienceMenuMapType]!
    
    var `NodeStyleList`: [NGENodeStyleType]!
    
    var `ThemeList`: [NGEThemeType]!
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "CPEStyleSetID") {
            
            self.CPEStyleSetID = String(cString: attrValue)
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "updateNum") {
            
            self.updateNum = numFormatter.number(from: String(cString: attrValue))!.intValue
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "specVersion") {
            
            self.specVersion = String(cString: attrValue)
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        self.readAttributes(reader)
        
        var ExperienceStyleMapListArray = [NGEExperienceMenuMapType]()
        var NodeStyleListArray = [NGENodeStyleType]()
        var ThemeListArray = [NGEThemeType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("ExperienceStyleMap" == _currentElementName) {
                        
                        ExperienceStyleMapListArray.append(NGEExperienceMenuMapType(reader))
                        handledInChild = true
                        
                    } else if("NodeStyle" == _currentElementName) {
                        
                        NodeStyleListArray.append(NGENodeStyleType(reader))
                        handledInChild = true
                        
                    } else if("Theme" == _currentElementName) {
                        
                        ThemeListArray.append(NGEThemeType(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGECPEStyleSetType: \(_currentElementName)")
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
        
        if(ExperienceStyleMapListArray.count > 0) { self.ExperienceStyleMapList = ExperienceStyleMapListArray }
        if(NodeStyleListArray.count > 0) { self.NodeStyleList = NodeStyleListArray }
        if(ThemeListArray.count > 0) { self.ThemeList = ThemeListArray }
    }
    
}

