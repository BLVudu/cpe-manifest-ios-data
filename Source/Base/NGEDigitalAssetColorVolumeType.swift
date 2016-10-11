import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDigitalAssetColorVolumeType : NSObject{
    
    var `PrimaryRChromaticity`: NGEDigitalAssetChromaticityType!
    
    var `PrimaryGChromaticity`: NGEDigitalAssetChromaticityType!
    
    var `PrimaryBChromaticity`: NGEDigitalAssetChromaticityType!
    
    var `WhitePointChromaticity`: NGEDigitalAssetChromaticityType!
    
    var `LuminanceMin`: Double!
    
    var `LuminanceMax`: Double!
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        let decFormatter = NumberFormatter()
        decFormatter.numberStyle = .decimal
        decFormatter.decimalSeparator = "."
        
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let decFormatter = NumberFormatter()
        decFormatter.numberStyle = .decimal
        decFormatter.decimalSeparator = "."
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("PrimaryRChromaticity" == _currentElementName) {
                        
                        self.PrimaryRChromaticity = NGEDigitalAssetChromaticityType(reader)
                        handledInChild = true
                        
                    } else if("PrimaryGChromaticity" == _currentElementName) {
                        
                        self.PrimaryGChromaticity = NGEDigitalAssetChromaticityType(reader)
                        handledInChild = true
                        
                    } else if("PrimaryBChromaticity" == _currentElementName) {
                        
                        self.PrimaryBChromaticity = NGEDigitalAssetChromaticityType(reader)
                        handledInChild = true
                        
                    } else if("WhitePointChromaticity" == _currentElementName) {
                        
                        self.WhitePointChromaticity = NGEDigitalAssetChromaticityType(reader)
                        handledInChild = true
                        
                    } else if("LuminanceMin" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.LuminanceMin = decFormatter.number(from: String(cString: elementValue))!.doubleValue
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("LuminanceMax" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.LuminanceMax = decFormatter.number(from: String(cString: elementValue))!.doubleValue
                            
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
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
}

