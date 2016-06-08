import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEInventoryImageType : NGEDigitalAssetImageDataType {
    
    var ImageID: String?
    
    var ContainerReference: NGEContainerReferenceType?
    
    var VideoFrameTimecode: NGEVideoFrameTimecode?
    
    override func readAttributes(reader: xmlTextReaderPtr) {
        super.readAttributes(reader)
        
        let ImageIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "ImageID").UTF8String)
        let ImageIDAttrValue = xmlTextReaderGetAttribute(reader, ImageIDAttrName)
        if(ImageIDAttrValue != nil) {
            
            self.ImageID = String.fromCString(UnsafePointer<CChar>(ImageIDAttrValue))
            xmlFree(ImageIDAttrValue)
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
                    
                } else if("VideoFrameTimecode" == _currentElementName) {
                    
                    self.VideoFrameTimecode = NGEVideoFrameTimecode(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEInventoryImageType: \(_currentElementName)")
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
        
        if(self.ImageID != nil) {
            
            dict["ImageID"] = self.ImageID!
            
        }
        
        if(self.ContainerReference != nil) {
            dict["ContainerReference"] = self.ContainerReference!
        }
        
        if(self.VideoFrameTimecode != nil) {
            dict["VideoFrameTimecode"] = self.VideoFrameTimecode!
        }
        
        return dict
    }*/
    
}

