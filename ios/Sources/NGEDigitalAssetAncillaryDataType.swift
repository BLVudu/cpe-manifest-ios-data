
import Foundation

@objc
class NGEDigitalAssetAncillaryDataType : NSObject{
    
    var Type: String?
    
    var SubType: String?
    
    var BaseTrackID: NSURL?
    
    var BaseTrackReference: String?
    
    var BaseTrackIdentifierList: [NGEContentIdentifierType]?
    
    var TrackMetadata: NGEDigitalAssetMetadataType?
    
    var CombinedMetadata: NGEDigitalAssetMetadataType?
    
    var Private: NGEPrivateDataType?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var BaseTrackIdentifierListArray = [NGEContentIdentifierType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Type" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TypeElementValue = xmlTextReaderConstValue(reader)
                    if TypeElementValue != nil {
                        
                        self.Type = String.fromCString(UnsafePointer<CChar>(TypeElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SubType" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SubTypeElementValue = xmlTextReaderConstValue(reader)
                    if SubTypeElementValue != nil {
                        
                        self.SubType = String.fromCString(UnsafePointer<CChar>(SubTypeElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("BaseTrackID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let BaseTrackIDElementValue = xmlTextReaderConstValue(reader)
                    if BaseTrackIDElementValue != nil {
                        
                        self.BaseTrackID = NSURL(string: String.fromCString(UnsafePointer<CChar>(BaseTrackIDElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("BaseTrackReference" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let BaseTrackReferenceElementValue = xmlTextReaderConstValue(reader)
                    if BaseTrackReferenceElementValue != nil {
                        
                        self.BaseTrackReference = String.fromCString(UnsafePointer<CChar>(BaseTrackReferenceElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("BaseTrackIdentifier" == _currentElementName) {
                    
                    BaseTrackIdentifierListArray.append(NGEContentIdentifierType(reader: reader))
                    handledInChild = true
                    
                } else if("TrackMetadata" == _currentElementName) {
                    
                    self.TrackMetadata = NGEDigitalAssetMetadataType(reader: reader)
                    handledInChild = true
                    
                } else if("CombinedMetadata" == _currentElementName) {
                    
                    self.CombinedMetadata = NGEDigitalAssetMetadataType(reader: reader)
                    handledInChild = true
                    
                } else if("Private" == _currentElementName) {
                    
                    self.Private = NGEPrivateDataType(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected: \(_currentElementName)")
                    //break
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(BaseTrackIdentifierListArray.count > 0) { self.BaseTrackIdentifierList = BaseTrackIdentifierListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Type != nil) {
            
            dict["Type"] = self.Type!
            
        }
        
        if(self.SubType != nil) {
            
            dict["SubType"] = self.SubType!
            
        }
        
        if(self.BaseTrackID != nil) {
            
            dict["BaseTrackID"] = self.BaseTrackID!
            
        }
        
        if(self.BaseTrackReference != nil) {
            
            dict["BaseTrackReference"] = self.BaseTrackReference!
            
        }
        
        if(self.BaseTrackIdentifierList != nil) {
            dict["BaseTrackIdentifierList"] = self.BaseTrackIdentifierList!.map({$0.dictionary})
        }
        
        if(self.TrackMetadata != nil) {
            dict["TrackMetadata"] = self.TrackMetadata!
        }
        
        if(self.CombinedMetadata != nil) {
            dict["CombinedMetadata"] = self.CombinedMetadata!
        }
        
        if(self.Private != nil) {
            dict["Private"] = self.Private!
        }
        
        return dict
    }*/
    
}

