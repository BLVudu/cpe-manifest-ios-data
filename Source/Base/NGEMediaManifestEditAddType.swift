import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEMediaManifestEditAddType : NSObject{
    
    var `Compatibility`: NGECompatibilityType?
    
    var `Inventory`: NGEInventoryType?
    
    var `Presentations`: NGEPresentationListType?
    
    var `PlayableSequences`: NGEPlayableSequenceListType?
    
    var `PictureGroups`: NGEPictureGroupListType?
    
    var `AppGroups`: NGEAppGroupListType?
    
    var `MetadataList`: [NGEInventoryMetadataType]?
    
    var `TextObjectList`: [String]?
    
    var `TextGroupList`: [NGETextGroupType]?
    
    var `TextGroupsList`: [NGETextGroupListType]?
    
    var `TimedEventSequenceList`: [NGETimedEventSequenceType]?
    
    var `Experiences`: NGEExperienceListType?
    
    var `ALIDExperienceMaps`: NGEALIDExperienceMapListType?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var MetadataListArray = [NGEInventoryMetadataType]()
        var TextObjectListArray = [String]()
        var TextGroupListArray = [NGETextGroupType]()
        var TextGroupsListArray = [NGETextGroupListType]()
        var TimedEventSequenceListArray = [NGETimedEventSequenceType]()
        
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
                        
                    } else if("Metadata" == _currentElementName) {
                        
                        MetadataListArray.append(NGEInventoryMetadataType(reader))
                        handledInChild = true
                        
                    } else if("TextObject" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            TextObjectListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("TextGroup" == _currentElementName) {
                        
                        TextGroupListArray.append(NGETextGroupType(reader))
                        handledInChild = true
                        
                    } else if("TextGroups" == _currentElementName) {
                        
                        TextGroupsListArray.append(NGETextGroupListType(reader))
                        handledInChild = true
                        
                    } else if("TimedEventSequence" == _currentElementName) {
                        
                        TimedEventSequenceListArray.append(NGETimedEventSequenceType(reader))
                        handledInChild = true
                        
                    } else if("Experiences" == _currentElementName) {
                        
                        self.Experiences = NGEExperienceListType(reader)
                        handledInChild = true
                        
                    } else if("ALIDExperienceMaps" == _currentElementName) {
                        
                        self.ALIDExperienceMaps = NGEALIDExperienceMapListType(reader)
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEMediaManifestEditAddType: \(_currentElementName)")
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
        
        if(MetadataListArray.count > 0) { self.MetadataList = MetadataListArray }
        if(TextObjectListArray.count > 0) { self.TextObjectList = TextObjectListArray }
        if(TextGroupListArray.count > 0) { self.TextGroupList = TextGroupListArray }
        if(TextGroupsListArray.count > 0) { self.TextGroupsList = TextGroupsListArray }
        if(TimedEventSequenceListArray.count > 0) { self.TimedEventSequenceList = TimedEventSequenceListArray }
        
    }
    
}

