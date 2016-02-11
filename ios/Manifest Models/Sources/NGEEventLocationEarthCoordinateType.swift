
import Foundation

@objc
class NGEEventLocationEarthCoordinateType : NSObject{
    
    var Latitude: Double!
    
    var Longitude: Double!
    
    var ElevationMeters: Double?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        let decFormatter = NSNumberFormatter()
        decFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        decFormatter.decimalSeparator = "."
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let decFormatter = NSNumberFormatter()
        decFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        decFormatter.decimalSeparator = "."
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Latitude" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let LatitudeElementValue = xmlTextReaderConstValue(reader)
                    if LatitudeElementValue != nil {
                        
                        self.Latitude = decFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(LatitudeElementValue))!)!.doubleValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Longitude" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let LongitudeElementValue = xmlTextReaderConstValue(reader)
                    if LongitudeElementValue != nil {
                        
                        self.Longitude = decFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(LongitudeElementValue))!)!.doubleValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ElevationMeters" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ElevationMetersElementValue = xmlTextReaderConstValue(reader)
                    if ElevationMetersElementValue != nil {
                        
                        self.ElevationMeters = decFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(ElevationMetersElementValue))!)!.doubleValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEEventLocationEarthCoordinateType: \(_currentElementName)")
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
        
        if(self.Latitude != nil) {
            
            dict["Latitude"] = self.Latitude!
            
        }
        
        if(self.Longitude != nil) {
            
            dict["Longitude"] = self.Longitude!
            
        }
        
        if(self.ElevationMeters != nil) {
            
            dict["ElevationMeters"] = self.ElevationMeters!
            
        }
        
        return dict
    }*/
    
}

