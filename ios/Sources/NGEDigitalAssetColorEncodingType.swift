
import Foundation

@objc
class NGEDigitalAssetColorEncodingType : NSObject{
    
    var Primaries: String!
    
    var TransferFunction: String!
    
    var ColorDifferencing: String!
    
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
                if("Primaries" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PrimariesElementValue = xmlTextReaderConstValue(reader)
                    if PrimariesElementValue != nil {
                        
                        self.Primaries = String.fromCString(UnsafePointer<CChar>(PrimariesElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TransferFunction" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TransferFunctionElementValue = xmlTextReaderConstValue(reader)
                    if TransferFunctionElementValue != nil {
                        
                        self.TransferFunction = String.fromCString(UnsafePointer<CChar>(TransferFunctionElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ColorDifferencing" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ColorDifferencingElementValue = xmlTextReaderConstValue(reader)
                    if ColorDifferencingElementValue != nil {
                        
                        self.ColorDifferencing = String.fromCString(UnsafePointer<CChar>(ColorDifferencingElementValue))
                        
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
        
        if(self.Primaries != nil) {
            
            dict["Primaries"] = self.Primaries!
            
        }
        
        if(self.TransferFunction != nil) {
            
            dict["TransferFunction"] = self.TransferFunction!
            
        }
        
        if(self.ColorDifferencing != nil) {
            
            dict["ColorDifferencing"] = self.ColorDifferencing!
            
        }
        
        return dict
    }*/
    
}

