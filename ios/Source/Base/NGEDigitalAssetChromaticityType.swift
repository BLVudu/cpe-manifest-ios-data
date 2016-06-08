import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDigitalAssetChromaticityType : NSObject{
    
    var ChromaticityCIEx: Double!
    
    var ChromaticityCIEy: Double!
    
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
                if("ChromaticityCIEx" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ChromaticityCIExElementValue = xmlTextReaderConstValue(reader)
                    if ChromaticityCIExElementValue != nil {
                        
                        self.ChromaticityCIEx = decFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(ChromaticityCIExElementValue))!)!.doubleValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ChromaticityCIEy" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ChromaticityCIEyElementValue = xmlTextReaderConstValue(reader)
                    if ChromaticityCIEyElementValue != nil {
                        
                        self.ChromaticityCIEy = decFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(ChromaticityCIEyElementValue))!)!.doubleValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEDigitalAssetChromaticityType: \(_currentElementName)")
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
        
        if(self.ChromaticityCIEx != nil) {
            
            dict["ChromaticityCIEx"] = self.ChromaticityCIEx!
            
        }
        
        if(self.ChromaticityCIEy != nil) {
            
            dict["ChromaticityCIEy"] = self.ChromaticityCIEy!
            
        }
        
        return dict
    }*/
    
}

