
import Foundation

@objc
class NGEAbbreviatedMetadataInfoType : NSObject{
    
    var language: String!
    
    var isDefault: Bool?
    
    var TitleBrief: String!
    
    var ArtReferenceList: [String]?
    
    var SummaryShort: String!
    
    var DisplayIndicatorsList: [NGEDisplayIndicatorsEnum]?
    
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
        
        var ArtReferenceListArray = [String]()
        
        var DisplayIndicatorsListArray = [NGEDisplayIndicatorsEnum]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("TitleBrief" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TitleBriefElementValue = xmlTextReaderConstValue(reader)
                    if TitleBriefElementValue != nil {
                        
                        self.TitleBrief = String.fromCString(UnsafePointer<CChar>(TitleBriefElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ArtReference" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ArtReferenceElementValue = xmlTextReaderConstValue(reader)
                    if ArtReferenceElementValue != nil {
                        
                        ArtReferenceListArray.append(String.fromCString(UnsafePointer<CChar>(ArtReferenceElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SummaryShort" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SummaryShortElementValue = xmlTextReaderConstValue(reader)
                    if SummaryShortElementValue != nil {
                        
                        self.SummaryShort = String.fromCString(UnsafePointer<CChar>(SummaryShortElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("DisplayIndicators" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let DisplayIndicatorsElementValue = xmlTextReaderConstValue(reader)
                    if DisplayIndicatorsElementValue != nil {
                        
                        DisplayIndicatorsListArray.append(NGEDisplayIndicatorsEnum.fromString(String.fromCString(UnsafePointer<CChar>(DisplayIndicatorsElementValue))))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected: \(_currentElementName)")
                    //break
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(ArtReferenceListArray.count > 0) { self.ArtReferenceList = ArtReferenceListArray }
        
        if(DisplayIndicatorsListArray.count > 0) { self.DisplayIndicatorsList = DisplayIndicatorsListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.language != nil) {
            
            dict["language"] = self.language!
            
        }
        
        if(self.isDefault != nil) {
            
            dict["isDefault"] = self.isDefault!
            
        }
        
        if(self.TitleBrief != nil) {
            
            dict["TitleBrief"] = self.TitleBrief!
            
        }
        
        if(self.ArtReferenceList != nil) {
            
            dict["ArtReferenceList"] = self.ArtReferenceList!
            
        }
        
        if(self.SummaryShort != nil) {
            
            dict["SummaryShort"] = self.SummaryShort!
            
        }
        
        if(self.DisplayIndicatorsList != nil) {
            
            dict["DisplayIndicatorsList"] = self.DisplayIndicatorsList!
            
        }
        
        return dict
    }*/
    
}

