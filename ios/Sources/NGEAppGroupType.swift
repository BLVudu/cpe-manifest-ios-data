
import Foundation

@objc
class NGEAppGroupType : NSObject{
    
    var AppGroupID: NSURL?
    
    var InteractiveTrackReferenceList: [NGEInteractiveTrackReferenceType]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let AppGroupIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "AppGroupID").UTF8String)
        let AppGroupIDAttrValue = xmlTextReaderGetAttribute(reader, AppGroupIDAttrName)
        if(AppGroupIDAttrValue != nil) {
            
            self.AppGroupID = NSURL(string: String.fromCString(UnsafePointer<CChar>(AppGroupIDAttrValue))!)
            xmlFree(AppGroupIDAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var InteractiveTrackReferenceListArray = [NGEInteractiveTrackReferenceType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("InteractiveTrackReference" == _currentElementName) {
                    
                    InteractiveTrackReferenceListArray.append(NGEInteractiveTrackReferenceType(reader: reader))
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
        
        if(InteractiveTrackReferenceListArray.count > 0) { self.InteractiveTrackReferenceList = InteractiveTrackReferenceListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.AppGroupID != nil) {
            
            dict["AppGroupID"] = self.AppGroupID!
            
        }
        
        if(self.InteractiveTrackReferenceList != nil) {
            dict["InteractiveTrackReferenceList"] = self.InteractiveTrackReferenceList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

