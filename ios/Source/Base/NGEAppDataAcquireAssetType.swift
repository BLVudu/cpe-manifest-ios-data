import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEAppDataAcquireAssetType : NSObject{
    
    var ALID: String!
    
    var RequestType: String!
    
    var FormatProfile: String!
    
    var PurchaseURLList: [String]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var PurchaseURLListArray = [String]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("ALID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ALIDElementValue = xmlTextReaderConstValue(reader)
                    if ALIDElementValue != nil {
                        
                        self.ALID = String.fromCString(UnsafePointer<CChar>(ALIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("RequestType" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let RequestTypeElementValue = xmlTextReaderConstValue(reader)
                    if RequestTypeElementValue != nil {
                        
                        self.RequestType = String.fromCString(UnsafePointer<CChar>(RequestTypeElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("FormatProfile" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let FormatProfileElementValue = xmlTextReaderConstValue(reader)
                    if FormatProfileElementValue != nil {
                        
                        self.FormatProfile = String.fromCString(UnsafePointer<CChar>(FormatProfileElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PurchaseURL" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PurchaseURLElementValue = xmlTextReaderConstValue(reader)
                    if PurchaseURLElementValue != nil {
                        
                        PurchaseURLListArray.append(String.fromCString(UnsafePointer<CChar>(PurchaseURLElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEAppDataAcquireAssetType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(PurchaseURLListArray.count > 0) { self.PurchaseURLList = PurchaseURLListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.ALID != nil) {
            
            dict["ALID"] = self.ALID!
            
        }
        
        if(self.RequestType != nil) {
            
            dict["RequestType"] = self.RequestType!
            
        }
        
        if(self.FormatProfile != nil) {
            
            dict["FormatProfile"] = self.FormatProfile!
            
        }
        
        if(self.PurchaseURLList != nil) {
            
            dict["PurchaseURLList"] = self.PurchaseURLList!
            
        }
        
        return dict
    }*/
    
}

