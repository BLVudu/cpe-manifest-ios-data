
import Foundation

@objc
class NGEDigitalAssetInteractiveEncodingType : NSObject{
    
    var RuntimeEnvironment: String!
    
    var FirstVersion: String?
    
    var LastVersion: String?
    
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
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("RuntimeEnvironment" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let RuntimeEnvironmentElementValue = xmlTextReaderConstValue(reader)
                    if RuntimeEnvironmentElementValue != nil {
                        
                        self.RuntimeEnvironment = String.fromCString(UnsafePointer<CChar>(RuntimeEnvironmentElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("FirstVersion" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let FirstVersionElementValue = xmlTextReaderConstValue(reader)
                    if FirstVersionElementValue != nil {
                        
                        self.FirstVersion = String.fromCString(UnsafePointer<CChar>(FirstVersionElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("LastVersion" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let LastVersionElementValue = xmlTextReaderConstValue(reader)
                    if LastVersionElementValue != nil {
                        
                        self.LastVersion = String.fromCString(UnsafePointer<CChar>(LastVersionElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected: \(_currentElementName)")
                    //break
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.RuntimeEnvironment != nil) {
            
            dict["RuntimeEnvironment"] = self.RuntimeEnvironment!
            
        }
        
        if(self.FirstVersion != nil) {
            
            dict["FirstVersion"] = self.FirstVersion!
            
        }
        
        if(self.LastVersion != nil) {
            
            dict["LastVersion"] = self.LastVersion!
            
        }
        
        return dict
    }*/
    
}

