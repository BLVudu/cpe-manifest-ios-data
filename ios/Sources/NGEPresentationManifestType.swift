
import Foundation

@objc
class NGEPresentationManifestType : NSObject{
    
    var updateNum: Int?
    
    var Inventory: NGEInventoryType?
    
    var Presentation: NGEPresentationType?
    
    var PictureGroups: NGEPictureGroupListType?
    
    var TextGroups: NGETextGroupListType?
    
    var TimedEventSequences: NGETimedEventSequenceListType?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
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
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Inventory" == _currentElementName) {
                    
                    self.Inventory = NGEInventoryType(reader: reader)
                    handledInChild = true
                    
                } else if("Presentation" == _currentElementName) {
                    
                    self.Presentation = NGEPresentationType(reader: reader)
                    handledInChild = true
                    
                } else if("PictureGroups" == _currentElementName) {
                    
                    self.PictureGroups = NGEPictureGroupListType(reader: reader)
                    handledInChild = true
                    
                } else if("TextGroups" == _currentElementName) {
                    
                    self.TextGroups = NGETextGroupListType(reader: reader)
                    handledInChild = true
                    
                } else if("TimedEventSequences" == _currentElementName) {
                    
                    self.TimedEventSequences = NGETimedEventSequenceListType(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected: \(_currentElementName)")
                    //break
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.updateNum != nil) {
            
            dict["updateNum"] = self.updateNum!
            
        }
        
        if(self.Inventory != nil) {
            dict["Inventory"] = self.Inventory!
        }
        
        if(self.Presentation != nil) {
            dict["Presentation"] = self.Presentation!
        }
        
        if(self.PictureGroups != nil) {
            dict["PictureGroups"] = self.PictureGroups!
        }
        
        if(self.TextGroups != nil) {
            dict["TextGroups"] = self.TextGroups!
        }
        
        if(self.TimedEventSequences != nil) {
            dict["TimedEventSequences"] = self.TimedEventSequences!
        }
        
        return dict
    }*/
    
}

