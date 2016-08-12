import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGENodeStyleRefType : NSObject{
    
    var NodeStyleID: String!
    
    var Orientation: NGEOrientationEnum?
    
    var WidthPixelsMax: Int?
    
    var DeviceTargetList: [NGECompatibilityDeviceType]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let NodeStyleIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "NodeStyleID").UTF8String)
        let NodeStyleIDAttrValue = xmlTextReaderGetAttribute(reader, NodeStyleIDAttrName)
        if(NodeStyleIDAttrValue != nil) {
            
            self.NodeStyleID = String.fromCString(UnsafePointer<CChar>(NodeStyleIDAttrValue))
            xmlFree(NodeStyleIDAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        self.readAttributes(reader)
        
        var DeviceTargetListArray = [NGECompatibilityDeviceType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Orientation" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let OrientationElementValue = xmlTextReaderConstValue(reader)
                    if OrientationElementValue != nil {
                        
                        self.Orientation = NGEOrientationEnum.fromString(String.fromCString(UnsafePointer<CChar>(OrientationElementValue)))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("WidthPixelsMax" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let WidthPixelsMaxElementValue = xmlTextReaderConstValue(reader)
                    if WidthPixelsMaxElementValue != nil {
                        
                        self.WidthPixelsMax = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(WidthPixelsMaxElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("DeviceTarget" == _currentElementName) {
                    
                    DeviceTargetListArray.append(NGECompatibilityDeviceType(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGENodeStyleRefType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(DeviceTargetListArray.count > 0) { self.DeviceTargetList = DeviceTargetListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.NodeStyleID != nil) {
            
            dict["NodeStyleID"] = self.NodeStyleID!
            
        }
        
        if(self.Orientation != nil) {
            
            let obj = NGEOrientationEnum.toString(Orientation!)
            dict["value"] = obj
            
        }
        
        if(self.WidthPixelsMax != nil) {
            
            dict["WidthPixelsMax"] = self.WidthPixelsMax!
            
        }
        
        if(self.DeviceTargetList != nil) {
            dict["DeviceTargetList"] = self.DeviceTargetList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

