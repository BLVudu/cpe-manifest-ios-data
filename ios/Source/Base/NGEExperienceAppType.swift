
import Foundation

@objc
class NGEExperienceAppType : NSObject{
    
    var AppID: String?
    
    var Type: String!
    
    var SubTypeList: [String]?
    
    var AppGroupID: String!
    
    var AppNameList: [NGEAppName]?
    
    var RatingList: [NGEContentRatingType]?
    
    var ContentID: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let AppIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "AppID").UTF8String)
        let AppIDAttrValue = xmlTextReaderGetAttribute(reader, AppIDAttrName)
        if(AppIDAttrValue != nil) {
            
            self.AppID = String.fromCString(UnsafePointer<CChar>(AppIDAttrValue))
            xmlFree(AppIDAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var SubTypeListArray = [String]()
        
        var AppNameListArray = [NGEAppName]()
        var RatingListArray = [NGEContentRatingType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Type" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TypeElementValue = xmlTextReaderConstValue(reader)
                    if TypeElementValue != nil {
                        
                        self.Type = String.fromCString(UnsafePointer<CChar>(TypeElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SubType" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SubTypeElementValue = xmlTextReaderConstValue(reader)
                    if SubTypeElementValue != nil {
                        
                        SubTypeListArray.append(String.fromCString(UnsafePointer<CChar>(SubTypeElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("AppGroupID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AppGroupIDElementValue = xmlTextReaderConstValue(reader)
                    if AppGroupIDElementValue != nil {
                        
                        self.AppGroupID = String.fromCString(UnsafePointer<CChar>(AppGroupIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("AppName" == _currentElementName) {
                    
                    AppNameListArray.append(NGEAppName(reader: reader))
                    handledInChild = true
                    
                } else if("Rating" == _currentElementName) {
                    
                    RatingListArray.append(NGEContentRatingType(reader: reader))
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
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEExperienceAppType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(SubTypeListArray.count > 0) { self.SubTypeList = SubTypeListArray }
        
        if(AppNameListArray.count > 0) { self.AppNameList = AppNameListArray }
        if(RatingListArray.count > 0) { self.RatingList = RatingListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.AppID != nil) {
            
            dict["AppID"] = self.AppID!
            
        }
        
        if(self.Type != nil) {
            
            dict["Type"] = self.Type!
            
        }
        
        if(self.SubTypeList != nil) {
            
            dict["SubTypeList"] = self.SubTypeList!
            
        }
        
        if(self.AppGroupID != nil) {
            
            dict["AppGroupID"] = self.AppGroupID!
            
        }
        
        if(self.AppNameList != nil) {
            dict["AppNameList"] = self.AppNameList!.map({$0.dictionary})
        }
        
        if(self.RatingList != nil) {
            dict["RatingList"] = self.RatingList!.map({$0.dictionary})
        }
        
        if(self.ContentID != nil) {
            
            dict["ContentID"] = self.ContentID!
            
        }
        
        return dict
    }*/
    
}

