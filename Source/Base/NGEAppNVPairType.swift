import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEAppNVPairType : NSObject{
    
    var `Name`: String!
    
    var `Text`: String!
    
    var `Integer`: Int!
    
    var `Decimal`: Double!
    
    var `Duration`: String!
    
    var `URL`: String!
    
    var `URLPostfix`: String!
    
    var `Language`: String!
    
    var `Time`: Date!
    
    var `YearDateTime`: Date!
    
    var `Money`: NGEMoneyType!
    
    var `base64Binary`: String!
    
    var `Location`: NGEEventLocationType!
    
    var `Timecode`: NGETimecodeType!
    
    var `Person`: NGEBasicMetadataPeopleType!
    
    var `TimePeriod`: NGEEventPeriodType!
    
    var `TimedEvent`: NGETimedEventType!
    
    var `ExperienceID`: String!
    
    var `PlayableSequenceID`: String!
    
    var `PresentationID`: String!
    
    var `ContentID`: String!
    
    var `PictureID`: String!
    
    var `TextGroupIDList`: [NGETextGroupID]!
    
    var `ALID`: String!
    
    var `EIDR`: String!
    
    var `OtherID`: NGEOtherIDType!
    
    var `ProductID`: NGEOtherIDType!
    
    var `AdID`: String!
    
    var `EANUPC`: NGEEANUPC!
    
    var `Gallery`: NGEAppDataGalleryType!
    
    var `LocationSet`: NGEAppDataLocationType!
    
    var `SelectTrack`: NGEAppDataTrackSelectionType!
    
    var `DataFeedSet`: NGEAppDataFeedSetType!
    
    var `TimedEventSequence`: NGETimedEventSequenceType!
    
    var `AcquireAsset`: NGEAppDataAcquireAssetType!
    
    var `KML`: NGEAppDataKMLType!
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        let decFormatter = NumberFormatter()
        decFormatter.numberStyle = .decimal
        decFormatter.decimalSeparator = "."
        let dateOnlyFormatter = DateFormatter()
        dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
        dateOnlyFormatter.timeZone = TimeZone(abbreviation:"UTC")
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        let timeOnlyFormatter = DateFormatter()
        timeOnlyFormatter.dateFormat = "HH:mm:ss"
        timeOnlyFormatter.timeZone = TimeZone(abbreviation:"UTC")
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "Name") {
            
            self.Name = String(cString: attrValue)
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let decFormatter = NumberFormatter()
        decFormatter.numberStyle = .decimal
        decFormatter.decimalSeparator = "."
        let dateOnlyFormatter = DateFormatter()
        dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
        dateOnlyFormatter.timeZone = TimeZone(abbreviation:"UTC")
        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        
        let timeOnlyFormatter = DateFormatter()
        timeOnlyFormatter.dateFormat = "HH:mm:ss"
        timeOnlyFormatter.timeZone = TimeZone(abbreviation:"UTC")
        
        self.readAttributes(reader)
        
        var TextGroupIDListArray = [NGETextGroupID]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("Text" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Text = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Integer" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Integer = numFormatter.number(from: String(cString: elementValue))!.intValue
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Decimal" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Decimal = decFormatter.number(from: String(cString: elementValue))!.doubleValue
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Duration" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Duration = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("URL" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.URL = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("URLPostfix" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.URLPostfix = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Language" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Language = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Time" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.Time = timeOnlyFormatter.date(from: String(cString: elementValue))
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("YearDateTime" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.YearDateTime = dateOnlyFormatter.date(from: String(cString: elementValue))
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Money" == _currentElementName) {
                        
                        self.Money = NGEMoneyType(reader)
                        handledInChild = true
                        
                    } else if("base64Binary" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.base64Binary = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("Location" == _currentElementName) {
                        
                        self.Location = NGEEventLocationType(reader)
                        handledInChild = true
                        
                    } else if("Timecode" == _currentElementName) {
                        
                        self.Timecode = NGETimecodeType(reader)
                        handledInChild = true
                        
                    } else if("Person" == _currentElementName) {
                        
                        self.Person = NGEBasicMetadataPeopleType(reader)
                        handledInChild = true
                        
                    } else if("TimePeriod" == _currentElementName) {
                        
                        self.TimePeriod = NGEEventPeriodType(reader)
                        handledInChild = true
                        
                    } else if("TimedEvent" == _currentElementName) {
                        
                        self.TimedEvent = NGETimedEventType(reader)
                        handledInChild = true
                        
                    } else if("ExperienceID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.ExperienceID = String(cString: elementValue)
                            
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
                        
                    } else if("PresentationID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.PresentationID = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("ContentID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.ContentID = String(cString: elementValue)
                            
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
                        
                    } else if("TextGroupID" == _currentElementName) {
                        
                        TextGroupIDListArray.append(NGETextGroupID(reader))
                        handledInChild = true
                        
                    } else if("ALID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.ALID = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("EIDR" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.EIDR = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("OtherID" == _currentElementName) {
                        
                        self.OtherID = NGEOtherIDType(reader)
                        handledInChild = true
                        
                    } else if("ProductID" == _currentElementName) {
                        
                        self.ProductID = NGEOtherIDType(reader)
                        handledInChild = true
                        
                    } else if("AdID" == _currentElementName) {
                        
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        if let elementValue = xmlTextReaderConstValue(reader) {
                            
                            self.AdID = String(cString: elementValue)
                            
                        }
                        _readerOk = xmlTextReaderRead(reader)
                        _currentNodeType = xmlTextReaderNodeType(reader)
                        
                    } else if("EANUPC" == _currentElementName) {
                        
                        self.EANUPC = NGEEANUPC(reader)
                        handledInChild = true
                        
                    } else if("Gallery" == _currentElementName) {
                        
                        self.Gallery = NGEAppDataGalleryType(reader)
                        handledInChild = true
                        
                    } else if("LocationSet" == _currentElementName) {
                        
                        self.LocationSet = NGEAppDataLocationType(reader)
                        handledInChild = true
                        
                    } else if("SelectTrack" == _currentElementName) {
                        
                        self.SelectTrack = NGEAppDataTrackSelectionType(reader)
                        handledInChild = true
                        
                    } else if("DataFeedSet" == _currentElementName) {
                        
                        self.DataFeedSet = NGEAppDataFeedSetType(reader)
                        handledInChild = true
                        
                    } else if("TimedEventSequence" == _currentElementName) {
                        
                        self.TimedEventSequence = NGETimedEventSequenceType(reader)
                        handledInChild = true
                        
                    } else if("AcquireAsset" == _currentElementName) {
                        
                        self.AcquireAsset = NGEAppDataAcquireAssetType(reader)
                        handledInChild = true
                        
                    } else if("KML" == _currentElementName) {
                        
                        self.KML = NGEAppDataKMLType(reader)
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEAppNVPairType: \(_currentElementName)")
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
        
        if(TextGroupIDListArray.count > 0) { self.TextGroupIDList = TextGroupIDListArray }
        
    }
    
}

