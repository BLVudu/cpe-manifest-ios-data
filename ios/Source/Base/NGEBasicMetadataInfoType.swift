
import Foundation

@objc
class NGEBasicMetadataInfoType : NSObject{
    
    var language: String!
    
    var isDefault: Bool?
    
    var TitleDisplay19: String?
    
    var TitleDisplay60: String?
    
    var TitleDisplayUnlimited: String?
    
    var TitleSort: String!
    
    var ArtReferenceList: [NGEArtReference]?
    
    var Summary190: NGESummary190!
    
    var Summary400: NGESummary400?
    
    var Summary4000: NGESummary4000?
    
    var DisplayIndicatorsList: [NGEStringDisplayIndicatorsEnum]?
    
    var GenreList: [NGEGenre]?
    
    var KeywordList: [String]?
    
    var VersionNotes: String?
    
    var RegionList: [NGERegionType]?
    
    var OriginalTitle: String?
    
    var CopyrightLine: String?
    
    var PeopleLocalList: [NGEBasicMetadataPeopleType]?
    
    var TitleAlternateList: [NGETitleAlternate]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let languageAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "language").UTF8String)
        let languageAttrValue = xmlTextReaderGetAttribute(reader, languageAttrName)
        if(languageAttrValue != nil) {
            
            self.language = String.fromCString(UnsafePointer<CChar>(languageAttrValue))
            xmlFree(languageAttrValue)
        }
        let defaultAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "default").UTF8String)
        let defaultAttrValue = xmlTextReaderGetAttribute(reader, defaultAttrName)
        if(defaultAttrValue != nil) {
            
            self.isDefault = (String.fromCString(UnsafePointer<CChar>(defaultAttrValue)) == "true")
            xmlFree(defaultAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
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
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("TitleDisplay19" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TitleDisplay19ElementValue = xmlTextReaderConstValue(reader)
                    if TitleDisplay19ElementValue != nil {
                        
                        self.TitleDisplay19 = String.fromCString(UnsafePointer<CChar>(TitleDisplay19ElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TitleDisplay60" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TitleDisplay60ElementValue = xmlTextReaderConstValue(reader)
                    if TitleDisplay60ElementValue != nil {
                        
                        self.TitleDisplay60 = String.fromCString(UnsafePointer<CChar>(TitleDisplay60ElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TitleDisplayUnlimited" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TitleDisplayUnlimitedElementValue = xmlTextReaderConstValue(reader)
                    if TitleDisplayUnlimitedElementValue != nil {
                        
                        self.TitleDisplayUnlimited = String.fromCString(UnsafePointer<CChar>(TitleDisplayUnlimitedElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TitleSort" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TitleSortElementValue = xmlTextReaderConstValue(reader)
                    if TitleSortElementValue != nil {
                        
                        self.TitleSort = String.fromCString(UnsafePointer<CChar>(TitleSortElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ArtReference" == _currentElementName) {
                    
                    ArtReferenceListArray.append(NGEArtReference(reader: reader))
                    handledInChild = true
                    
                } else if("Summary190" == _currentElementName) {
                    
                    self.Summary190 = NGESummary190(reader: reader)
                    handledInChild = true
                    
                } else if("Summary400" == _currentElementName) {
                    
                    self.Summary400 = NGESummary400(reader: reader)
                    handledInChild = true
                    
                } else if("Summary4000" == _currentElementName) {
                    
                    self.Summary4000 = NGESummary4000(reader: reader)
                    handledInChild = true
                    
                } else if("DisplayIndicators" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let DisplayIndicatorsElementValue = xmlTextReaderConstValue(reader)
                    if DisplayIndicatorsElementValue != nil {
                        
                        DisplayIndicatorsListArray.append(NGEStringDisplayIndicatorsEnum.fromString(String.fromCString(UnsafePointer<CChar>(DisplayIndicatorsElementValue))))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Genre" == _currentElementName) {
                    
                    GenreListArray.append(NGEGenre(reader: reader))
                    handledInChild = true
                    
                } else if("Keyword" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let KeywordElementValue = xmlTextReaderConstValue(reader)
                    if KeywordElementValue != nil {
                        
                        KeywordListArray.append(String.fromCString(UnsafePointer<CChar>(KeywordElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("VersionNotes" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let VersionNotesElementValue = xmlTextReaderConstValue(reader)
                    if VersionNotesElementValue != nil {
                        
                        self.VersionNotes = String.fromCString(UnsafePointer<CChar>(VersionNotesElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Region" == _currentElementName) {
                    
                    RegionListArray.append(NGERegionType(reader: reader))
                    handledInChild = true
                    
                } else if("OriginalTitle" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let OriginalTitleElementValue = xmlTextReaderConstValue(reader)
                    if OriginalTitleElementValue != nil {
                        
                        self.OriginalTitle = String.fromCString(UnsafePointer<CChar>(OriginalTitleElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("CopyrightLine" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let CopyrightLineElementValue = xmlTextReaderConstValue(reader)
                    if CopyrightLineElementValue != nil {
                        
                        self.CopyrightLine = String.fromCString(UnsafePointer<CChar>(CopyrightLineElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PeopleLocal" == _currentElementName) {
                    
                    PeopleLocalListArray.append(NGEBasicMetadataPeopleType(reader: reader))
                    handledInChild = true
                    
                } else if("TitleAlternate" == _currentElementName) {
                    
                    TitleAlternateListArray.append(NGETitleAlternate(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEBasicMetadataInfoType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
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
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.language != nil) {
            
            dict["language"] = self.language!
            
        }
        
        if(self.isDefault != nil) {
            
            dict["isDefault"] = self.isDefault!
            
        }
        
        if(self.TitleDisplay19 != nil) {
            
            dict["TitleDisplay19"] = self.TitleDisplay19!
            
        }
        
        if(self.TitleDisplay60 != nil) {
            
            dict["TitleDisplay60"] = self.TitleDisplay60!
            
        }
        
        if(self.TitleDisplayUnlimited != nil) {
            
            dict["TitleDisplayUnlimited"] = self.TitleDisplayUnlimited!
            
        }
        
        if(self.TitleSort != nil) {
            
            dict["TitleSort"] = self.TitleSort!
            
        }
        
        if(self.ArtReferenceList != nil) {
            dict["ArtReferenceList"] = self.ArtReferenceList!.map({$0.dictionary})
        }
        
        if(self.Summary190 != nil) {
            dict["Summary190"] = self.Summary190!
        }
        
        if(self.Summary400 != nil) {
            dict["Summary400"] = self.Summary400!
        }
        
        if(self.Summary4000 != nil) {
            dict["Summary4000"] = self.Summary4000!
        }
        
        if(self.DisplayIndicatorsList != nil) {
            
            dict["DisplayIndicatorsList"] = self.DisplayIndicatorsList!
            
        }
        
        if(self.GenreList != nil) {
            dict["GenreList"] = self.GenreList!.map({$0.dictionary})
        }
        
        if(self.KeywordList != nil) {
            
            dict["KeywordList"] = self.KeywordList!
            
        }
        
        if(self.VersionNotes != nil) {
            
            dict["VersionNotes"] = self.VersionNotes!
            
        }
        
        if(self.RegionList != nil) {
            dict["RegionList"] = self.RegionList!.map({$0.dictionary})
        }
        
        if(self.OriginalTitle != nil) {
            
            dict["OriginalTitle"] = self.OriginalTitle!
            
        }
        
        if(self.CopyrightLine != nil) {
            
            dict["CopyrightLine"] = self.CopyrightLine!
            
        }
        
        if(self.PeopleLocalList != nil) {
            dict["PeopleLocalList"] = self.PeopleLocalList!.map({$0.dictionary})
        }
        
        if(self.TitleAlternateList != nil) {
            dict["TitleAlternateList"] = self.TitleAlternateList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

