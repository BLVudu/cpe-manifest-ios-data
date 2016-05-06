
import Foundation

@objc
class NGEAppDataFeedGeneric : NSObject{
    
    var FeedImageLocation: String?
    
    var FeedImageID: String?
    
    var PostingImageLocation: String?
    
    var PostingName: String?
    
    var WhenPosted: NSDate?
    
    var Title: String?
    
    var Body: String!
    
    var BodyImageLocationList: [String]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        let dateOnlyFormatter = NSDateFormatter()
        dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
        dateOnlyFormatter.timeZone = NSTimeZone(name:"UTC")
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let dateOnlyFormatter = NSDateFormatter()
        dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
        dateOnlyFormatter.timeZone = NSTimeZone(name:"UTC")
        
        self.readAttributes(reader)
        
        var BodyImageLocationListArray = [String]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("FeedImageLocation" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let FeedImageLocationElementValue = xmlTextReaderConstValue(reader)
                    if FeedImageLocationElementValue != nil {
                        
                        self.FeedImageLocation = String.fromCString(UnsafePointer<CChar>(FeedImageLocationElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("FeedImageID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let FeedImageIDElementValue = xmlTextReaderConstValue(reader)
                    if FeedImageIDElementValue != nil {
                        
                        self.FeedImageID = String.fromCString(UnsafePointer<CChar>(FeedImageIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PostingImageLocation" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PostingImageLocationElementValue = xmlTextReaderConstValue(reader)
                    if PostingImageLocationElementValue != nil {
                        
                        self.PostingImageLocation = String.fromCString(UnsafePointer<CChar>(PostingImageLocationElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PostingName" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PostingNameElementValue = xmlTextReaderConstValue(reader)
                    if PostingNameElementValue != nil {
                        
                        self.PostingName = String.fromCString(UnsafePointer<CChar>(PostingNameElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("WhenPosted" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let WhenPostedElementValue = xmlTextReaderConstValue(reader)
                    if WhenPostedElementValue != nil {
                        
                        self.WhenPosted = dateOnlyFormatter.dateFromString(String.fromCString(UnsafePointer<CChar>(WhenPostedElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Title" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TitleElementValue = xmlTextReaderConstValue(reader)
                    if TitleElementValue != nil {
                        
                        self.Title = String.fromCString(UnsafePointer<CChar>(TitleElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Body" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let BodyElementValue = xmlTextReaderConstValue(reader)
                    if BodyElementValue != nil {
                        
                        self.Body = String.fromCString(UnsafePointer<CChar>(BodyElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("BodyImageLocation" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let BodyImageLocationElementValue = xmlTextReaderConstValue(reader)
                    if BodyImageLocationElementValue != nil {
                        
                        BodyImageLocationListArray.append(String.fromCString(UnsafePointer<CChar>(BodyImageLocationElementValue))!)
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
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(BodyImageLocationListArray.count > 0) { self.BodyImageLocationList = BodyImageLocationListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.FeedImageLocation != nil) {
            
            dict["FeedImageLocation"] = self.FeedImageLocation!
            
        }
        
        if(self.FeedImageID != nil) {
            
            dict["FeedImageID"] = self.FeedImageID!
            
        }
        
        if(self.PostingImageLocation != nil) {
            
            dict["PostingImageLocation"] = self.PostingImageLocation!
            
        }
        
        if(self.PostingName != nil) {
            
            dict["PostingName"] = self.PostingName!
            
        }
        
        if(self.WhenPosted != nil) {
            
            dict["WhenPosted"] = self.WhenPosted!
            
        }
        
        if(self.Title != nil) {
            
            dict["Title"] = self.Title!
            
        }
        
        if(self.Body != nil) {
            
            dict["Body"] = self.Body!
            
        }
        
        if(self.BodyImageLocationList != nil) {
            
            dict["BodyImageLocationList"] = self.BodyImageLocationList!
            
        }
        
        return dict
    }*/
    
}

