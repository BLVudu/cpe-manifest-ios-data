
import Foundation

@objc
class NGEEventLocationType : NSObject{
    
    var Type: NGEType!
    
    var Name: String?
    
    var Address: String?
    
    var EarthCoordinate: NGEEarthCoordinate?
    
    var OtherCoordinates: NGEOtherCoordinates?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Type" == _currentElementName) {
                    
                    self.Type = NGEType(reader: reader)
                    handledInChild = true
                    
                } else if("Name" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let NameElementValue = xmlTextReaderConstValue(reader)
                    if NameElementValue != nil {
                        
                        self.Name = String.fromCString(UnsafePointer<CChar>(NameElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Address" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AddressElementValue = xmlTextReaderConstValue(reader)
                    if AddressElementValue != nil {
                        
                        self.Address = String.fromCString(UnsafePointer<CChar>(AddressElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("EarthCoordinate" == _currentElementName) {
                    
                    self.EarthCoordinate = NGEEarthCoordinate(reader: reader)
                    handledInChild = true
                    
                } else if("OtherCoordinates" == _currentElementName) {
                    
                    self.OtherCoordinates = NGEOtherCoordinates(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEEventLocationType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Type != nil) {
            dict["Type"] = self.Type!
        }
        
        if(self.Name != nil) {
            
            dict["Name"] = self.Name!
            
        }
        
        if(self.Address != nil) {
            
            dict["Address"] = self.Address!
            
        }
        
        if(self.EarthCoordinate != nil) {
            dict["EarthCoordinate"] = self.EarthCoordinate!
        }
        
        if(self.OtherCoordinates != nil) {
            dict["OtherCoordinates"] = self.OtherCoordinates!
        }
        
        return dict
    }*/
    
}

