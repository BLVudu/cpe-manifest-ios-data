
import Foundation

@objc
class NGEExperienceType : NSObject{
    
    var ExperienceID: String?
    
    var version: String!
    
    var updateNum: Int?
    
    var LanguageList: [String]!
    
    var ExcludedLanguageList: [String]!
    
    var RegionList: [NGERegionType]!
    
    var ExcludedRegionList: [NGERegionType]!
    
    var ContentID: String?
    
    var Audiovisual: NGEAudiovisualType?
    
    var App: NGEExperienceAppType?
    
    var Gallery: NGEGalleryType?
    
    var PictureGroupIDList: [String]?
    
    var TextGroupIDList: [String]?
    
    var TimedSequenceIDList: [String]?
    
    var ExperienceChildList: [NGEExperienceChildType]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let ExperienceIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "ExperienceID").UTF8String)
        let ExperienceIDAttrValue = xmlTextReaderGetAttribute(reader, ExperienceIDAttrName)
        if(ExperienceIDAttrValue != nil) {
            
            self.ExperienceID = String.fromCString(UnsafePointer<CChar>(ExperienceIDAttrValue))
            xmlFree(ExperienceIDAttrValue)
        }
        let versionAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "version").UTF8String)
        let versionAttrValue = xmlTextReaderGetAttribute(reader, versionAttrName)
        if(versionAttrValue != nil) {
            
            self.version = String.fromCString(UnsafePointer<CChar>(versionAttrValue))
            xmlFree(versionAttrValue)
        }
        let updateNumAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "updateNum").UTF8String)
        let updateNumAttrValue = xmlTextReaderGetAttribute(reader, updateNumAttrName)
        if(updateNumAttrValue != nil) {
            
            self.updateNum = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(updateNumAttrValue))!)!.integerValue
            xmlFree(updateNumAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        self.readAttributes(reader)
        
        var LanguageListArray = [String]()
        var ExcludedLanguageListArray = [String]()
        var RegionListArray = [NGERegionType]()
        var ExcludedRegionListArray = [NGERegionType]()
        
        var PictureGroupIDListArray = [String]()
        var TextGroupIDListArray = [String]()
        var TimedSequenceIDListArray = [String]()
        var ExperienceChildListArray = [NGEExperienceChildType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Language" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let LanguageElementValue = xmlTextReaderConstValue(reader)
                    if LanguageElementValue != nil {
                        
                        LanguageListArray.append(String.fromCString(UnsafePointer<CChar>(LanguageElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ExcludedLanguage" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ExcludedLanguageElementValue = xmlTextReaderConstValue(reader)
                    if ExcludedLanguageElementValue != nil {
                        
                        ExcludedLanguageListArray.append(String.fromCString(UnsafePointer<CChar>(ExcludedLanguageElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Region" == _currentElementName) {
                    
                    RegionListArray.append(NGERegionType(reader: reader))
                    handledInChild = true
                    
                } else if("ExcludedRegion" == _currentElementName) {
                    
                    ExcludedRegionListArray.append(NGERegionType(reader: reader))
                    handledInChild = true
                    
                } else if("ContentID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ContentIDElementValue = xmlTextReaderConstValue(reader)
                    if ContentIDElementValue != nil {
                        
                        self.ContentID = String.fromCString(UnsafePointer<CChar>(ContentIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Audiovisual" == _currentElementName) {
                    
                    self.Audiovisual = NGEAudiovisualType(reader: reader)
                    handledInChild = true
                    
                } else if("App" == _currentElementName) {
                    
                    self.App = NGEExperienceAppType(reader: reader)
                    handledInChild = true
                    
                } else if("Gallery" == _currentElementName) {
                    
                    self.Gallery = NGEGalleryType(reader: reader)
                    handledInChild = true
                    
                } else if("PictureGroupID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PictureGroupIDElementValue = xmlTextReaderConstValue(reader)
                    if PictureGroupIDElementValue != nil {
                        
                        PictureGroupIDListArray.append(String.fromCString(UnsafePointer<CChar>(PictureGroupIDElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TextGroupID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TextGroupIDElementValue = xmlTextReaderConstValue(reader)
                    if TextGroupIDElementValue != nil {
                        
                        TextGroupIDListArray.append(String.fromCString(UnsafePointer<CChar>(TextGroupIDElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TimedSequenceID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TimedSequenceIDElementValue = xmlTextReaderConstValue(reader)
                    if TimedSequenceIDElementValue != nil {
                        
                        TimedSequenceIDListArray.append(String.fromCString(UnsafePointer<CChar>(TimedSequenceIDElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ExperienceChild" == _currentElementName) {
                    
                    ExperienceChildListArray.append(NGEExperienceChildType(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEExperienceType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(LanguageListArray.count > 0) { self.LanguageList = LanguageListArray }
        if(ExcludedLanguageListArray.count > 0) { self.ExcludedLanguageList = ExcludedLanguageListArray }
        if(RegionListArray.count > 0) { self.RegionList = RegionListArray }
        if(ExcludedRegionListArray.count > 0) { self.ExcludedRegionList = ExcludedRegionListArray }
        
        if(PictureGroupIDListArray.count > 0) { self.PictureGroupIDList = PictureGroupIDListArray }
        if(TextGroupIDListArray.count > 0) { self.TextGroupIDList = TextGroupIDListArray }
        if(TimedSequenceIDListArray.count > 0) { self.TimedSequenceIDList = TimedSequenceIDListArray }
        if(ExperienceChildListArray.count > 0) { self.ExperienceChildList = ExperienceChildListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.ExperienceID != nil) {
            
            dict["ExperienceID"] = self.ExperienceID!
            
        }
        
        if(self.version != nil) {
            
            dict["version"] = self.version!
            
        }
        
        if(self.updateNum != nil) {
            
            dict["updateNum"] = self.updateNum!
            
        }
        
        if(self.LanguageList != nil) {
            
            dict["LanguageList"] = self.LanguageList!
            
        }
        
        if(self.ExcludedLanguageList != nil) {
            
            dict["ExcludedLanguageList"] = self.ExcludedLanguageList!
            
        }
        
        if(self.RegionList != nil) {
            dict["RegionList"] = self.RegionList!.map({$0.dictionary})
        }
        
        if(self.ExcludedRegionList != nil) {
            dict["ExcludedRegionList"] = self.ExcludedRegionList!.map({$0.dictionary})
        }
        
        if(self.ContentID != nil) {
            
            dict["ContentID"] = self.ContentID!
            
        }
        
        if(self.Audiovisual != nil) {
            dict["Audiovisual"] = self.Audiovisual!
        }
        
        if(self.App != nil) {
            dict["App"] = self.App!
        }
        
        if(self.Gallery != nil) {
            dict["Gallery"] = self.Gallery!
        }
        
        if(self.PictureGroupIDList != nil) {
            
            dict["PictureGroupIDList"] = self.PictureGroupIDList!
            
        }
        
        if(self.TextGroupIDList != nil) {
            
            dict["TextGroupIDList"] = self.TextGroupIDList!
            
        }
        
        if(self.TimedSequenceIDList != nil) {
            
            dict["TimedSequenceIDList"] = self.TimedSequenceIDList!
            
        }
        
        if(self.ExperienceChildList != nil) {
            dict["ExperienceChildList"] = self.ExperienceChildList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

