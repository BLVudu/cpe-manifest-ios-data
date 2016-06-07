
import Foundation

@objc
class NGEContentRatingType : NSObject{
    
    var NotRated: NGENotRated!
    
    var RatingList: [NGEContentRatingDetailType]!
    
    var AdultContent: Bool?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var RatingListArray = [NGEContentRatingDetailType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("NotRated" == _currentElementName) {
                    
                    self.NotRated = NGENotRated(reader: reader)
                    handledInChild = true
                    
                } else if("Rating" == _currentElementName) {
                    
                    RatingListArray.append(NGEContentRatingDetailType(reader: reader))
                    handledInChild = true
                    
                } else if("AdultContent" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AdultContentElementValue = xmlTextReaderConstValue(reader)
                    if AdultContentElementValue != nil {
                        
                        self.AdultContent = String.fromCString(UnsafePointer<CChar>(AdultContentElementValue)) == "true"
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEContentRatingType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(RatingListArray.count > 0) { self.RatingList = RatingListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.NotRated != nil) {
            dict["NotRated"] = self.NotRated!
        }
        
        if(self.RatingList != nil) {
            dict["RatingList"] = self.RatingList!.map({$0.dictionary})
        }
        
        if(self.AdultContent != nil) {
            
            dict["AdultContent"] = self.AdultContent!
            
        }
        
        return dict
    }*/
    
}
