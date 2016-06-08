import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGECompanyCreditsType : NSObject{
    
    var DisplayStringList: [NGEDisplayString]!
    
    var RegionList: [NGERegionType]?
    
    var DisplaySequence: Int?
    
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
        
        var DisplayStringListArray = [NGEDisplayString]()
        var RegionListArray = [NGERegionType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("DisplayString" == _currentElementName) {
                    
                    DisplayStringListArray.append(NGEDisplayString(reader: reader))
                    handledInChild = true
                    
                } else if("Region" == _currentElementName) {
                    
                    RegionListArray.append(NGERegionType(reader: reader))
                    handledInChild = true
                    
                } else if("DisplaySequence" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let DisplaySequenceElementValue = xmlTextReaderConstValue(reader)
                    if DisplaySequenceElementValue != nil {
                        
                        self.DisplaySequence = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(DisplaySequenceElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGECompanyCreditsType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(DisplayStringListArray.count > 0) { self.DisplayStringList = DisplayStringListArray }
        if(RegionListArray.count > 0) { self.RegionList = RegionListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.DisplayStringList != nil) {
            dict["DisplayStringList"] = self.DisplayStringList!.map({$0.dictionary})
        }
        
        if(self.RegionList != nil) {
            dict["RegionList"] = self.RegionList!.map({$0.dictionary})
        }
        
        if(self.DisplaySequence != nil) {
            
            dict["DisplaySequence"] = self.DisplaySequence!
            
        }
        
        return dict
    }*/
    
}

