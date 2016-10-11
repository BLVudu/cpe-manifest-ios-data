import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEAbbreviatedMetadataType : NSObject{
    
    var `ContentID`: String!
    
    var `UpdateNum`: Int?
    
    var `LocalizedInfoList`: [NGEAbbreviatedMetadataInfoType]!
    
    var `RatingList`: [NGEContentRatingType]?
    
    var `AltIdentifierList`: [NGEContentIdentifierType]?
    
    var `Studio`: String!
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
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
        
        self.readAttributes(reader)
        
        var LocalizedInfoListArray = [NGEAbbreviatedMetadataInfoType]()
        var RatingListArray = [NGEContentRatingType]()
        var AltIdentifierListArray = [NGEContentIdentifierType]()
        
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
                        
                        LocalizedInfoListArray.append(NGEAbbreviatedMetadataInfoType(reader))
                        handledInChild = true
                        
                    } else if("Rating" == _currentElementName) {
                        
                        RatingListArray.append(NGEContentRatingType(reader))
                        handledInChild = true
                        
                    } else if("AltIdentifier" == _currentElementName) {
                        
                        AltIdentifierListArray.append(NGEContentIdentifierType(reader))
                        handledInChild = true
                        
                    } else if("Studio" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Studio = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEAbbreviatedMetadataType: \(_currentElementName)")
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
        if(RatingListArray.count > 0) { self.RatingList = RatingListArray }
        if(AltIdentifierListArray.count > 0) { self.AltIdentifierList = AltIdentifierListArray }
        
    }
    
}

