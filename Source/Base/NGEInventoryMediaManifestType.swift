import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEInventoryMediaManifestType : NSObject{
    
    var `ManifestID`: String?
    
    var `updateNum`: Int?
    
    var `ExtraVersionReference`: String?
    
    var `updateDeliveryType`: String?
    
    var `profile`: String?
    
    var `Compatibility`: NGECompatibilityType?
    
    var `Inventory`: NGEInventoryType?
    
    var `Presentations`: NGEPresentationListType?
    
    var `PlayableSequences`: NGEPlayableSequenceListType?
    
    var `PictureGroups`: NGEPictureGroupListType?
    
    var `AppGroups`: NGEAppGroupListType?
    
    var `TextGroups`: NGETextGroupListType?
    
    var `Experiences`: NGEExperienceListType!
    
    var `TimedEventSequences`: NGETimedEventSequenceListType?
    
    var `ALIDExperienceMaps`: NGEALIDExperienceMapListType?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "ManifestID") {
            
            self.ManifestID = String(cString: attrValue)
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "updateNum") {
            
            self.updateNum = numFormatter.number(from: String(cString: attrValue))!.intValue
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "ExtraVersionReference") {
            
            self.ExtraVersionReference = String(cString: attrValue)
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "updateDeliveryType") {
            
            self.updateDeliveryType = String(cString: attrValue)
            xmlFree(attrValue)
        }
        if let attrValue = xmlTextReaderGetAttribute(reader, "profile") {
            
            self.profile = String(cString: attrValue)
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("Compatibility" == _currentElementName) {
                        
                        self.Compatibility = NGECompatibilityType(reader)
                        handledInChild = true
                        
                    } else if("Inventory" == _currentElementName) {
                        
                        self.Inventory = NGEInventoryType(reader)
                        handledInChild = true
                        
                    } else if("Presentations" == _currentElementName) {
                        
                        self.Presentations = NGEPresentationListType(reader)
                        handledInChild = true
                        
                    } else if("PlayableSequences" == _currentElementName) {
                        
                        self.PlayableSequences = NGEPlayableSequenceListType(reader)
                        handledInChild = true
                        
                    } else if("PictureGroups" == _currentElementName) {
                        
                        self.PictureGroups = NGEPictureGroupListType(reader)
                        handledInChild = true
                        
                    } else if("AppGroups" == _currentElementName) {
                        
                        self.AppGroups = NGEAppGroupListType(reader)
                        handledInChild = true
                        
                    } else if("TextGroups" == _currentElementName) {
                        
                        self.TextGroups = NGETextGroupListType(reader)
                        handledInChild = true
                        
                    } else if("Experiences" == _currentElementName) {
                        
                        self.Experiences = NGEExperienceListType(reader)
                        handledInChild = true
                        
                    } else if("TimedEventSequences" == _currentElementName) {
                        
                        self.TimedEventSequences = NGETimedEventSequenceListType(reader)
                        handledInChild = true
                        
                    } else if("ALIDExperienceMaps" == _currentElementName) {
                        
                        self.ALIDExperienceMaps = NGEALIDExperienceMapListType(reader)
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEInventoryMediaManifestType: \(_currentElementName)")
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
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.ManifestID != nil) {
            
            dict["ManifestID"] = self.ManifestID!
            
        }
        
        if(self.updateNum != nil) {
            
            dict["updateNum"] = self.updateNum!
            
        }
        
        if(self.ExtraVersionReference != nil) {
            
            dict["ExtraVersionReference"] = self.ExtraVersionReference!
            
        }
        
        if(self.updateDeliveryType != nil) {
            
            dict["updateDeliveryType"] = self.updateDeliveryType!
            
        }
        
        if(self.profile != nil) {
            
            dict["profile"] = self.profile!
            
        }
        
        if(self.Compatibility != nil) {
            dict["Compatibility"] = self.Compatibility!
        }
        
        if(self.Inventory != nil) {
            dict["Inventory"] = self.Inventory!
        }
        
        if(self.Presentations != nil) {
            dict["Presentations"] = self.Presentations!
        }
        
        if(self.PlayableSequences != nil) {
            dict["PlayableSequences"] = self.PlayableSequences!
        }
        
        if(self.PictureGroups != nil) {
            dict["PictureGroups"] = self.PictureGroups!
        }
        
        if(self.AppGroups != nil) {
            dict["AppGroups"] = self.AppGroups!
        }
        
        if(self.TextGroups != nil) {
            dict["TextGroups"] = self.TextGroups!
        }
        
        if(self.Experiences != nil) {
            dict["Experiences"] = self.Experiences!
        }
        
        if(self.TimedEventSequences != nil) {
            dict["TimedEventSequences"] = self.TimedEventSequences!
        }
        
        if(self.ALIDExperienceMaps != nil) {
            dict["ALIDExperienceMaps"] = self.ALIDExperienceMaps!
        }
        
        return dict
    }*/
    
}

