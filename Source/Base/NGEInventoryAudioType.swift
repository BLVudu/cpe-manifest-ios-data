import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEInventoryAudioType : NGEDigitalAssetAudioDataType {
    
    var AudioTrackID: String!
    
    var ContainerReference: NGEContainerReferenceType?
    
    override func readAttributes(reader: xmlTextReaderPtr) {
        super.readAttributes(reader)
        
        let AudioTrackIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "AudioTrackID").UTF8String)
        let AudioTrackIDAttrValue = xmlTextReaderGetAttribute(reader, AudioTrackIDAttrName)
        if(AudioTrackIDAttrValue != nil) {
            
            self.AudioTrackID = String.fromCString(UnsafePointer<CChar>(AudioTrackIDAttrValue))
            xmlFree(AudioTrackIDAttrValue)
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
                    print("Ignoring unexpected in NGEInventoryAudioType: \(_currentElementName)")
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
        
        if(self.AudioTrackID != nil) {
            
            dict["AudioTrackID"] = self.AudioTrackID!
            
        }
        
        if(self.ContainerReference != nil) {
            dict["ContainerReference"] = self.ContainerReference!
        }
        
        return dict
    }*/
    
}

