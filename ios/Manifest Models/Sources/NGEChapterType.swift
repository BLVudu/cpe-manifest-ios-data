
import Foundation

@objc
class NGEChapterType : NSObject{
    
    var index: String!
    
    var EntryTimecode: NGETimecodeType!
    
    var DisplayLabelList: [NGEDisplayLabel]?
    
    var ImageIDList: [NGEImageID]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let indexAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "index").UTF8String)
        let indexAttrValue = xmlTextReaderGetAttribute(reader, indexAttrName)
        if(indexAttrValue != nil) {
            
            self.index = String.fromCString(UnsafePointer<CChar>(indexAttrValue))
            xmlFree(indexAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
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
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("EntryTimecode" == _currentElementName) {
                    
                    self.EntryTimecode = NGETimecodeType(reader: reader)
                    handledInChild = true
                    
                } else if("DisplayLabel" == _currentElementName) {
                    
                    DisplayLabelListArray.append(NGEDisplayLabel(reader: reader))
                    handledInChild = true
                    
                } else if("ImageID" == _currentElementName) {
                    
                    ImageIDListArray.append(NGEImageID(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEChapterType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
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
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.index != nil) {
            
            dict["index"] = self.index!
            
        }
        
        if(self.EntryTimecode != nil) {
            dict["EntryTimecode"] = self.EntryTimecode!
        }
        
        if(self.DisplayLabelList != nil) {
            dict["DisplayLabelList"] = self.DisplayLabelList!.map({$0.dictionary})
        }
        
        if(self.ImageIDList != nil) {
            dict["ImageIDList"] = self.ImageIDList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

