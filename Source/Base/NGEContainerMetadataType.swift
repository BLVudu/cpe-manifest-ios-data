import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEContainerMetadataType : NSObject{
    
    var `Type`: String?
    
    var `TrackList`: [NGEContainerTrackMetadataType]!
    
    var `HashList`: [NGEHashType]?
    
    var `Size`: Int?
    
    var `ContainerReference`: String?
    
    var `ContainerIdentifierList`: [NGEContentIdentifierType]?
    
    var `ContainerSpecificMetadata`: NGEContainerSpecificType?
    
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
        
        var TrackListArray = [NGEContainerTrackMetadataType]()
        var HashListArray = [NGEHashType]()
        
        var ContainerIdentifierListArray = [NGEContentIdentifierType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("Type" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Type = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Track" == _currentElementName) {
                        
                        TrackListArray.append(NGEContainerTrackMetadataType(reader))
                        handledInChild = true
                        
                    } else if("Hash" == _currentElementName) {
                        
                        HashListArray.append(NGEHashType(reader))
                        handledInChild = true
                        
                    } else if("Size" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Size = numFormatter.number(from: String(cString: elementValue))!.intValue
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ContainerReference" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.ContainerReference = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ContainerIdentifier" == _currentElementName) {
                        
                        ContainerIdentifierListArray.append(NGEContentIdentifierType(reader))
                        handledInChild = true
                        
                    } else if("ContainerSpecificMetadata" == _currentElementName) {
                        
                        self.ContainerSpecificMetadata = NGEContainerSpecificType(reader)
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEContainerMetadataType: \(_currentElementName)")
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
        
        if(TrackListArray.count > 0) { self.TrackList = TrackListArray }
        if(HashListArray.count > 0) { self.HashList = HashListArray }
        
        if(ContainerIdentifierListArray.count > 0) { self.ContainerIdentifierList = ContainerIdentifierListArray }
        
    }
    
}

