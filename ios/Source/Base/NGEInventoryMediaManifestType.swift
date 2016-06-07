
import Foundation

@objc
class NGEInventoryMediaManifestType : NSObject{
    
    var ManifestID: String?
    
    var updateNum: Int?
    
    var ExtraVersionReference: String?
    
    var updateDeliveryType: String?
    
    var profile: String?
    
    var Compatibility: NGECompatibilityType?
    
    var Inventory: NGEInventoryType?
    
    var Presentations: NGEPresentationListType?
    
    var PlayableSequences: NGEPlayableSequenceListType?
    
    var PictureGroups: NGEPictureGroupListType?
    
    var AppGroups: NGEAppGroupListType?
    
    var TextGroups: NGETextGroupListType?
    
    var Experiences: NGEExperienceListType!
    
    var TimedEventSequences: NGETimedEventSequenceListType?
    
    var ALIDExperienceMaps: NGEALIDExperienceMapListType?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let ManifestIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "ManifestID").UTF8String)
        let ManifestIDAttrValue = xmlTextReaderGetAttribute(reader, ManifestIDAttrName)
        if(ManifestIDAttrValue != nil) {
            
            self.ManifestID = String.fromCString(UnsafePointer<CChar>(ManifestIDAttrValue))
            xmlFree(ManifestIDAttrValue)
        }
        let updateNumAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "updateNum").UTF8String)
        let updateNumAttrValue = xmlTextReaderGetAttribute(reader, updateNumAttrName)
        if(updateNumAttrValue != nil) {
            
            self.updateNum = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(updateNumAttrValue))!)!.integerValue
            xmlFree(updateNumAttrValue)
        }
        let ExtraVersionReferenceAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "ExtraVersionReference").UTF8String)
        let ExtraVersionReferenceAttrValue = xmlTextReaderGetAttribute(reader, ExtraVersionReferenceAttrName)
        if(ExtraVersionReferenceAttrValue != nil) {
            
            self.ExtraVersionReference = String.fromCString(UnsafePointer<CChar>(ExtraVersionReferenceAttrValue))
            xmlFree(ExtraVersionReferenceAttrValue)
        }
        let updateDeliveryTypeAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "updateDeliveryType").UTF8String)
        let updateDeliveryTypeAttrValue = xmlTextReaderGetAttribute(reader, updateDeliveryTypeAttrName)
        if(updateDeliveryTypeAttrValue != nil) {
            
            self.updateDeliveryType = String.fromCString(UnsafePointer<CChar>(updateDeliveryTypeAttrValue))
            xmlFree(updateDeliveryTypeAttrValue)
        }
        let profileAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "profile").UTF8String)
        let profileAttrValue = xmlTextReaderGetAttribute(reader, profileAttrName)
        if(profileAttrValue != nil) {
            
            self.profile = String.fromCString(UnsafePointer<CChar>(profileAttrValue))
            xmlFree(profileAttrValue)
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
                if("Compatibility" == _currentElementName) {
                    
                    self.Compatibility = NGECompatibilityType(reader: reader)
                    handledInChild = true
                    
                } else if("Inventory" == _currentElementName) {
                    
                    self.Inventory = NGEInventoryType(reader: reader)
                    handledInChild = true
                    
                } else if("Presentations" == _currentElementName) {
                    
                    self.Presentations = NGEPresentationListType(reader: reader)
                    handledInChild = true
                    
                } else if("PlayableSequences" == _currentElementName) {
                    
                    self.PlayableSequences = NGEPlayableSequenceListType(reader: reader)
                    handledInChild = true
                    
                } else if("PictureGroups" == _currentElementName) {
                    
                    self.PictureGroups = NGEPictureGroupListType(reader: reader)
                    handledInChild = true
                    
                } else if("AppGroups" == _currentElementName) {
                    
                    self.AppGroups = NGEAppGroupListType(reader: reader)
                    handledInChild = true
                    
                } else if("TextGroups" == _currentElementName) {
                    
                    self.TextGroups = NGETextGroupListType(reader: reader)
                    handledInChild = true
                    
                } else if("Experiences" == _currentElementName) {
                    
                    self.Experiences = NGEExperienceListType(reader: reader)
                    handledInChild = true
                    
                } else if("TimedEventSequences" == _currentElementName) {
                    
                    self.TimedEventSequences = NGETimedEventSequenceListType(reader: reader)
                    handledInChild = true
                    
                } else if("ALIDExperienceMaps" == _currentElementName) {
                    
                    self.ALIDExperienceMaps = NGEALIDExperienceMapListType(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEInventoryMediaManifestType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
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

