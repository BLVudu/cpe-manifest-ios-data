
import Foundation

@objc
class NGEPersonIdentifierType : NSObject{
    
    var Identifier: String!
    
    var Namespace: String!
    
    var ReferenceLocation: String?
    
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
                if("Identifier" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let IdentifierElementValue = xmlTextReaderConstValue(reader)
                    if IdentifierElementValue != nil {
                        
                        self.Identifier = String.fromCString(UnsafePointer<CChar>(IdentifierElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Namespace" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let NamespaceElementValue = xmlTextReaderConstValue(reader)
                    if NamespaceElementValue != nil {
                        
                        self.Namespace = String.fromCString(UnsafePointer<CChar>(NamespaceElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ReferenceLocation" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ReferenceLocationElementValue = xmlTextReaderConstValue(reader)
                    if ReferenceLocationElementValue != nil {
                        
                        self.ReferenceLocation = String.fromCString(UnsafePointer<CChar>(ReferenceLocationElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEPersonIdentifierType: \(_currentElementName)")
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
        
        if(self.Identifier != nil) {
            
            dict["Identifier"] = self.Identifier!
            
        }
        
        if(self.Namespace != nil) {
            
            dict["Namespace"] = self.Namespace!
            
        }
        
        if(self.ReferenceLocation != nil) {
            
            dict["ReferenceLocation"] = self.ReferenceLocation!
            
        }
        
        return dict
    }*/
    
}
