import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGESlideshow : NSObject{
    
    var PictureGroupID: String!
    
    var Shuffle: String?
    
    var Duration: String?
    
    var Transition: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
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
                if("PictureGroupID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PictureGroupIDElementValue = xmlTextReaderConstValue(reader)
                    if PictureGroupIDElementValue != nil {
                        
                        self.PictureGroupID = String.fromCString(UnsafePointer<CChar>(PictureGroupIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Shuffle" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ShuffleElementValue = xmlTextReaderConstValue(reader)
                    if ShuffleElementValue != nil {
                        
                        self.Shuffle = String.fromCString(UnsafePointer<CChar>(ShuffleElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Duration" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let DurationElementValue = xmlTextReaderConstValue(reader)
                    if DurationElementValue != nil {
                        
                        self.Duration = String.fromCString(UnsafePointer<CChar>(DurationElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Transition" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TransitionElementValue = xmlTextReaderConstValue(reader)
                    if TransitionElementValue != nil {
                        
                        self.Transition = String.fromCString(UnsafePointer<CChar>(TransitionElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGESlideshow: \(_currentElementName)")
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
        
        if(self.PictureGroupID != nil) {
            
            dict["PictureGroupID"] = self.PictureGroupID!
            
        }
        
        if(self.Shuffle != nil) {
            
            dict["Shuffle"] = self.Shuffle!
            
        }
        
        if(self.Duration != nil) {
            
            dict["Duration"] = self.Duration!
            
        }
        
        if(self.Transition != nil) {
            
            dict["Transition"] = self.Transition!
            
        }
        
        return dict
    }*/
    
}

