import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEInventoryInteractiveType : NGEDigitalAssetInteractiveDataType {
    
    var `InteractiveTrackID`: String?
    
    var `ContainerReference`: NGEContainerReferenceType?
    
    var `ManifestAppList`: [NGEInventoryMediaManifestType]?
    
    var `PictureID`: String?
    
    override func readAttributes(_ reader: xmlTextReaderPtr) {
        super.readAttributes(reader)
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "InteractiveTrackID") {
            
            self.InteractiveTrackID = String(cString: attrValue)
            xmlFree(attrValue)
        }
    }
    
    override init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init(reader)
        
        var ManifestAppListArray = [NGEInventoryMediaManifestType]()
        
        var _readerOk:Int32=1
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("ContainerReference" == _currentElementName) {
                        
                        self.ContainerReference = NGEContainerReferenceType(reader)
                        handledInChild = true
                        
                    } else if("ManifestApp" == _currentElementName) {
                        
                        ManifestAppListArray.append(NGEInventoryMediaManifestType(reader))
                        handledInChild = true
                        
                    } else if("PictureID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.PictureID = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else   if(true) {
                        /*print("Ignoring unexpected in NGEInventoryInteractiveType: \(_currentElementName)")
                        if superclass != NSObject.self {
                            break
                        }*/
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(ManifestAppListArray.count > 0) { self.ManifestAppList = ManifestAppListArray }
        
    }
    
}

