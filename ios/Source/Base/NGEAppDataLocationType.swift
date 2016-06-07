
import Foundation

@objc
class NGEAppDataLocationType : NSObject{
    
    var LocationList: [NGELocation]!
    
    var MapImageID: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var LocationListArray = [NGELocation]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Location" == _currentElementName) {
                    
                    LocationListArray.append(NGELocation(reader: reader))
                    handledInChild = true
                    
                } else if("MapImageID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let MapImageIDElementValue = xmlTextReaderConstValue(reader)
                    if MapImageIDElementValue != nil {
                        
                        self.MapImageID = String.fromCString(UnsafePointer<CChar>(MapImageIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEAppDataLocationType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(LocationListArray.count > 0) { self.LocationList = LocationListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.LocationList != nil) {
            dict["LocationList"] = self.LocationList!.map({$0.dictionary})
        }
        
        if(self.MapImageID != nil) {
            
            dict["MapImageID"] = self.MapImageID!
            
        }
        
        return dict
    }*/
    
}

