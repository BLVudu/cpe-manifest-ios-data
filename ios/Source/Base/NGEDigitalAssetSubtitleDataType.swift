import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDigitalAssetSubtitleDataType : NSObject{
    
    var Format: NGEDigitalAssetSubtitleFormatType?
    
    var Description: String?
    
    var TypeList: [String]!
    
    var FormatType: String?
    
    var Language: String!
    
    var Encoding: String?
    
    var CardsetList: [NGEDigitalAssetCardsetListType]?
    
    var TrackReference: String?
    
    var TrackIdentifierList: [NGEContentIdentifierType]?
    
    var Private: NGEPrivateDataType?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var TypeListArray = [String]()
        
        var CardsetListArray = [NGEDigitalAssetCardsetListType]()
        
        var TrackIdentifierListArray = [NGEContentIdentifierType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Format" == _currentElementName) {
                    
                    self.Format = NGEDigitalAssetSubtitleFormatType(reader: reader)
                    handledInChild = true
                    
                } else if("Description" == _currentElementName) {
                    
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
                        
                        TypeListArray.append(String.fromCString(UnsafePointer<CChar>(TypeElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("FormatType" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let FormatTypeElementValue = xmlTextReaderConstValue(reader)
                    if FormatTypeElementValue != nil {
                        
                        self.FormatType = String.fromCString(UnsafePointer<CChar>(FormatTypeElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Language" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let LanguageElementValue = xmlTextReaderConstValue(reader)
                    if LanguageElementValue != nil {
                        
                        self.Language = String.fromCString(UnsafePointer<CChar>(LanguageElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Encoding" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let EncodingElementValue = xmlTextReaderConstValue(reader)
                    if EncodingElementValue != nil {
                        
                        self.Encoding = String.fromCString(UnsafePointer<CChar>(EncodingElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("CardsetList" == _currentElementName) {
                    
                    CardsetListArray.append(NGEDigitalAssetCardsetListType(reader: reader))
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
                    print("Ignoring unexpected in NGEDigitalAssetSubtitleDataType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(TypeListArray.count > 0) { self.TypeList = TypeListArray }
        
        if(CardsetListArray.count > 0) { self.CardsetList = CardsetListArray }
        
        if(TrackIdentifierListArray.count > 0) { self.TrackIdentifierList = TrackIdentifierListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Format != nil) {
            dict["Format"] = self.Format!
        }
        
        if(self.Description != nil) {
            
            dict["Description"] = self.Description!
            
        }
        
        if(self.TypeList != nil) {
            
            dict["TypeList"] = self.TypeList!
            
        }
        
        if(self.FormatType != nil) {
            
            dict["FormatType"] = self.FormatType!
            
        }
        
        if(self.Language != nil) {
            
            dict["Language"] = self.Language!
            
        }
        
        if(self.Encoding != nil) {
            
            dict["Encoding"] = self.Encoding!
            
        }
        
        if(self.CardsetList != nil) {
            dict["CardsetList"] = self.CardsetList!.map({$0.dictionary})
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

