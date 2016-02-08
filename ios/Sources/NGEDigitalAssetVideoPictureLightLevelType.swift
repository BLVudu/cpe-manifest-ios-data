
import Foundation

@objc
class NGEDigitalAssetVideoPictureLightLevelType : NSObject{
    
    var ContentMaxList: [NGEContentMax]?
    
    var FrameAverageMaxList: [NGEFrameAverageMax]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var ContentMaxListArray = [NGEContentMax]()
        var FrameAverageMaxListArray = [NGEFrameAverageMax]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("ContentMax" == _currentElementName) {
                    
                    ContentMaxListArray.append(NGEContentMax(reader: reader))
                    handledInChild = true
                    
                } else if("FrameAverageMax" == _currentElementName) {
                    
                    FrameAverageMaxListArray.append(NGEFrameAverageMax(reader: reader))
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
        
        if(ContentMaxListArray.count > 0) { self.ContentMaxList = ContentMaxListArray }
        if(FrameAverageMaxListArray.count > 0) { self.FrameAverageMaxList = FrameAverageMaxListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.ContentMaxList != nil) {
            dict["ContentMaxList"] = self.ContentMaxList!.map({$0.dictionary})
        }
        
        if(self.FrameAverageMaxList != nil) {
            dict["FrameAverageMaxList"] = self.FrameAverageMaxList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

