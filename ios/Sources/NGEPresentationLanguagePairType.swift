
import Foundation

@objc
class NGEPresentationLanguagePairType : NSObject{
    
    var SystemLanguage: String!
    
    var AudioLanguage: String!
    
    var SubtitleLanguage: String!
    
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
                if("SystemLanguage" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SystemLanguageElementValue = xmlTextReaderConstValue(reader)
                    if SystemLanguageElementValue != nil {
                        
                        self.SystemLanguage = String.fromCString(UnsafePointer<CChar>(SystemLanguageElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("AudioLanguage" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AudioLanguageElementValue = xmlTextReaderConstValue(reader)
                    if AudioLanguageElementValue != nil {
                        
                        self.AudioLanguage = String.fromCString(UnsafePointer<CChar>(AudioLanguageElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SubtitleLanguage" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SubtitleLanguageElementValue = xmlTextReaderConstValue(reader)
                    if SubtitleLanguageElementValue != nil {
                        
                        self.SubtitleLanguage = String.fromCString(UnsafePointer<CChar>(SubtitleLanguageElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected: \(_currentElementName)")
                    //break
                }
            }
            _readerOk = xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.SystemLanguage != nil) {
            
            dict["SystemLanguage"] = self.SystemLanguage!
            
        }
        
        if(self.AudioLanguage != nil) {
            
            dict["AudioLanguage"] = self.AudioLanguage!
            
        }
        
        if(self.SubtitleLanguage != nil) {
            
            dict["SubtitleLanguage"] = self.SubtitleLanguage!
            
        }
        
        return dict
    }*/
    
}

