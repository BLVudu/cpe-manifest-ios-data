
import Foundation

@objc
class NGEContainerReferenceType : NSObject{
    
    var ContainerLocation: NSURL?
    
    var ParentContainer: NGEContainerReferenceType?
    
    var ContainerIdentifierList: [NGEContentIdentifierType]?
    
    var Length: Int?
    
    var HashList: [NGEHashType]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        self.readAttributes(reader)
        
        var ContainerIdentifierListArray = [NGEContentIdentifierType]()
        
        var HashListArray = [NGEHashType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("ContainerLocation" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ContainerLocationElementValue = xmlTextReaderConstValue(reader)
                    if ContainerLocationElementValue != nil {
                        
                        self.ContainerLocation = NSURL(string: String.fromCString(UnsafePointer<CChar>(ContainerLocationElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ParentContainer" == _currentElementName) {
                    
                    self.ParentContainer = NGEContainerReferenceType(reader: reader)
                    handledInChild = true
                    
                } else if("ContainerIdentifier" == _currentElementName) {
                    
                    ContainerIdentifierListArray.append(NGEContentIdentifierType(reader: reader))
                    handledInChild = true
                    
                } else if("Length" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let LengthElementValue = xmlTextReaderConstValue(reader)
                    if LengthElementValue != nil {
                        
                        self.Length = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(LengthElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Hash" == _currentElementName) {
                    
                    HashListArray.append(NGEHashType(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected: \(_currentElementName)")
                    //break
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(ContainerIdentifierListArray.count > 0) { self.ContainerIdentifierList = ContainerIdentifierListArray }
        
        if(HashListArray.count > 0) { self.HashList = HashListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.ContainerLocation != nil) {
            
            dict["ContainerLocation"] = self.ContainerLocation!
            
        }
        
        if(self.ParentContainer != nil) {
            dict["ParentContainer"] = self.ParentContainer!
        }
        
        if(self.ContainerIdentifierList != nil) {
            dict["ContainerIdentifierList"] = self.ContainerIdentifierList!.map({$0.dictionary})
        }
        
        if(self.Length != nil) {
            
            dict["Length"] = self.Length!
            
        }
        
        if(self.HashList != nil) {
            dict["HashList"] = self.HashList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

