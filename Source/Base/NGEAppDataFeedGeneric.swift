import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEAppDataFeedGeneric : NSObject{
    
    var `FeedImageLocation`: String?
    
    var `FeedImageID`: String?
    
    var `PostingImageLocation`: String?
    
    var `PostingName`: String?
    
    var `WhenPosted`: Date?
    
    var `Title`: String?
    
    var `Body`: String!
    
    var `BodyImageLocationList`: [String]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {let dateOnlyFormatter = DateFormatter()
    dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
    dateOnlyFormatter.timeZone = TimeZone(abbreviation:"UTC")
    
}

init(_ reader: xmlTextReaderPtr) {
    let _complexTypeXmlDept = xmlTextReaderDepth(reader)
    super.init()
    let dateOnlyFormatter = DateFormatter()
    dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
    dateOnlyFormatter.timeZone = TimeZone(abbreviation:"UTC")
    
    self.readAttributes(reader)
    
    var BodyImageLocationListArray = [String]()
    
    var _readerOk = xmlTextReaderRead(reader)
    var _currentNodeType = xmlTextReaderNodeType(reader)
    var _currentXmlDept = xmlTextReaderDepth(reader)
    
    while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
        
        if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
            if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                let _currentElementName = String(cString: _currentElementNameXmlChar)
                if("FeedImageLocation" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    if let elementValue = xmlTextReaderConstValue(reader) {
                        
                        self.FeedImageLocation = String(cString: elementValue)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("FeedImageID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    if let elementValue = xmlTextReaderConstValue(reader) {
                        
                        self.FeedImageID = String(cString: elementValue)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PostingImageLocation" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    if let elementValue = xmlTextReaderConstValue(reader) {
                        
                        self.PostingImageLocation = String(cString: elementValue)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PostingName" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    if let elementValue = xmlTextReaderConstValue(reader) {
                        
                        self.PostingName = String(cString: elementValue)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("WhenPosted" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    if let elementValue = xmlTextReaderConstValue(reader) {
                        
                        self.WhenPosted = dateOnlyFormatter.date(from: String(cString: elementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Title" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    if let elementValue = xmlTextReaderConstValue(reader) {
                        
                        self.Title = String(cString: elementValue)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Body" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    if let elementValue = xmlTextReaderConstValue(reader) {
                        
                        self.Body = String(cString: elementValue)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("BodyImageLocation" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    if let elementValue = xmlTextReaderConstValue(reader) {
                        
                        BodyImageLocationListArray.append(String(cString: elementValue))
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEAppDataFeedGeneric: \(_currentElementName)")
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
    
    if(BodyImageLocationListArray.count > 0) { self.BodyImageLocationList = BodyImageLocationListArray }
}

}

