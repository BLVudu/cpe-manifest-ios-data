import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDigitalAssetAudioDataType : NSObject{
    
    var Description: String?
    
    var Type: String?
    
    var Encoding: NGEDigitalAssetAudioEncodingType?
    
    var Language: NGEDigitalAssetAudioLanguageType!
    
    var Channels: String?
    
    var TrackReference: String?
    
    var TrackIdentifierList: [NGEContentIdentifierType]?
    
    var Private: NGEPrivateDataType?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var TrackIdentifierListArray = [NGEContentIdentifierType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Description" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let DescriptionElementValue = xmlTextReaderConstValue(reader)
                    if DescriptionElementValue != nil {
                        
                        self.Description = String.fromCString(UnsafePointer<CChar>(DescriptionElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Type" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TypeElementValue = xmlTextReaderConstValue(reader)
                    if TypeElementValue != nil {
                        
                        self.Type = String.fromCString(UnsafePointer<CChar>(TypeElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Encoding" == _currentElementName) {
                    
                    self.Encoding = NGEDigitalAssetAudioEncodingType(reader: reader)
                    handledInChild = true
                    
                } else if("Language" == _currentElementName) {
                    
                    self.Language = NGEDigitalAssetAudioLanguageType(reader: reader)
                    handledInChild = true
                    
                } else if("Channels" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ChannelsElementValue = xmlTextReaderConstValue(reader)
                    if ChannelsElementValue != nil {
                        
                        self.Channels = String.fromCString(UnsafePointer<CChar>(ChannelsElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
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
                    print("Ignoring unexpected in NGEDigitalAssetAudioDataType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(TrackIdentifierListArray.count > 0) { self.TrackIdentifierList = TrackIdentifierListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Description != nil) {
            
            dict["Description"] = self.Description!
            
        }
        
        if(self.Type != nil) {
            
            dict["Type"] = self.Type!
            
        }
        
        if(self.Encoding != nil) {
            dict["Encoding"] = self.Encoding!
        }
        
        if(self.Language != nil) {
            dict["Language"] = self.Language!
        }
        
        if(self.Channels != nil) {
            
            dict["Channels"] = self.Channels!
            
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

