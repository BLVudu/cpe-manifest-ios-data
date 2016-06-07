
import Foundation

@objc
class NGEDigitalAssetColorVolumeType : NSObject{
    
    var PrimaryRChromaticity: NGEDigitalAssetChromaticityType!
    
    var PrimaryGChromaticity: NGEDigitalAssetChromaticityType!
    
    var PrimaryBChromaticity: NGEDigitalAssetChromaticityType!
    
    var WhitePointChromaticity: NGEDigitalAssetChromaticityType!
    
    var LuminanceMin: Double!
    
    var LuminanceMax: Double!
    
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
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("PrimaryRChromaticity" == _currentElementName) {
                    
                    self.PrimaryRChromaticity = NGEDigitalAssetChromaticityType(reader: reader)
                    handledInChild = true
                    
                } else if("PrimaryGChromaticity" == _currentElementName) {
                    
                    self.PrimaryGChromaticity = NGEDigitalAssetChromaticityType(reader: reader)
                    handledInChild = true
                    
                } else if("PrimaryBChromaticity" == _currentElementName) {
                    
                    self.PrimaryBChromaticity = NGEDigitalAssetChromaticityType(reader: reader)
                    handledInChild = true
                    
                } else if("WhitePointChromaticity" == _currentElementName) {
                    
                    self.WhitePointChromaticity = NGEDigitalAssetChromaticityType(reader: reader)
                    handledInChild = true
                    
                } else if("LuminanceMin" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let LuminanceMinElementValue = xmlTextReaderConstValue(reader)
                    if LuminanceMinElementValue != nil {
                        
                        self.LuminanceMin = decFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(LuminanceMinElementValue))!)!.doubleValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("LuminanceMax" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let LuminanceMaxElementValue = xmlTextReaderConstValue(reader)
                    if LuminanceMaxElementValue != nil {
                        
                        self.LuminanceMax = decFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(LuminanceMaxElementValue))!)!.doubleValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEDigitalAssetColorVolumeType: \(_currentElementName)")
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
        
        if(self.PrimaryRChromaticity != nil) {
            dict["PrimaryRChromaticity"] = self.PrimaryRChromaticity!
        }
        
        if(self.PrimaryGChromaticity != nil) {
            dict["PrimaryGChromaticity"] = self.PrimaryGChromaticity!
        }
        
        if(self.PrimaryBChromaticity != nil) {
            dict["PrimaryBChromaticity"] = self.PrimaryBChromaticity!
        }
        
        if(self.WhitePointChromaticity != nil) {
            dict["WhitePointChromaticity"] = self.WhitePointChromaticity!
        }
        
        if(self.LuminanceMin != nil) {
            
            dict["LuminanceMin"] = self.LuminanceMin!
            
        }
        
        if(self.LuminanceMax != nil) {
            
            dict["LuminanceMax"] = self.LuminanceMax!
            
        }
        
        return dict
    }*/
    
}

