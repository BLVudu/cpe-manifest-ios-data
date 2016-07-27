import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEManifestAppDataSetType : NSObject{
    
    var ManifestDataSetID: String?
    
    var updateNum: Int?
    
    var ManifestIDList: [String]?
    
    var ManifestAppDataList: [NGEAppDataType]!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let ManifestDataSetIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "ManifestDataSetID").UTF8String)
        let ManifestDataSetIDAttrValue = xmlTextReaderGetAttribute(reader, ManifestDataSetIDAttrName)
        if(ManifestDataSetIDAttrValue != nil) {
            
            self.ManifestDataSetID = String.fromCString(UnsafePointer<CChar>(ManifestDataSetIDAttrValue))
            xmlFree(ManifestDataSetIDAttrValue)
        }
        let updateNumAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "updateNum").UTF8String)
        let updateNumAttrValue = xmlTextReaderGetAttribute(reader, updateNumAttrName)
        if(updateNumAttrValue != nil) {
            
            self.updateNum = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(updateNumAttrValue))!)!.integerValue
            xmlFree(updateNumAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        self.readAttributes(reader)
        
        var ManifestIDListArray = [String]()
        var ManifestAppDataListArray = [NGEAppDataType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("ManifestID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ManifestIDElementValue = xmlTextReaderConstValue(reader)
                    if ManifestIDElementValue != nil {
                        
                        ManifestIDListArray.append(String.fromCString(UnsafePointer<CChar>(ManifestIDElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ManifestAppData" == _currentElementName) {
                    
                    ManifestAppDataListArray.append(NGEAppDataType(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEManifestAppDataSetType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(ManifestIDListArray.count > 0) { self.ManifestIDList = ManifestIDListArray }
        if(ManifestAppDataListArray.count > 0) { self.ManifestAppDataList = ManifestAppDataListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.ManifestDataSetID != nil) {
            
            dict["ManifestDataSetID"] = self.ManifestDataSetID!
            
        }
        
        if(self.updateNum != nil) {
            
            dict["updateNum"] = self.updateNum!
            
        }
        
        if(self.ManifestIDList != nil) {
            
            dict["ManifestIDList"] = self.ManifestIDList!
            
        }
        
        if(self.ManifestAppDataList != nil) {
            dict["ManifestAppDataList"] = self.ManifestAppDataList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

