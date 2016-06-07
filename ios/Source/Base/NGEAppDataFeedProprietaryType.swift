
import Foundation

@objc
class NGEAppDataFeedProprietaryType : NSObject{
    
    var category: String!
    
    var feedType: String!
    
    var feedSubType: String?
    
    var SourceURL: String?
    
    var QueryObject: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let categoryAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "category").UTF8String)
        let categoryAttrValue = xmlTextReaderGetAttribute(reader, categoryAttrName)
        if(categoryAttrValue != nil) {
            
            self.category = String.fromCString(UnsafePointer<CChar>(categoryAttrValue))
            xmlFree(categoryAttrValue)
        }
        let feedTypeAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "feedType").UTF8String)
        let feedTypeAttrValue = xmlTextReaderGetAttribute(reader, feedTypeAttrName)
        if(feedTypeAttrValue != nil) {
            
            self.feedType = String.fromCString(UnsafePointer<CChar>(feedTypeAttrValue))
            xmlFree(feedTypeAttrValue)
        }
        let feedSubTypeAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "feedSubType").UTF8String)
        let feedSubTypeAttrValue = xmlTextReaderGetAttribute(reader, feedSubTypeAttrName)
        if(feedSubTypeAttrValue != nil) {
            
            self.feedSubType = String.fromCString(UnsafePointer<CChar>(feedSubTypeAttrValue))
            xmlFree(feedSubTypeAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("SourceURL" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SourceURLElementValue = xmlTextReaderConstValue(reader)
                    if SourceURLElementValue != nil {
                        
                        self.SourceURL = String.fromCString(UnsafePointer<CChar>(SourceURLElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("QueryObject" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let QueryObjectElementValue = xmlTextReaderConstValue(reader)
                    if QueryObjectElementValue != nil {
                        
                        self.QueryObject = String.fromCString(UnsafePointer<CChar>(QueryObjectElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEAppDataFeedProprietaryType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.category != nil) {
            
            dict["category"] = self.category!
            
        }
        
        if(self.feedType != nil) {
            
            dict["feedType"] = self.feedType!
            
        }
        
        if(self.feedSubType != nil) {
            
            dict["feedSubType"] = self.feedSubType!
            
        }
        
        if(self.SourceURL != nil) {
            
            dict["SourceURL"] = self.SourceURL!
            
        }
        
        if(self.QueryObject != nil) {
            
            dict["QueryObject"] = self.QueryObject!
            
        }
        
        return dict
    }*/
    
}

