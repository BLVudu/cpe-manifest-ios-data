import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEExperienceType : NSObject{
    
    var `ExperienceID`: String?
    
    var `version`: String!
    
    var `updateNum`: Int?
    
    var `LanguageList`: [String]!
    
    var `ExcludedLanguageList`: [String]!
    
    var `RegionList`: [NGERegionType]!
    
    var `ExcludedRegionList`: [NGERegionType]!
    
    var `ContentID`: String?
    
    var `Audiovisual`: NGEAudiovisualType?
    
    var `App`: NGEExperienceAppType?
    
    var `Gallery`: NGEGalleryType?
    
    var `PictureGroupIDList`: [String]?
    
    var `TextGroupIDList`: [String]?
    
    var `TimedSequenceIDList`: [String]?
    
    var `ExperienceChildList`: [NGEExperienceChildType]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "ExperienceID") {
            
            self.ExperienceID = String(cString: attrValue)
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "version") {
            
            self.version = String(cString: attrValue)
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "updateNum") {
            
            self.updateNum = numFormatter.number(from: String(cString: attrValue))!.intValue
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
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
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("Language" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            LanguageListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ExcludedLanguage" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            ExcludedLanguageListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Region" == _currentElementName) {
                        
                        RegionListArray.append(NGERegionType(reader))
                        handledInChild = true
                        
                    } else if("ExcludedRegion" == _currentElementName) {
                        
                        ExcludedRegionListArray.append(NGERegionType(reader))
                        handledInChild = true
                        
                    } else if("ContentID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.ContentID = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Audiovisual" == _currentElementName) {
                        
                        self.Audiovisual = NGEAudiovisualType(reader)
                        handledInChild = true
                        
                    } else if("App" == _currentElementName) {
                        
                        self.App = NGEExperienceAppType(reader)
                        handledInChild = true
                        
                    } else if("Gallery" == _currentElementName) {
                        
                        self.Gallery = NGEGalleryType(reader)
                        handledInChild = true
                        
                    } else if("PictureGroupID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            PictureGroupIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("TextGroupID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            TextGroupIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("TimedSequenceID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            TimedSequenceIDListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ExperienceChild" == _currentElementName) {
                        
                        ExperienceChildListArray.append(NGEExperienceChildType(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEExperienceType: \(_currentElementName)")
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
        if(ExcludedLanguageListArray.count > 0) { self.ExcludedLanguageList = ExcludedLanguageListArray }
        if(RegionListArray.count > 0) { self.RegionList = RegionListArray }
        if(ExcludedRegionListArray.count > 0) { self.ExcludedRegionList = ExcludedRegionListArray }
        
        if(PictureGroupIDListArray.count > 0) { self.PictureGroupIDList = PictureGroupIDListArray }
        if(TextGroupIDListArray.count > 0) { self.TextGroupIDList = TextGroupIDListArray }
        if(TimedSequenceIDListArray.count > 0) { self.TimedSequenceIDList = TimedSequenceIDListArray }
        if(ExperienceChildListArray.count > 0) { self.ExperienceChildList = ExperienceChildListArray }
    }
    
}

