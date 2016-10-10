import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEMediaManifestEditType : NSObject{
    
    var `type`: String?
    
    var `reference`: String?
    
    var `ManifestID`: String?
    
    var `updateDeliveryType`: String?
    
    var `updateNum`: Int?
    
    var `ExtraVersionReference`: String?
    
    var `DeleteObjects`: NGEMediaManifestEditDeleteType?
    
    var `AddObjects`: NGEMediaManifestEditAddType?
    
    var `Description`: String?
    
    var `Instructions`: String?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "type") {
            
            self.type = String(cString: attrValue)
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "reference") {
            
            self.reference = String(cString: attrValue)
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "ManifestID") {
            
            self.ManifestID = String(cString: attrValue)
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "updateDeliveryType") {
            
            self.updateDeliveryType = String(cString: attrValue)
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "updateNum") {
            
            self.updateNum = numFormatter.number(from: String(cString: attrValue))!.intValue
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "ExtraVersionReference") {
            
            self.ExtraVersionReference = String(cString: attrValue)
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("DeleteObjects" == _currentElementName) {
                        
                        self.DeleteObjects = NGEMediaManifestEditDeleteType(reader)
                        handledInChild = true
                        
                    } else if("AddObjects" == _currentElementName) {
                        
                        self.AddObjects = NGEMediaManifestEditAddType(reader)
                        handledInChild = true
                        
                    } else if("Description" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Description = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Instructions" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Instructions = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEMediaManifestEditType: \(_currentElementName)")
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

