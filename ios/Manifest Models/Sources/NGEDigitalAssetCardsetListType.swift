
import Foundation

@objc
class NGEDigitalAssetCardsetListType : NSObject{
    
    var TypeList: [String]?
    
    var RegionList: [String]?
    
    var CardsetList: [NGEDigitalAssetCardsetType]!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var TypeListArray = [String]()
        var RegionListArray = [String]()
        var CardsetListArray = [NGEDigitalAssetCardsetType]()
        
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
                        
                        TypeListArray.append(String.fromCString(UnsafePointer<CChar>(TypeElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Region" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let RegionElementValue = xmlTextReaderConstValue(reader)
                    if RegionElementValue != nil {
                        
                        RegionListArray.append(String.fromCString(UnsafePointer<CChar>(RegionElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Cardset" == _currentElementName) {
                    
                    CardsetListArray.append(NGEDigitalAssetCardsetType(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEDigitalAssetCardsetListType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(TypeListArray.count > 0) { self.TypeList = TypeListArray }
        if(RegionListArray.count > 0) { self.RegionList = RegionListArray }
        if(CardsetListArray.count > 0) { self.CardsetList = CardsetListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.TypeList != nil) {
            
            dict["TypeList"] = self.TypeList!
            
        }
        
        if(self.RegionList != nil) {
            
            dict["RegionList"] = self.RegionList!
            
        }
        
        if(self.CardsetList != nil) {
            dict["CardsetList"] = self.CardsetList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

