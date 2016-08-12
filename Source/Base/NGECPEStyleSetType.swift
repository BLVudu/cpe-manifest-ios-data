import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGECPEStyleSetType : NSObject{
    
    var CPEStyleSetID: String?
    
    var updateNum: Int?
    
    var specVersion: String?
    
    var ExperienceStyleMapList: [NGEExperienceMenuMapType]!
    
    var NodeStyleList: [NGENodeStyleType]!
    
    var ThemeList: [NGEThemeType]!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let CPEStyleSetIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "CPEStyleSetID").UTF8String)
        let CPEStyleSetIDAttrValue = xmlTextReaderGetAttribute(reader, CPEStyleSetIDAttrName)
        if(CPEStyleSetIDAttrValue != nil) {
            
            self.CPEStyleSetID = String.fromCString(UnsafePointer<CChar>(CPEStyleSetIDAttrValue))
            xmlFree(CPEStyleSetIDAttrValue)
        }
        let updateNumAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "updateNum").UTF8String)
        let updateNumAttrValue = xmlTextReaderGetAttribute(reader, updateNumAttrName)
        if(updateNumAttrValue != nil) {
            
            self.updateNum = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(updateNumAttrValue))!)!.integerValue
            xmlFree(updateNumAttrValue)
        }
        let specVersionAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "specVersion").UTF8String)
        let specVersionAttrValue = xmlTextReaderGetAttribute(reader, specVersionAttrName)
        if(specVersionAttrValue != nil) {
            
            self.specVersion = String.fromCString(UnsafePointer<CChar>(specVersionAttrValue))
            xmlFree(specVersionAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
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
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("ExperienceStyleMap" == _currentElementName) {
                    
                    ExperienceStyleMapListArray.append(NGEExperienceMenuMapType(reader: reader))
                    handledInChild = true
                    
                } else if("NodeStyle" == _currentElementName) {
                    
                    NodeStyleListArray.append(NGENodeStyleType(reader: reader))
                    handledInChild = true
                    
                } else if("Theme" == _currentElementName) {
                    
                    ThemeListArray.append(NGEThemeType(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGECPEStyleSetType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
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
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.CPEStyleSetID != nil) {
            
            dict["CPEStyleSetID"] = self.CPEStyleSetID!
            
        }
        
        if(self.updateNum != nil) {
            
            dict["updateNum"] = self.updateNum!
            
        }
        
        if(self.specVersion != nil) {
            
            dict["specVersion"] = self.specVersion!
            
        }
        
        if(self.ExperienceStyleMapList != nil) {
            dict["ExperienceStyleMapList"] = self.ExperienceStyleMapList!.map({$0.dictionary})
        }
        
        if(self.NodeStyleList != nil) {
            dict["NodeStyleList"] = self.NodeStyleList!.map({$0.dictionary})
        }
        
        if(self.ThemeList != nil) {
            dict["ThemeList"] = self.ThemeList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

