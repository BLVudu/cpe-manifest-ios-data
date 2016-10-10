import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEAbbreviatedMetadataInfoType : NSObject{
    
    var `language`: String!
    
    var `isDefault`: Bool?
    
    var `TitleBrief`: String!
    
    var `ArtReferenceList`: [String]?
    
    var `SummaryShort`: String!
    
    var `DisplayIndicatorsList`: [NGEDisplayIndicatorsEnum]?
    
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
        
        var ArtReferenceListArray = [String]()
        
        var DisplayIndicatorsListArray = [NGEDisplayIndicatorsEnum]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("TitleBrief" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.TitleBrief = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ArtReference" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            ArtReferenceListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("SummaryShort" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.SummaryShort = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("DisplayIndicators" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            DisplayIndicatorsListArray.append(NGEDisplayIndicatorsEnum.fromString(enumString: String(cString: elementValue)))
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEAbbreviatedMetadataInfoType: \(_currentElementName)")
                        if superclass != NSObject.self {
                            break
                        }
                    }
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(ArtReferenceListArray.count > 0) { self.ArtReferenceList = ArtReferenceListArray }
        
        if(DisplayIndicatorsListArray.count > 0) { self.DisplayIndicatorsList = DisplayIndicatorsListArray }
    }
    
}

