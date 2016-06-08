import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEAppNVPairType : NSObject{
    
    var Name: String!
    
    var Text: String!
    
    var Integer: Int!
    
    var Decimal: Double!
    
    var Duration: String!
    
    var URL: String!
    
    var URLPostfix: String!
    
    var Language: String!
    
    var Time: NSDate!
    
    var YearDateTime: NSDate!
    
    var Money: NGEMoneyType!
    
    var base64Binary: String!
    
    var Location: NGEEventLocationType!
    
    var Timecode: NGETimecodeType!
    
    var Person: NGEBasicMetadataPeopleType!
    
    var TimePeriod: NGEEventPeriodType!
    
    var TimedEvent: NGETimedEventType!
    
    var PlayableSequenceID: String!
    
    var PresentationID: String!
    
    var ContentID: String!
    
    var PictureID: String!
    
    var TextGroupIDList: [NGETextGroupID]!
    
    var ALID: String!
    
    var EIDR: String!
    
    var OtherID: NGEOtherIDType!
    
    var ProductID: NGEOtherIDType!
    
    var AdID: String!
    
    var EANUPC: NGEEANUPC!
    
    var Gallery: NGEAppDataGalleryType!
    
    var LocationSet: NGEAppDataLocationType!
    
    var SelectTrack: NGEAppDataTrackSelectionType!
    
    var DataFeedSet: NGEAppDataFeedSetType!
    
    var TimedEventSequence: NGETimedEventSequenceType!
    
    var AcquireAsset: NGEAppDataAcquireAssetType!
    
    var KML: NGEAppDataKMLType!
    
    func readAttributes(reader: xmlTextReaderPtr) {
        let timeOnlyFormatter = NSDateFormatter()
        timeOnlyFormatter.dateFormat = "HH:mm:ss"
        timeOnlyFormatter.timeZone = NSTimeZone(name:"UTC")
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let decFormatter = NSNumberFormatter()
        decFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        decFormatter.decimalSeparator = "."
        let dateOnlyFormatter = NSDateFormatter()
        dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
        dateOnlyFormatter.timeZone = NSTimeZone(name:"UTC")
        
        let NameAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "Name").UTF8String)
        let NameAttrValue = xmlTextReaderGetAttribute(reader, NameAttrName)
        if(NameAttrValue != nil) {
            
            self.Name = String.fromCString(UnsafePointer<CChar>(NameAttrValue))
            xmlFree(NameAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let timeOnlyFormatter = NSDateFormatter()
        timeOnlyFormatter.dateFormat = "HH:mm:ss"
        timeOnlyFormatter.timeZone = NSTimeZone(name:"UTC")
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let decFormatter = NSNumberFormatter()
        decFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        decFormatter.decimalSeparator = "."
        let dateOnlyFormatter = NSDateFormatter()
        dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
        dateOnlyFormatter.timeZone = NSTimeZone(name:"UTC")
        
        self.readAttributes(reader)
        
        var TextGroupIDListArray = [NGETextGroupID]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Text" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TextElementValue = xmlTextReaderConstValue(reader)
                    if TextElementValue != nil {
                        
                        self.Text = String.fromCString(UnsafePointer<CChar>(TextElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Integer" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let IntegerElementValue = xmlTextReaderConstValue(reader)
                    if IntegerElementValue != nil {
                        
                        self.Integer = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(IntegerElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Decimal" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let DecimalElementValue = xmlTextReaderConstValue(reader)
                    if DecimalElementValue != nil {
                        
                        self.Decimal = decFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(DecimalElementValue))!)!.doubleValue
                        
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
                    
                } else if("URL" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let URLElementValue = xmlTextReaderConstValue(reader)
                    if URLElementValue != nil {
                        
                        self.URL = String.fromCString(UnsafePointer<CChar>(URLElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("URLPostfix" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let URLPostfixElementValue = xmlTextReaderConstValue(reader)
                    if URLPostfixElementValue != nil {
                        
                        self.URLPostfix = String.fromCString(UnsafePointer<CChar>(URLPostfixElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Language" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let LanguageElementValue = xmlTextReaderConstValue(reader)
                    if LanguageElementValue != nil {
                        
                        self.Language = String.fromCString(UnsafePointer<CChar>(LanguageElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Time" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TimeElementValue = xmlTextReaderConstValue(reader)
                    if TimeElementValue != nil {
                        
                        self.Time = timeOnlyFormatter.dateFromString(String.fromCString(UnsafePointer<CChar>(TimeElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("YearDateTime" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let YearDateTimeElementValue = xmlTextReaderConstValue(reader)
                    if YearDateTimeElementValue != nil {
                        
                        self.YearDateTime = dateOnlyFormatter.dateFromString(String.fromCString(UnsafePointer<CChar>(YearDateTimeElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Money" == _currentElementName) {
                    
                    self.Money = NGEMoneyType(reader: reader)
                    handledInChild = true
                    
                } else if("base64Binary" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let base64BinaryElementValue = xmlTextReaderConstValue(reader)
                    if base64BinaryElementValue != nil {
                        
                        self.base64Binary = String.fromCString(UnsafePointer<CChar>(base64BinaryElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Location" == _currentElementName) {
                    
                    self.Location = NGEEventLocationType(reader: reader)
                    handledInChild = true
                    
                } else if("Timecode" == _currentElementName) {
                    
                    self.Timecode = NGETimecodeType(reader: reader)
                    handledInChild = true
                    
                } else if("Person" == _currentElementName) {
                    
                    self.Person = NGEBasicMetadataPeopleType(reader: reader)
                    handledInChild = true
                    
                } else if("TimePeriod" == _currentElementName) {
                    
                    self.TimePeriod = NGEEventPeriodType(reader: reader)
                    handledInChild = true
                    
                } else if("TimedEvent" == _currentElementName) {
                    
                    self.TimedEvent = NGETimedEventType(reader: reader)
                    handledInChild = true
                    
                } else if("PlayableSequenceID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PlayableSequenceIDElementValue = xmlTextReaderConstValue(reader)
                    if PlayableSequenceIDElementValue != nil {
                        
                        self.PlayableSequenceID = String.fromCString(UnsafePointer<CChar>(PlayableSequenceIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PresentationID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PresentationIDElementValue = xmlTextReaderConstValue(reader)
                    if PresentationIDElementValue != nil {
                        
                        self.PresentationID = String.fromCString(UnsafePointer<CChar>(PresentationIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ContentID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ContentIDElementValue = xmlTextReaderConstValue(reader)
                    if ContentIDElementValue != nil {
                        
                        self.ContentID = String.fromCString(UnsafePointer<CChar>(ContentIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PictureID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PictureIDElementValue = xmlTextReaderConstValue(reader)
                    if PictureIDElementValue != nil {
                        
                        self.PictureID = String.fromCString(UnsafePointer<CChar>(PictureIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TextGroupID" == _currentElementName) {
                    
                    TextGroupIDListArray.append(NGETextGroupID(reader: reader))
                    handledInChild = true
                    
                } else if("ALID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ALIDElementValue = xmlTextReaderConstValue(reader)
                    if ALIDElementValue != nil {
                        
                        self.ALID = String.fromCString(UnsafePointer<CChar>(ALIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("EIDR" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let EIDRElementValue = xmlTextReaderConstValue(reader)
                    if EIDRElementValue != nil {
                        
                        self.EIDR = String.fromCString(UnsafePointer<CChar>(EIDRElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("OtherID" == _currentElementName) {
                    
                    self.OtherID = NGEOtherIDType(reader: reader)
                    handledInChild = true
                    
                } else if("ProductID" == _currentElementName) {
                    
                    self.ProductID = NGEOtherIDType(reader: reader)
                    handledInChild = true
                    
                } else if("AdID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AdIDElementValue = xmlTextReaderConstValue(reader)
                    if AdIDElementValue != nil {
                        
                        self.AdID = String.fromCString(UnsafePointer<CChar>(AdIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("EANUPC" == _currentElementName) {
                    
                    self.EANUPC = NGEEANUPC(reader: reader)
                    handledInChild = true
                    
                } else if("Gallery" == _currentElementName) {
                    
                    self.Gallery = NGEAppDataGalleryType(reader: reader)
                    handledInChild = true
                    
                } else if("LocationSet" == _currentElementName) {
                    
                    self.LocationSet = NGEAppDataLocationType(reader: reader)
                    handledInChild = true
                    
                } else if("SelectTrack" == _currentElementName) {
                    
                    self.SelectTrack = NGEAppDataTrackSelectionType(reader: reader)
                    handledInChild = true
                    
                } else if("DataFeedSet" == _currentElementName) {
                    
                    self.DataFeedSet = NGEAppDataFeedSetType(reader: reader)
                    handledInChild = true
                    
                } else if("TimedEventSequence" == _currentElementName) {
                    
                    self.TimedEventSequence = NGETimedEventSequenceType(reader: reader)
                    handledInChild = true
                    
                } else if("AcquireAsset" == _currentElementName) {
                    
                    self.AcquireAsset = NGEAppDataAcquireAssetType(reader: reader)
                    handledInChild = true
                    
                } else if("KML" == _currentElementName) {
                    
                    self.KML = NGEAppDataKMLType(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEAppNVPairType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(TextGroupIDListArray.count > 0) { self.TextGroupIDList = TextGroupIDListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Name != nil) {
            
            dict["Name"] = self.Name!
            
        }
        
        if(self.Text != nil) {
            
            dict["Text"] = self.Text!
            
        }
        
        if(self.Integer != nil) {
            
            dict["Integer"] = self.Integer!
            
        }
        
        if(self.Decimal != nil) {
            
            dict["Decimal"] = self.Decimal!
            
        }
        
        if(self.Duration != nil) {
            
            dict["Duration"] = self.Duration!
            
        }
        
        if(self.URL != nil) {
            
            dict["URL"] = self.URL!
            
        }
        
        if(self.URLPostfix != nil) {
            
            dict["URLPostfix"] = self.URLPostfix!
            
        }
        
        if(self.Language != nil) {
            
            dict["Language"] = self.Language!
            
        }
        
        if(self.Time != nil) {
            
            dict["Time"] = self.Time!
            
        }
        
        if(self.YearDateTime != nil) {
            
            dict["YearDateTime"] = self.YearDateTime!
            
        }
        
        if(self.Money != nil) {
            dict["Money"] = self.Money!
        }
        
        if(self.base64Binary != nil) {
            
            dict["base64Binary"] = self.base64Binary!
            
        }
        
        if(self.Location != nil) {
            dict["Location"] = self.Location!
        }
        
        if(self.Timecode != nil) {
            dict["Timecode"] = self.Timecode!
        }
        
        if(self.Person != nil) {
            dict["Person"] = self.Person!
        }
        
        if(self.TimePeriod != nil) {
            dict["TimePeriod"] = self.TimePeriod!
        }
        
        if(self.TimedEvent != nil) {
            dict["TimedEvent"] = self.TimedEvent!
        }
        
        if(self.PlayableSequenceID != nil) {
            
            dict["PlayableSequenceID"] = self.PlayableSequenceID!
            
        }
        
        if(self.PresentationID != nil) {
            
            dict["PresentationID"] = self.PresentationID!
            
        }
        
        if(self.ContentID != nil) {
            
            dict["ContentID"] = self.ContentID!
            
        }
        
        if(self.PictureID != nil) {
            
            dict["PictureID"] = self.PictureID!
            
        }
        
        if(self.TextGroupIDList != nil) {
            dict["TextGroupIDList"] = self.TextGroupIDList!.map({$0.dictionary})
        }
        
        if(self.ALID != nil) {
            
            dict["ALID"] = self.ALID!
            
        }
        
        if(self.EIDR != nil) {
            
            dict["EIDR"] = self.EIDR!
            
        }
        
        if(self.OtherID != nil) {
            dict["OtherID"] = self.OtherID!
        }
        
        if(self.ProductID != nil) {
            dict["ProductID"] = self.ProductID!
        }
        
        if(self.AdID != nil) {
            
            dict["AdID"] = self.AdID!
            
        }
        
        if(self.EANUPC != nil) {
            dict["EANUPC"] = self.EANUPC!
        }
        
        if(self.Gallery != nil) {
            dict["Gallery"] = self.Gallery!
        }
        
        if(self.LocationSet != nil) {
            dict["LocationSet"] = self.LocationSet!
        }
        
        if(self.SelectTrack != nil) {
            dict["SelectTrack"] = self.SelectTrack!
        }
        
        if(self.DataFeedSet != nil) {
            dict["DataFeedSet"] = self.DataFeedSet!
        }
        
        if(self.TimedEventSequence != nil) {
            dict["TimedEventSequence"] = self.TimedEventSequence!
        }
        
        if(self.AcquireAsset != nil) {
            dict["AcquireAsset"] = self.AcquireAsset!
        }
        
        if(self.KML != nil) {
            dict["KML"] = self.KML!
        }
        
        return dict
    }*/
    
}

