import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEContentSequenceInfoType : NSObject{
    
    var `Number`: Int?
    
    var `DistributionNumber`: NGEComplexSequenceInfoDistributionNumber?
    
    var `HouseSequence`: NGEComplexSequenceInfoHouseSequence?
    
    var `AlternateNumberList`: [NGEComplexSequenceInfoAlternateNumber]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        self.readAttributes(reader)
        
        var AlternateNumberListArray = [NGEComplexSequenceInfoAlternateNumber]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("Number" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Number = numFormatter.number(from: String(cString: elementValue))!.intValue
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("DistributionNumber" == _currentElementName) {
                        
                        self.DistributionNumber = NGEComplexSequenceInfoDistributionNumber(reader)
                        handledInChild = true
                        
                    } else if("HouseSequence" == _currentElementName) {
                        
                        self.HouseSequence = NGEComplexSequenceInfoHouseSequence(reader)
                        handledInChild = true
                        
                    } else if("AlternateNumber" == _currentElementName) {
                        
                        AlternateNumberListArray.append(NGEComplexSequenceInfoAlternateNumber(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEContentSequenceInfoType: \(_currentElementName)")
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
        
        if(AlternateNumberListArray.count > 0) { self.AlternateNumberList = AlternateNumberListArray }
    }
    
}

