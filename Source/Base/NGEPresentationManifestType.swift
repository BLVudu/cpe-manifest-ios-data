import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEPresentationManifestType : NSObject{
    
    var `updateNum`: Int?
    
    var `Inventory`: NGEInventoryType!
    
    var `Presentation`: NGEPresentationType!
    
    var `PictureGroups`: NGEPictureGroupListType?
    
    var `TextGroups`: NGETextGroupListType?
    
    var `TimedEventSequences`: NGETimedEventSequenceListType?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "updateNum") {
            
            self.updateNum = numFormatter.number(from: String(cString: attrValue))!.intValue
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("Inventory" == _currentElementName) {
                        
                        self.Inventory = NGEInventoryType(reader)
                        handledInChild = true
                        
                    } else if("Presentation" == _currentElementName) {
                        
                        self.Presentation = NGEPresentationType(reader)
                        handledInChild = true
                        
                    } else if("PictureGroups" == _currentElementName) {
                        
                        self.PictureGroups = NGEPictureGroupListType(reader)
                        handledInChild = true
                        
                    } else if("TextGroups" == _currentElementName) {
                        
                        self.TextGroups = NGETextGroupListType(reader)
                        handledInChild = true
                        
                    } else if("TimedEventSequences" == _currentElementName) {
                        
                        self.TimedEventSequences = NGETimedEventSequenceListType(reader)
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEPresentationManifestType: \(_currentElementName)")
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
        
    }
    
}

