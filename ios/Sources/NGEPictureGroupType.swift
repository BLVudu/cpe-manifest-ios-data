
import Foundation

@objc
class NGEPictureGroupType : NSObject{
    
    var PictureGroupID: String?
    
    var PictureList: [NGEPictureType]!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let PictureGroupIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "PictureGroupID").UTF8String)
        let PictureGroupIDAttrValue = xmlTextReaderGetAttribute(reader, PictureGroupIDAttrName)
        if(PictureGroupIDAttrValue != nil) {
            
            self.PictureGroupID = String.fromCString(UnsafePointer<CChar>(PictureGroupIDAttrValue))
            xmlFree(PictureGroupIDAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var PictureListArray = [NGEPictureType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Picture" == _currentElementName) {
                    
                    PictureListArray.append(NGEPictureType(reader: reader))
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
        
        if(PictureListArray.count > 0) { self.PictureList = PictureListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.PictureGroupID != nil) {
            
            dict["PictureGroupID"] = self.PictureGroupID!
            
        }
        
        if(self.PictureList != nil) {
            dict["PictureList"] = self.PictureList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

