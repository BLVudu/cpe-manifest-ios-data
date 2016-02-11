
import Foundation

@objc
class NGEMediaManifestEditType : NSObject{
    
    var type: String?
    
    var reference: String?
    
    var ManifestID: String?
    
    var updateDeliveryType: String?
    
    var updateNum: Int?
    
    var ExtraVersionReference: String?
    
    var DeleteObjects: NGEMediaManifestEditDeleteType?
    
    var AddObjects: NGEMediaManifestEditAddType?
    
    var Description: String?
    
    var Instructions: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let typeAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "type").UTF8String)
        let typeAttrValue = xmlTextReaderGetAttribute(reader, typeAttrName)
        if(typeAttrValue != nil) {
            
            self.type = String.fromCString(UnsafePointer<CChar>(typeAttrValue))
            xmlFree(typeAttrValue)
        }
        let referenceAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "reference").UTF8String)
        let referenceAttrValue = xmlTextReaderGetAttribute(reader, referenceAttrName)
        if(referenceAttrValue != nil) {
            
            self.reference = String.fromCString(UnsafePointer<CChar>(referenceAttrValue))
            xmlFree(referenceAttrValue)
        }
        let ManifestIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "ManifestID").UTF8String)
        let ManifestIDAttrValue = xmlTextReaderGetAttribute(reader, ManifestIDAttrName)
        if(ManifestIDAttrValue != nil) {
            
            self.ManifestID = String.fromCString(UnsafePointer<CChar>(ManifestIDAttrValue))
            xmlFree(ManifestIDAttrValue)
        }
        let updateDeliveryTypeAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "updateDeliveryType").UTF8String)
        let updateDeliveryTypeAttrValue = xmlTextReaderGetAttribute(reader, updateDeliveryTypeAttrName)
        if(updateDeliveryTypeAttrValue != nil) {
            
            self.updateDeliveryType = String.fromCString(UnsafePointer<CChar>(updateDeliveryTypeAttrValue))
            xmlFree(updateDeliveryTypeAttrValue)
        }
        let updateNumAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "updateNum").UTF8String)
        let updateNumAttrValue = xmlTextReaderGetAttribute(reader, updateNumAttrName)
        if(updateNumAttrValue != nil) {
            
            self.updateNum = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(updateNumAttrValue))!)!.integerValue
            xmlFree(updateNumAttrValue)
        }
        let ExtraVersionReferenceAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "ExtraVersionReference").UTF8String)
        let ExtraVersionReferenceAttrValue = xmlTextReaderGetAttribute(reader, ExtraVersionReferenceAttrName)
        if(ExtraVersionReferenceAttrValue != nil) {
            
            self.ExtraVersionReference = String.fromCString(UnsafePointer<CChar>(ExtraVersionReferenceAttrValue))
            xmlFree(ExtraVersionReferenceAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("DeleteObjects" == _currentElementName) {
                    
                    self.DeleteObjects = NGEMediaManifestEditDeleteType(reader: reader)
                    handledInChild = true
                    
                } else if("AddObjects" == _currentElementName) {
                    
                    self.AddObjects = NGEMediaManifestEditAddType(reader: reader)
                    handledInChild = true
                    
                } else if("Description" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let DescriptionElementValue = xmlTextReaderConstValue(reader)
                    if DescriptionElementValue != nil {
                        
                        self.Description = String.fromCString(UnsafePointer<CChar>(DescriptionElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Instructions" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let InstructionsElementValue = xmlTextReaderConstValue(reader)
                    if InstructionsElementValue != nil {
                        
                        self.Instructions = String.fromCString(UnsafePointer<CChar>(InstructionsElementValue))
                        
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
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.type != nil) {
            
            dict["type"] = self.type!
            
        }
        
        if(self.reference != nil) {
            
            dict["reference"] = self.reference!
            
        }
        
        if(self.ManifestID != nil) {
            
            dict["ManifestID"] = self.ManifestID!
            
        }
        
        if(self.updateDeliveryType != nil) {
            
            dict["updateDeliveryType"] = self.updateDeliveryType!
            
        }
        
        if(self.updateNum != nil) {
            
            dict["updateNum"] = self.updateNum!
            
        }
        
        if(self.ExtraVersionReference != nil) {
            
            dict["ExtraVersionReference"] = self.ExtraVersionReference!
            
        }
        
        if(self.DeleteObjects != nil) {
            dict["DeleteObjects"] = self.DeleteObjects!
        }
        
        if(self.AddObjects != nil) {
            dict["AddObjects"] = self.AddObjects!
        }
        
        if(self.Description != nil) {
            
            dict["Description"] = self.Description!
            
        }
        
        if(self.Instructions != nil) {
            
            dict["Instructions"] = self.Instructions!
            
        }
        
        return dict
    }*/
    
}

