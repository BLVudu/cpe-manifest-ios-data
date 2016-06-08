import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEContentSequenceInfoType : NSObject{
    
    var Number: Int?
    
    var DistributionNumber: NGEComplexSequenceInfoDistributionNumber?
    
    var HouseSequence: NGEComplexSequenceInfoHouseSequence?
    
    var AlternateNumberList: [NGEComplexSequenceInfoAlternateNumber]?
    
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
        
        var AlternateNumberListArray = [NGEComplexSequenceInfoAlternateNumber]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Number" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let NumberElementValue = xmlTextReaderConstValue(reader)
                    if NumberElementValue != nil {
                        
                        self.Number = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(NumberElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("DistributionNumber" == _currentElementName) {
                    
                    self.DistributionNumber = NGEComplexSequenceInfoDistributionNumber(reader: reader)
                    handledInChild = true
                    
                } else if("HouseSequence" == _currentElementName) {
                    
                    self.HouseSequence = NGEComplexSequenceInfoHouseSequence(reader: reader)
                    handledInChild = true
                    
                } else if("AlternateNumber" == _currentElementName) {
                    
                    AlternateNumberListArray.append(NGEComplexSequenceInfoAlternateNumber(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEContentSequenceInfoType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(AlternateNumberListArray.count > 0) { self.AlternateNumberList = AlternateNumberListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Number != nil) {
            
            dict["Number"] = self.Number!
            
        }
        
        if(self.DistributionNumber != nil) {
            dict["DistributionNumber"] = self.DistributionNumber!
        }
        
        if(self.HouseSequence != nil) {
            dict["HouseSequence"] = self.HouseSequence!
        }
        
        if(self.AlternateNumberList != nil) {
            dict["AlternateNumberList"] = self.AlternateNumberList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

