import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEChapterType : NSObject{
    
    var `index`: String!
    
    var `EntryTimecode`: NGETimecodeType!
    
    var `DisplayLabelList`: [NGEDisplayLabel]?
    
    var `ImageIDList`: [NGEImageID]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "index") {
            
            self.index = String(cString: attrValue)
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var DisplayLabelListArray = [NGEDisplayLabel]()
        var ImageIDListArray = [NGEImageID]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("EntryTimecode" == _currentElementName) {
                        
                        self.EntryTimecode = NGETimecodeType(reader)
                        handledInChild = true
                        
                    } else if("DisplayLabel" == _currentElementName) {
                        
                        DisplayLabelListArray.append(NGEDisplayLabel(reader))
                        handledInChild = true
                        
                    } else if("ImageID" == _currentElementName) {
                        
                        ImageIDListArray.append(NGEImageID(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEChapterType: \(_currentElementName)")
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
        
        if(DisplayLabelListArray.count > 0) { self.DisplayLabelList = DisplayLabelListArray }
        if(ImageIDListArray.count > 0) { self.ImageIDList = ImageIDListArray }
    }
    
}

