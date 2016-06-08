import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEEventLocationOtherCoordinateType : NSObject{
    
    var system: String!
    
    var CoordinateList: [NGECoordinate]!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let systemAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "system").UTF8String)
        let systemAttrValue = xmlTextReaderGetAttribute(reader, systemAttrName)
        if(systemAttrValue != nil) {
            
            self.system = String.fromCString(UnsafePointer<CChar>(systemAttrValue))
            xmlFree(systemAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var CoordinateListArray = [NGECoordinate]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Coordinate" == _currentElementName) {
                    
                    CoordinateListArray.append(NGECoordinate(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEEventLocationOtherCoordinateType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(CoordinateListArray.count > 0) { self.CoordinateList = CoordinateListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.system != nil) {
            
            dict["system"] = self.system!
            
        }
        
        if(self.CoordinateList != nil) {
            dict["CoordinateList"] = self.CoordinateList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

