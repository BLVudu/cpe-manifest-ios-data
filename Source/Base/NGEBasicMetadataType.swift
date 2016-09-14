import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEBasicMetadataType : NSObject{
    
    var `ContentID`: String!
    
    var `UpdateNum`: Int?
    
    var `LocalizedInfoList`: [NGEBasicMetadataInfoType]!
    
    var `RunLength`: String?
    
    var `ReleaseYear`: Int!
    
    var `ReleaseDate`: Date?
    
    var `ReleaseHistoryList`: [NGEReleaseHistoryType]?
    
    var `WorkType`: String!
    
    var `WorkTypeDetail`: String?
    
    var `PictureColorType`: NGEColorTypeTypeEnum?
    
    var `PictureFormat`: String?
    
    var `ThreeD`: Bool?
    
    var `AspectRatio`: String?
    
    var `AltIdentifierList`: [NGEContentIdentifierType]?
    
    var `RatingSet`: NGEContentRatingType?
    
    var `PeopleList`: [NGEBasicMetadataPeopleType]?
    
    var `CountryOfOrigin`: NGERegionType?
    
    var `PrimarySpokenLanguageList`: [String]?
    
    var `OriginalLanguageList`: [String]?
    
    var `VersionLanguageList`: [String]?
    
    var `AssociatedOrgList`: [NGEAssociatedOrgType]?
    
    var `SequenceInfo`: NGEContentSequenceInfoType?
    
    var `ParentList`: [NGEBasicMetadataParentType]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        let dateOnlyFormatter = DateFormatter()
        dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
        dateOnlyFormatter.timeZone = TimeZone(abbreviation:"UTC")
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "ContentID") {
            
            self.ContentID = String(cString: attrValue)
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        let dateOnlyFormatter = DateFormatter()
        dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
        dateOnlyFormatter.timeZone = TimeZone(abbreviation:"UTC")
        
        self.readAttributes(reader)
        
        var LocalizedInfoListArray = [NGEBasicMetadataInfoType]()
        
        var ReleaseHistoryListArray = [NGEReleaseHistoryType]()
        
        var AltIdentifierListArray = [NGEContentIdentifierType]()
        
        var PeopleListArray = [NGEBasicMetadataPeopleType]()
        
        var PrimarySpokenLanguageListArray = [String]()
        var OriginalLanguageListArray = [String]()
        var VersionLanguageListArray = [String]()
        var AssociatedOrgListArray = [NGEAssociatedOrgType]()
        
        var ParentListArray = [NGEBasicMetadataParentType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("UpdateNum" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.UpdateNum = numFormatter.number(from: String(cString: elementValue))!.intValue
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("LocalizedInfo" == _currentElementName) {
                        
                        LocalizedInfoListArray.append(NGEBasicMetadataInfoType(reader))
                        handledInChild = true
                        
                    } else if("RunLength" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.RunLength = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ReleaseYear" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.ReleaseYear = numFormatter.number(from: String(cString: elementValue))!.intValue
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ReleaseDate" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.ReleaseDate = dateOnlyFormatter.date(from: String(cString: elementValue))
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ReleaseHistory" == _currentElementName) {
                        
                        ReleaseHistoryListArray.append(NGEReleaseHistoryType(reader))
                        handledInChild = true
                        
                    } else if("WorkType" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.WorkType = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("WorkTypeDetail" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.WorkTypeDetail = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("PictureColorType" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.PictureColorType = NGEColorTypeTypeEnum.fromString(enumString: String(cString: elementValue))
                            
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
                        
                    } else if("ThreeD" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.ThreeD = String(cString: elementValue) == "true"
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("AspectRatio" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.AspectRatio = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("AltIdentifier" == _currentElementName) {
                        
                        AltIdentifierListArray.append(NGEContentIdentifierType(reader))
                        handledInChild = true
                        
                    } else if("RatingSet" == _currentElementName) {
                        
                        self.RatingSet = NGEContentRatingType(reader)
                        handledInChild = true
                        
                    } else if("People" == _currentElementName) {
                        
                        PeopleListArray.append(NGEBasicMetadataPeopleType(reader))
                        handledInChild = true
                        
                    } else if("CountryOfOrigin" == _currentElementName) {
                        
                        self.CountryOfOrigin = NGERegionType(reader)
                        handledInChild = true
                        
                    } else if("PrimarySpokenLanguage" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            PrimarySpokenLanguageListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("OriginalLanguage" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            OriginalLanguageListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("VersionLanguage" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            VersionLanguageListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("AssociatedOrg" == _currentElementName) {
                        
                        AssociatedOrgListArray.append(NGEAssociatedOrgType(reader))
                        handledInChild = true
                        
                    } else if("SequenceInfo" == _currentElementName) {
                        
                        self.SequenceInfo = NGEContentSequenceInfoType(reader)
                        handledInChild = true
                        
                    } else if("Parent" == _currentElementName) {
                        
                        ParentListArray.append(NGEBasicMetadataParentType(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEBasicMetadataType: \(_currentElementName)")
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
        
        if(LocalizedInfoListArray.count > 0) { self.LocalizedInfoList = LocalizedInfoListArray }
        
        if(ReleaseHistoryListArray.count > 0) { self.ReleaseHistoryList = ReleaseHistoryListArray }
        
        if(AltIdentifierListArray.count > 0) { self.AltIdentifierList = AltIdentifierListArray }
        
        if(PeopleListArray.count > 0) { self.PeopleList = PeopleListArray }
        
        if(PrimarySpokenLanguageListArray.count > 0) { self.PrimarySpokenLanguageList = PrimarySpokenLanguageListArray }
        if(OriginalLanguageListArray.count > 0) { self.OriginalLanguageList = OriginalLanguageListArray }
        if(VersionLanguageListArray.count > 0) { self.VersionLanguageList = VersionLanguageListArray }
        if(AssociatedOrgListArray.count > 0) { self.AssociatedOrgList = AssociatedOrgListArray }
        
        if(ParentListArray.count > 0) { self.ParentList = ParentListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.ContentID != nil) {
            
            dict["ContentID"] = self.ContentID!
            
        }
        
        if(self.UpdateNum != nil) {
            
            dict["UpdateNum"] = self.UpdateNum!
            
        }
        
        if(self.LocalizedInfoList != nil) {
            dict["LocalizedInfoList"] = self.LocalizedInfoList!.map({$0.dictionary})
        }
        
        if(self.RunLength != nil) {
            
            dict["RunLength"] = self.RunLength!
            
        }
        
        if(self.ReleaseYear != nil) {
            
            dict["ReleaseYear"] = self.ReleaseYear!
            
        }
        
        if(self.ReleaseDate != nil) {
            
            dict["ReleaseDate"] = self.ReleaseDate!
            
        }
        
        if(self.ReleaseHistoryList != nil) {
            dict["ReleaseHistoryList"] = self.ReleaseHistoryList!.map({$0.dictionary})
        }
        
        if(self.WorkType != nil) {
            
            dict["WorkType"] = self.WorkType!
            
        }
        
        if(self.WorkTypeDetail != nil) {
            
            dict["WorkTypeDetail"] = self.WorkTypeDetail!
            
        }
        
        if(self.PictureColorType != nil) {
            
            let obj = NGEColorTypeTypeEnum.toString(PictureColorType!)
            dict["value"] = obj
            
        }
        
        if(self.PictureFormat != nil) {
            
            dict["PictureFormat"] = self.PictureFormat!
            
        }
        
        if(self.ThreeD != nil) {
            
            dict["ThreeD"] = self.ThreeD!
            
        }
        
        if(self.AspectRatio != nil) {
            
            dict["AspectRatio"] = self.AspectRatio!
            
        }
        
        if(self.AltIdentifierList != nil) {
            dict["AltIdentifierList"] = self.AltIdentifierList!.map({$0.dictionary})
        }
        
        if(self.RatingSet != nil) {
            dict["RatingSet"] = self.RatingSet!
        }
        
        if(self.PeopleList != nil) {
            dict["PeopleList"] = self.PeopleList!.map({$0.dictionary})
        }
        
        if(self.CountryOfOrigin != nil) {
            dict["CountryOfOrigin"] = self.CountryOfOrigin!
        }
        
        if(self.PrimarySpokenLanguageList != nil) {
            
            dict["PrimarySpokenLanguageList"] = self.PrimarySpokenLanguageList!
            
        }
        
        if(self.OriginalLanguageList != nil) {
            
            dict["OriginalLanguageList"] = self.OriginalLanguageList!
            
        }
        
        if(self.VersionLanguageList != nil) {
            
            dict["VersionLanguageList"] = self.VersionLanguageList!
            
        }
        
        if(self.AssociatedOrgList != nil) {
            dict["AssociatedOrgList"] = self.AssociatedOrgList!.map({$0.dictionary})
        }
        
        if(self.SequenceInfo != nil) {
            dict["SequenceInfo"] = self.SequenceInfo!
        }
        
        if(self.ParentList != nil) {
            dict["ParentList"] = self.ParentList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

