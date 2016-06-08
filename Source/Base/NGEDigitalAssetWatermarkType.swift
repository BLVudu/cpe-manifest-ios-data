import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDigitalAssetWatermarkType : NSObject{
    
    var guaranteedAbsent: Bool?
    
    var Vendor: String!
    
    var ProductAndVersionID: String!
    
    var Data: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let guaranteedAbsentAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "guaranteedAbsent").UTF8String)
        let guaranteedAbsentAttrValue = xmlTextReaderGetAttribute(reader, guaranteedAbsentAttrName)
        if(guaranteedAbsentAttrValue != nil) {
            
            self.guaranteedAbsent = (String.fromCString(UnsafePointer<CChar>(guaranteedAbsentAttrValue)) == "true")
            xmlFree(guaranteedAbsentAttrValue)
        }
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
                if("Vendor" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let VendorElementValue = xmlTextReaderConstValue(reader)
                    if VendorElementValue != nil {
                        
                        self.Vendor = String.fromCString(UnsafePointer<CChar>(VendorElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ProductAndVersionID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ProductAndVersionIDElementValue = xmlTextReaderConstValue(reader)
                    if ProductAndVersionIDElementValue != nil {
                        
                        self.ProductAndVersionID = String.fromCString(UnsafePointer<CChar>(ProductAndVersionIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Data" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let DataElementValue = xmlTextReaderConstValue(reader)
                    if DataElementValue != nil {
                        
                        self.Data = String.fromCString(UnsafePointer<CChar>(DataElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEDigitalAssetWatermarkType: \(_currentElementName)")
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
        
        if(self.guaranteedAbsent != nil) {
            
            dict["guaranteedAbsent"] = self.guaranteedAbsent!
            
        }
        
        if(self.Vendor != nil) {
            
            dict["Vendor"] = self.Vendor!
            
        }
        
        if(self.ProductAndVersionID != nil) {
            
            dict["ProductAndVersionID"] = self.ProductAndVersionID!
            
        }
        
        if(self.Data != nil) {
            
            dict["Data"] = self.Data!
            
        }
        
        return dict
    }*/
    
}

