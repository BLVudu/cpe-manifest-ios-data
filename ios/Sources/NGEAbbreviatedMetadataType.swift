
import Foundation

@objc
class NGEAbbreviatedMetadataType : NSObject{
    
    var ContentID: String!
    
    var UpdateNum: Int?
    
    var LocalizedInfoList: [NGEAbbreviatedMetadataInfoType]!
    
    var RatingList: [NGEContentRatingType]?
    
    var AltIdentifierList: [NGEContentIdentifierType]?
    
    var Studio: String!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let ContentIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "ContentID").UTF8String)
        let ContentIDAttrValue = xmlTextReaderGetAttribute(reader, ContentIDAttrName)
        if(ContentIDAttrValue != nil) {
            
            self.ContentID = String.fromCString(UnsafePointer<CChar>(ContentIDAttrValue))
            xmlFree(ContentIDAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
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
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("UpdateNum" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let UpdateNumElementValue = xmlTextReaderConstValue(reader)
                    if UpdateNumElementValue != nil {
                        
                        self.UpdateNum = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(UpdateNumElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("LocalizedInfo" == _currentElementName) {
                    
                    LocalizedInfoListArray.append(NGEAbbreviatedMetadataInfoType(reader: reader))
                    handledInChild = true
                    
                } else if("Rating" == _currentElementName) {
                    
                    RatingListArray.append(NGEContentRatingType(reader: reader))
                    handledInChild = true
                    
                } else if("AltIdentifier" == _currentElementName) {
                    
                    AltIdentifierListArray.append(NGEContentIdentifierType(reader: reader))
                    handledInChild = true
                    
                } else if("Studio" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let StudioElementValue = xmlTextReaderConstValue(reader)
                    if StudioElementValue != nil {
                        
                        self.Studio = String.fromCString(UnsafePointer<CChar>(StudioElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected: \(_currentElementName)")
                    //break
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
        
        if(self.RatingList != nil) {
            dict["RatingList"] = self.RatingList!.map({$0.dictionary})
        }
        
        if(self.AltIdentifierList != nil) {
            dict["AltIdentifierList"] = self.AltIdentifierList!.map({$0.dictionary})
        }
        
        if(self.Studio != nil) {
            
            dict["Studio"] = self.Studio!
            
        }
        
        return dict
    }*/
    
}

