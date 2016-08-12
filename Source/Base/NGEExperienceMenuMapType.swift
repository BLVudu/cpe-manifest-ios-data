import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEExperienceMenuMapType : NSObject{
    
    var ExperienceIDList: [String]!
    
    var NodeStyleRefList: [NGENodeStyleRef]!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var ExperienceIDListArray = [String]()
        var NodeStyleRefListArray = [NGENodeStyleRef]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("ExperienceID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ExperienceIDElementValue = xmlTextReaderConstValue(reader)
                    if ExperienceIDElementValue != nil {
                        
                        ExperienceIDListArray.append(String.fromCString(UnsafePointer<CChar>(ExperienceIDElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("NodeStyleRef" == _currentElementName) {
                    
                    NodeStyleRefListArray.append(NGENodeStyleRef(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEExperienceMenuMapType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(ExperienceIDListArray.count > 0) { self.ExperienceIDList = ExperienceIDListArray }
        if(NodeStyleRefListArray.count > 0) { self.NodeStyleRefList = NodeStyleRefListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.ExperienceIDList != nil) {
            
            dict["ExperienceIDList"] = self.ExperienceIDList!
            
        }
        
        if(self.NodeStyleRefList != nil) {
            dict["NodeStyleRefList"] = self.NodeStyleRefList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

