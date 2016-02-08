
import Foundation

@objc
class NGEContainerMetadataType : NSObject{
    
    var Type: String?
    
    var TrackList: [NGEContainerTrackMetadataType]?
    
    var HashList: [NGEHashType]?
    
    var Size: Int?
    
    var ContainerReference: String?
    
    var ContainerIdentifierList: [NGEContentIdentifierType]?
    
    var ContainerSpecificMetadata: NGEContainerSpecificType?
    
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
        
        var TrackListArray = [NGEContainerTrackMetadataType]()
        var HashListArray = [NGEHashType]()
        
        var ContainerIdentifierListArray = [NGEContentIdentifierType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Type" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TypeElementValue = xmlTextReaderConstValue(reader)
                    if TypeElementValue != nil {
                        
                        self.Type = String.fromCString(UnsafePointer<CChar>(TypeElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Track" == _currentElementName) {
                    
                    TrackListArray.append(NGEContainerTrackMetadataType(reader: reader))
                    handledInChild = true
                    
                } else if("Hash" == _currentElementName) {
                    
                    HashListArray.append(NGEHashType(reader: reader))
                    handledInChild = true
                    
                } else if("Size" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SizeElementValue = xmlTextReaderConstValue(reader)
                    if SizeElementValue != nil {
                        
                        self.Size = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(SizeElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ContainerReference" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ContainerReferenceElementValue = xmlTextReaderConstValue(reader)
                    if ContainerReferenceElementValue != nil {
                        
                        self.ContainerReference = String.fromCString(UnsafePointer<CChar>(ContainerReferenceElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ContainerIdentifier" == _currentElementName) {
                    
                    ContainerIdentifierListArray.append(NGEContentIdentifierType(reader: reader))
                    handledInChild = true
                    
                } else if("ContainerSpecificMetadata" == _currentElementName) {
                    
                    self.ContainerSpecificMetadata = NGEContainerSpecificType(reader: reader)
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
        
        if(TrackListArray.count > 0) { self.TrackList = TrackListArray }
        if(HashListArray.count > 0) { self.HashList = HashListArray }
        
        if(ContainerIdentifierListArray.count > 0) { self.ContainerIdentifierList = ContainerIdentifierListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Type != nil) {
            
            dict["Type"] = self.Type!
            
        }
        
        if(self.TrackList != nil) {
            dict["TrackList"] = self.TrackList!.map({$0.dictionary})
        }
        
        if(self.HashList != nil) {
            dict["HashList"] = self.HashList!.map({$0.dictionary})
        }
        
        if(self.Size != nil) {
            
            dict["Size"] = self.Size!
            
        }
        
        if(self.ContainerReference != nil) {
            
            dict["ContainerReference"] = self.ContainerReference!
            
        }
        
        if(self.ContainerIdentifierList != nil) {
            dict["ContainerIdentifierList"] = self.ContainerIdentifierList!.map({$0.dictionary})
        }
        
        if(self.ContainerSpecificMetadata != nil) {
            dict["ContainerSpecificMetadata"] = self.ContainerSpecificMetadata!
        }
        
        return dict
    }*/
    
}

