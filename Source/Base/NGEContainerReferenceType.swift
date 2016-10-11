import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEContainerReferenceType : NSObject{
    
    var `ContainerLocationList`: [NGELocationType]?
    
    var `ParentContainer`: NGEContainerReferenceType?
    
    var `ContainerIdentifierList`: [NGEContentIdentifierType]?
    
    var `Length`: Int?
    
    var `HashList`: [NGEHashType]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        self.readAttributes(reader)
        
        var ContainerLocationListArray = [NGELocationType]()
        
        var ContainerIdentifierListArray = [NGEContentIdentifierType]()
        
        var HashListArray = [NGEHashType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("ContainerLocation" == _currentElementName) {
                        
                        ContainerLocationListArray.append(NGELocationType(reader))
                        handledInChild = true
                        
                    } else if("ParentContainer" == _currentElementName) {
                        
                        self.ParentContainer = NGEContainerReferenceType(reader)
                        handledInChild = true
                        
                    } else if("ContainerIdentifier" == _currentElementName) {
                        
                        ContainerIdentifierListArray.append(NGEContentIdentifierType(reader))
                        handledInChild = true
                        
                    } else if("Length" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Length = numFormatter.number(from: String(cString: elementValue))!.intValue
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Hash" == _currentElementName) {
                        
                        HashListArray.append(NGEHashType(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEContainerReferenceType: \(_currentElementName)")
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
        
        if(ContainerLocationListArray.count > 0) { self.ContainerLocationList = ContainerLocationListArray }
        
        if(ContainerIdentifierListArray.count > 0) { self.ContainerIdentifierList = ContainerIdentifierListArray }
        
        if(HashListArray.count > 0) { self.HashList = HashListArray }
    }
    
}

