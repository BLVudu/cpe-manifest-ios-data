
import Foundation

@objc
class NGEDigitalAssetVideoDataType : NSObject{
    
    var Description: String?
    
    var Type: String?
    
    var Encoding: NGEDigitalAssetVideoEncodingType?
    
    var Picture: NGEDigitalAssetVideoPictureType!
    
    var ColorType: NGEColorTypeTypeEnum?
    
    var PictureFormat: String?
    
    var SubtitleLanguageList: [NGEDigitalAssetVideoSubtitleLanguageType]?
    
    var SignedLanguage: String?
    
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
        
        var SubtitleLanguageListArray = [NGEDigitalAssetVideoSubtitleLanguageType]()
        
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
                    
                    self.Encoding = NGEDigitalAssetVideoEncodingType(reader: reader)
                    handledInChild = true
                    
                } else if("Picture" == _currentElementName) {
                    
                    self.Picture = NGEDigitalAssetVideoPictureType(reader: reader)
                    handledInChild = true
                    
                } else if("ColorType" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ColorTypeElementValue = xmlTextReaderConstValue(reader)
                    if ColorTypeElementValue != nil {
                        
                        self.ColorType = NGEColorTypeTypeEnum.fromString(String.fromCString(UnsafePointer<CChar>(ColorTypeElementValue)))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PictureFormat" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PictureFormatElementValue = xmlTextReaderConstValue(reader)
                    if PictureFormatElementValue != nil {
                        
                        self.PictureFormat = String.fromCString(UnsafePointer<CChar>(PictureFormatElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SubtitleLanguage" == _currentElementName) {
                    
                    SubtitleLanguageListArray.append(NGEDigitalAssetVideoSubtitleLanguageType(reader: reader))
                    handledInChild = true
                    
                } else if("SignedLanguage" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SignedLanguageElementValue = xmlTextReaderConstValue(reader)
                    if SignedLanguageElementValue != nil {
                        
                        self.SignedLanguage = String.fromCString(UnsafePointer<CChar>(SignedLanguageElementValue))
                        
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
                    print("Ignoring unexpected in NGEDigitalAssetVideoDataType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(SubtitleLanguageListArray.count > 0) { self.SubtitleLanguageList = SubtitleLanguageListArray }
        
        if(CardsetListArray.count > 0) { self.CardsetList = CardsetListArray }
        
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
        
        if(self.Picture != nil) {
            dict["Picture"] = self.Picture!
        }
        
        if(self.ColorType != nil) {
            
            let obj = NGEColorTypeTypeEnum.toString(ColorType!)
            dict["value"] = obj
            
        }
        
        if(self.PictureFormat != nil) {
            
            dict["PictureFormat"] = self.PictureFormat!
            
        }
        
        if(self.SubtitleLanguageList != nil) {
            dict["SubtitleLanguageList"] = self.SubtitleLanguageList!.map({$0.dictionary})
        }
        
        if(self.SignedLanguage != nil) {
            
            dict["SignedLanguage"] = self.SignedLanguage!
            
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

