import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEBasicMetadataInfoType : NSObject{
    
    var `language`: String!
    
    var `isDefault`: Bool?
    
    var `TitleDisplay19`: String?
    
    var `TitleDisplay60`: String?
    
    var `TitleDisplayUnlimited`: String?
    
    var `TitleSort`: String!
    
    var `ArtReferenceList`: [NGEArtReference]?
    
    var `Summary190`: NGESummary190!
    
    var `Summary400`: NGESummary400?
    
    var `Summary4000`: NGESummary4000?
    
    var `DisplayIndicatorsList`: [NGEStringDisplayIndicatorsEnum]?
    
    var `GenreList`: [NGEGenre]?
    
    var `KeywordList`: [String]?
    
    var `VersionNotes`: String?
    
    var `RegionList`: [NGERegionType]?
    
    var `OriginalTitle`: String?
    
    var `CopyrightLine`: String?
    
    var `PeopleLocalList`: [NGEBasicMetadataPeopleType]?
    
    var `TitleAlternateList`: [NGETitleAlternate]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "language") {
            
            self.language = String(cString: attrValue)
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "default") {
            
            self.isDefault = (String(cString: attrValue) == "true")
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var ArtReferenceListArray = [NGEArtReference]()
        
        var DisplayIndicatorsListArray = [NGEStringDisplayIndicatorsEnum]()
        var GenreListArray = [NGEGenre]()
        var KeywordListArray = [String]()
        
        var RegionListArray = [NGERegionType]()
        
        var PeopleLocalListArray = [NGEBasicMetadataPeopleType]()
        var TitleAlternateListArray = [NGETitleAlternate]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("TitleDisplay19" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.TitleDisplay19 = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("TitleDisplay60" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.TitleDisplay60 = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("TitleDisplayUnlimited" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.TitleDisplayUnlimited = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("TitleSort" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.TitleSort = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ArtReference" == _currentElementName) {
                        
                        ArtReferenceListArray.append(NGEArtReference(reader))
                        handledInChild = true
                        
                    } else if("Summary190" == _currentElementName) {
                        
                        self.Summary190 = NGESummary190(reader)
                        handledInChild = true
                        
                    } else if("Summary400" == _currentElementName) {
                        
                        self.Summary400 = NGESummary400(reader)
                        handledInChild = true
                        
                    } else if("Summary4000" == _currentElementName) {
                        
                        self.Summary4000 = NGESummary4000(reader)
                        handledInChild = true
                        
                    } else if("DisplayIndicators" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            DisplayIndicatorsListArray.append(NGEStringDisplayIndicatorsEnum.fromString(enumString: String(cString: elementValue)))
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Genre" == _currentElementName) {
                        
                        GenreListArray.append(NGEGenre(reader))
                        handledInChild = true
                        
                    } else if("Keyword" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            KeywordListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("VersionNotes" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.VersionNotes = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Region" == _currentElementName) {
                        
                        RegionListArray.append(NGERegionType(reader))
                        handledInChild = true
                        
                    } else if("OriginalTitle" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.OriginalTitle = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("CopyrightLine" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.CopyrightLine = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("PeopleLocal" == _currentElementName) {
                        
                        PeopleLocalListArray.append(NGEBasicMetadataPeopleType(reader))
                        handledInChild = true
                        
                    } else if("TitleAlternate" == _currentElementName) {
                        
                        TitleAlternateListArray.append(NGETitleAlternate(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEBasicMetadataInfoType: \(_currentElementName)")
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
        
        if(ArtReferenceListArray.count > 0) { self.ArtReferenceList = ArtReferenceListArray }
        
        if(DisplayIndicatorsListArray.count > 0) { self.DisplayIndicatorsList = DisplayIndicatorsListArray }
        if(GenreListArray.count > 0) { self.GenreList = GenreListArray }
        if(KeywordListArray.count > 0) { self.KeywordList = KeywordListArray }
        
        if(RegionListArray.count > 0) { self.RegionList = RegionListArray }
        
        if(PeopleLocalListArray.count > 0) { self.PeopleLocalList = PeopleLocalListArray }
        if(TitleAlternateListArray.count > 0) { self.TitleAlternateList = TitleAlternateListArray }
    }
    
}

