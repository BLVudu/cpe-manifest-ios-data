
import Foundation

@objc
class NGEInventorySubtitleType : NGEDigitalAssetSubtitleDataType {
    
    var SubtitleTrackID: String!
    
    var ContainerReference: NGEContainerReferenceType?
    
    override func readAttributes(reader: xmlTextReaderPtr) {
        super.readAttributes(reader)
        
        let SubtitleTrackIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "SubtitleTrackID").UTF8String)
        let SubtitleTrackIDAttrValue = xmlTextReaderGetAttribute(reader, SubtitleTrackIDAttrName)
        if(SubtitleTrackIDAttrValue != nil) {
            
            self.SubtitleTrackID = String.fromCString(UnsafePointer<CChar>(SubtitleTrackIDAttrValue))
            xmlFree(SubtitleTrackIDAttrValue)
        }
    }
    
    override init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init(reader: reader)
        
        var _readerOk:Int32=1
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("ContainerReference" == _currentElementName) {
                    
                    self.ContainerReference = NGEContainerReferenceType(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEInventorySubtitleType: \(_currentElementName)")
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
    
    /*override var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        for (name, value) in super.dictionary {
            dict[name] = value
        }
        
        if(self.SubtitleTrackID != nil) {
            
            dict["SubtitleTrackID"] = self.SubtitleTrackID!
            
        }
        
        if(self.ContainerReference != nil) {
            dict["ContainerReference"] = self.ContainerReference!
        }
        
        return dict
    }*/
    
}

