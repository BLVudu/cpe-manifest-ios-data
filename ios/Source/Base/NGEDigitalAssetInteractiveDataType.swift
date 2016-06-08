import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDigitalAssetInteractiveDataType : NSObject{
    
    var EncodingList: [NGEDigitalAssetInteractiveEncodingType]!
    
    var TrackReference: String?
    
    var TrackIdentifierList: [NGEContentIdentifierType]?
    
    var Private: NGEPrivateDataType?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var EncodingListArray = [NGEDigitalAssetInteractiveEncodingType]()
        
        var TrackIdentifierListArray = [NGEContentIdentifierType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Encoding" == _currentElementName) {
                    
                    EncodingListArray.append(NGEDigitalAssetInteractiveEncodingType(reader: reader))
                    handledInChild = true
                    
                } else if("TrackReference" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TrackReferenceElementValue = xmlTextReaderConstValue(reader)
                    if TrackReferenceElementValue != nil {
                        
                        self.TrackReference = String.fromCString(UnsafePointer<CChar>(TrackReferenceElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TrackIdentifier" == _currentElementName) {
                    
                    TrackIdentifierListArray.append(NGEContentIdentifierType(reader: reader))
                    handledInChild = true
                    
                } else if("Private" == _currentElementName) {
                    
                    self.Private = NGEPrivateDataType(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEDigitalAssetInteractiveDataType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(EncodingListArray.count > 0) { self.EncodingList = EncodingListArray }
        
        if(TrackIdentifierListArray.count > 0) { self.TrackIdentifierList = TrackIdentifierListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.EncodingList != nil) {
            dict["EncodingList"] = self.EncodingList!.map({$0.dictionary})
        }
        
        if(self.TrackReference != nil) {
            
            dict["TrackReference"] = self.TrackReference!
            
        }
        
        if(self.TrackIdentifierList != nil) {
            dict["TrackIdentifierList"] = self.TrackIdentifierList!.map({$0.dictionary})
        }
        
        if(self.Private != nil) {
            dict["Private"] = self.Private!
        }
        
        return dict
    }*/
    
}

