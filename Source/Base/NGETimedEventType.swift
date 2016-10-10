import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGETimedEventType : NSObject{
    
    var `StartTimecode`: NGETimecodeType!
    
    var `EndTimecode`: NGETimecodeType!
    
    var `Type`: String!
    
    var `SubTypeList`: [String]?
    
    var `PresentationID`: String!
    
    var `PlayableSequenceID`: String!
    
    var `ExperienceID`: String!
    
    var `PictureID`: String!
    
    var `GalleryID`: String!
    
    var `AppGroupID`: String!
    
    var `TextGroupIDList`: [NGETextGroupID]!
    
    var `URL`: String!
    
    var `AdID`: String!
    
    var `ISRC`: String!
    
    var `ProductID`: NGEOtherIDType!
    
    var `OtherID`: NGEOtherIDType!
    
    var `TimePeriod`: NGEEventPeriodType!
    
    var `Location`: NGEEventLocationType!
    
    var `People`: NGEBasicMetadataPeopleType!
    
    var `UPC`: String!
    
    var `Offset`: Int!
    
    var `TimecodeOffset`: NGETimecodeType!
    
    var `Initialization`: String!
    
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
        
        var SubTypeListArray = [String]()
        
        var TextGroupIDListArray = [NGETextGroupID]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("StartTimecode" == _currentElementName) {
                        
                        self.StartTimecode = NGETimecodeType(reader)
                        handledInChild = true
                        
                    } else if("EndTimecode" == _currentElementName) {
                        
                        self.EndTimecode = NGETimecodeType(reader)
                        handledInChild = true
                        
                    } else if("Type" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Type = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("SubType" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            SubTypeListArray.append(String(cString: elementValue))
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("PresentationID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.PresentationID = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("PlayableSequenceID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.PlayableSequenceID = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ExperienceID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.ExperienceID = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("PictureID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.PictureID = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("GalleryID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.GalleryID = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("AppGroupID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.AppGroupID = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("TextGroupID" == _currentElementName) {
                        
                        TextGroupIDListArray.append(NGETextGroupID(reader))
                        handledInChild = true
                        
                    } else if("URL" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.URL = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("AdID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.AdID = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ISRC" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.ISRC = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ProductID" == _currentElementName) {
                        
                        self.ProductID = NGEOtherIDType(reader)
                        handledInChild = true
                        
                    } else if("OtherID" == _currentElementName) {
                        
                        self.OtherID = NGEOtherIDType(reader)
                        handledInChild = true
                        
                    } else if("TimePeriod" == _currentElementName) {
                        
                        self.TimePeriod = NGEEventPeriodType(reader)
                        handledInChild = true
                        
                    } else if("Location" == _currentElementName) {
                        
                        self.Location = NGEEventLocationType(reader)
                        handledInChild = true
                        
                    } else if("People" == _currentElementName) {
                        
                        self.People = NGEBasicMetadataPeopleType(reader)
                        handledInChild = true
                        
                    } else if("UPC" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.UPC = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Offset" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Offset = numFormatter.number(from: String(cString: elementValue))!.intValue
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("TimecodeOffset" == _currentElementName) {
                        
                        self.TimecodeOffset = NGETimecodeType(reader)
                        handledInChild = true
                        
                    } else if("Initialization" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Initialization = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGETimedEventType: \(_currentElementName)")
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
        
        if(SubTypeListArray.count > 0) { self.SubTypeList = SubTypeListArray }
        
        if(TextGroupIDListArray.count > 0) { self.TextGroupIDList = TextGroupIDListArray }
        
    }
    
}

