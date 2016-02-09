
import Foundation

@objc
class NGEDigitalAssetImageDataType : NSObject{
    
    var Width: Int!
    
    var Height: Int!
    
    var Encoding: String!
    
    var Language: String?
    
    var TrackReference: String?
    
    var TrackIdentifierList: [NGEContentIdentifierType]?
    
    var Private: NGEPrivateDataType?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        self.readAttributes(reader)
        
        var TrackIdentifierListArray = [NGEContentIdentifierType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Width" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let WidthElementValue = xmlTextReaderConstValue(reader)
                    if WidthElementValue != nil {
                        
                        self.Width = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(WidthElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Height" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let HeightElementValue = xmlTextReaderConstValue(reader)
                    if HeightElementValue != nil {
                        
                        self.Height = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(HeightElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Encoding" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let EncodingElementValue = xmlTextReaderConstValue(reader)
                    if EncodingElementValue != nil {
                        
                        self.Encoding = String.fromCString(UnsafePointer<CChar>(EncodingElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Language" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let LanguageElementValue = xmlTextReaderConstValue(reader)
                    if LanguageElementValue != nil {
                        
                        self.Language = String.fromCString(UnsafePointer<CChar>(LanguageElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TrackReference" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TrackReferenceElementValue = xmlTextReaderConstValue(reader)
                    if TrackReferenceElementValue != nil {
                        
                        self.TrackReference = String.fromCString(UnsafePointer<CChar>(TrackReferenceElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TrackIdentifier" == _currentElementName) {
                    
                    TrackIdentifierListArray.append(NGEContentIdentifierType(reader: reader))
                    handledInChild = true
                    
                } else if("Private" == _currentElementName) {
                    
                    self.Private = NGEPrivateDataType(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected: \(_currentElementName)")
                    //break
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(TrackIdentifierListArray.count > 0) { self.TrackIdentifierList = TrackIdentifierListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Width != nil) {
            
            dict["Width"] = self.Width!
            
        }
        
        if(self.Height != nil) {
            
            dict["Height"] = self.Height!
            
        }
        
        if(self.Encoding != nil) {
            
            dict["Encoding"] = self.Encoding!
            
        }
        
        if(self.Language != nil) {
            
            dict["Language"] = self.Language!
            
        }
        
        if(self.TrackReference != nil) {
            
            dict["TrackReference"] = self.TrackReference!
            
        }
        
        if(self.TrackIdentifierList != nil) {
            dict["TrackIdentifierList"] = self.TrackIdentifierList!.map({$0.dictionary})
        }
        
        if(self.Private != nil) {
            dict["Private"] = self.Private!
        }
        
        return dict
    }*/
    
}

