
import Foundation

@objc
class NGEInventoryInteractiveType : NGEDigitalAssetInteractiveDataType {
    
    var InteractiveTrackID: String?
    
    var ContainerReference: NGEContainerReferenceType?
    
    var ManifestAppList: [NGEInventoryMediaManifestType]?
    
    var PictureID: String?
    
    override func readAttributes(reader: xmlTextReaderPtr) {
        super.readAttributes(reader)
        
        let InteractiveTrackIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "InteractiveTrackID").UTF8String)
        let InteractiveTrackIDAttrValue = xmlTextReaderGetAttribute(reader, InteractiveTrackIDAttrName)
        if(InteractiveTrackIDAttrValue != nil) {
            
            self.InteractiveTrackID = String.fromCString(UnsafePointer<CChar>(InteractiveTrackIDAttrValue))
            xmlFree(InteractiveTrackIDAttrValue)
        }
    }
    
    override init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init(reader: reader)
        
        var ManifestAppListArray = [NGEInventoryMediaManifestType]()
        
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
                    
                } else if("ManifestApp" == _currentElementName) {
                    
                    ManifestAppListArray.append(NGEInventoryMediaManifestType(reader: reader))
                    handledInChild = true
                    
                } else if("PictureID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PictureIDElementValue = xmlTextReaderConstValue(reader)
                    if PictureIDElementValue != nil {
                        
                        self.PictureID = String.fromCString(UnsafePointer<CChar>(PictureIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEInventoryInteractiveType: \(_currentElementName)")
                    /*if superclass != NSObject.self {
                        break
                    }*/
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(ManifestAppListArray.count > 0) { self.ManifestAppList = ManifestAppListArray }
        
    }
    
    /*override var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        for (name, value) in super.dictionary {
            dict[name] = value
        }
        
        if(self.InteractiveTrackID != nil) {
            
            dict["InteractiveTrackID"] = self.InteractiveTrackID!
            
        }
        
        if(self.ContainerReference != nil) {
            dict["ContainerReference"] = self.ContainerReference!
        }
        
        if(self.ManifestAppList != nil) {
            dict["ManifestAppList"] = self.ManifestAppList!.map({$0.dictionary})
        }
        
        if(self.PictureID != nil) {
            
            dict["PictureID"] = self.PictureID!
            
        }
        
        return dict
    }*/
    
}

