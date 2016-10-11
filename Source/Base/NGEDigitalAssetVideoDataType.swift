import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDigitalAssetVideoDataType : NSObject{
    
    var `Description`: String?
    
    var `Type`: String?
    
    var `Encoding`: NGEDigitalAssetVideoEncodingType?
    
    var `Picture`: NGEDigitalAssetVideoPictureType?
    
    var `ColorType`: NGEColorTypeTypeEnum?
    
    var `PictureFormat`: String?
    
    var `LanguageList`: [String]?
    
    var `SubtitleLanguageList`: [NGEDigitalAssetVideoSubtitleLanguageType]?
    
    var `SignedLanguage`: String?
    
    var `CardsetList`: [NGEDigitalAssetCardsetListType]?
    
    var `TrackReference`: String?
    
    var `TrackIdentifierList`: [NGEContentIdentifierType]?
    
    var `Private`: NGEPrivateDataType?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var LanguageListArray = [String]()
        var SubtitleLanguageListArray = [NGEDigitalAssetVideoSubtitleLanguageType]()
        
        var CardsetListArray = [NGEDigitalAssetCardsetListType]()
        
        var TrackIdentifierListArray = [NGEContentIdentifierType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("Description" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Description = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Type" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Type = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Encoding" == _currentElementName) {
                        
                        self.Encoding = NGEDigitalAssetVideoEncodingType(reader)
                        handledInChild = true
                        
                    } else if("Picture" == _currentElementName) {
                        
                        self.Picture = NGEDigitalAssetVideoPictureType(reader)
                        handledInChild = true
                        
                    } else if("ColorType" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.ColorType = NGEColorTypeTypeEnum.fromString(enumString: String(cString: elementValue))
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("PictureFormat" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.PictureFormat = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Language" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            LanguageListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("SubtitleLanguage" == _currentElementName) {
                        
                        SubtitleLanguageListArray.append(NGEDigitalAssetVideoSubtitleLanguageType(reader))
                        handledInChild = true
                        
                    } else if("SignedLanguage" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.SignedLanguage = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("CardsetList" == _currentElementName) {
                        
                        CardsetListArray.append(NGEDigitalAssetCardsetListType(reader))
                        handledInChild = true
                        
                    } else if("TrackReference" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.TrackReference = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("TrackIdentifier" == _currentElementName) {
                        
                        TrackIdentifierListArray.append(NGEContentIdentifierType(reader))
                        handledInChild = true
                        
                    } else if("Private" == _currentElementName) {
                        
                        self.Private = NGEPrivateDataType(reader)
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEDigitalAssetVideoDataType: \(_currentElementName)")
                        if superclass != NSObject.self {
                            break
                        }
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(LanguageListArray.count > 0) { self.LanguageList = LanguageListArray }
        if(SubtitleLanguageListArray.count > 0) { self.SubtitleLanguageList = SubtitleLanguageListArray }
        
        if(CardsetListArray.count > 0) { self.CardsetList = CardsetListArray }
        
        if(TrackIdentifierListArray.count > 0) { self.TrackIdentifierList = TrackIdentifierListArray }
        
    }
    
}

