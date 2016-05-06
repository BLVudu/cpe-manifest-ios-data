
import Foundation

@objc
class NGEAppDataSpecialBehaviorType : NSObject{
    
    var ChoseAudioTrackRef: String!
    
    var ChoseVideoTrackRef: String!
    
    var ChoseSubTrackRef: String!
    
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
                if("ChoseAudioTrackRef" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ChoseAudioTrackRefElementValue = xmlTextReaderConstValue(reader)
                    if ChoseAudioTrackRefElementValue != nil {
                        
                        self.ChoseAudioTrackRef = String.fromCString(UnsafePointer<CChar>(ChoseAudioTrackRefElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ChoseVideoTrackRef" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ChoseVideoTrackRefElementValue = xmlTextReaderConstValue(reader)
                    if ChoseVideoTrackRefElementValue != nil {
                        
                        self.ChoseVideoTrackRef = String.fromCString(UnsafePointer<CChar>(ChoseVideoTrackRefElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ChoseSubTrackRef" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ChoseSubTrackRefElementValue = xmlTextReaderConstValue(reader)
                    if ChoseSubTrackRefElementValue != nil {
                        
                        self.ChoseSubTrackRef = String.fromCString(UnsafePointer<CChar>(ChoseSubTrackRefElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEAppDataSpecialBehaviorType: \(_currentElementName)")
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
        
        if(self.ChoseAudioTrackRef != nil) {
            
            dict["ChoseAudioTrackRef"] = self.ChoseAudioTrackRef!
            
        }
        
        if(self.ChoseVideoTrackRef != nil) {
            
            dict["ChoseVideoTrackRef"] = self.ChoseVideoTrackRef!
            
        }
        
        if(self.ChoseSubTrackRef != nil) {
            
            dict["ChoseSubTrackRef"] = self.ChoseSubTrackRef!
            
        }
        
        return dict
    }*/
    
}

