
import Foundation

@objc
class NGETimedEventType : NSObject{
    
    var StartTimecode: NGETimecodeType?
    
    var EndTimecode: NGETimecodeType?
    
    var Type: String?
    
    var SubTypeList: [String]?
    
    var PresentationID: NSURL?
    
    var PlayableSequenceID: NSURL?
    
    var ExperienceID: NSURL?
    
    var PictureID: NSURL?
    
    var GalleryID: NSURL?
    
    var AppGroupID: NSURL?
    
    var TextGroupID: NGETextGroupID?
    
    var URL: NSURL?
    
    var AdID: String?
    
    var ISRC: String?
    
    var ProductID: NGEOtherIDType?
    
    var OtherID: NGEOtherIDType?
    
    var TimePeriod: NGEEventPeriodType?
    
    var Location: NGEEventLocationType?
    
    var Offset: Int?
    
    var TimecodeOffset: NGETimecodeType?
    
    var Initialization: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        self.readAttributes(reader)
        
        var SubTypeListArray = [String]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("StartTimecode" == _currentElementName) {
                    
                    self.StartTimecode = NGETimecodeType(reader: reader)
                    handledInChild = true
                    
                } else if("EndTimecode" == _currentElementName) {
                    
                    self.EndTimecode = NGETimecodeType(reader: reader)
                    handledInChild = true
                    
                } else if("Type" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TypeElementValue = xmlTextReaderConstValue(reader)
                    if TypeElementValue != nil {
                        
                        self.Type = String.fromCString(UnsafePointer<CChar>(TypeElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SubType" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SubTypeElementValue = xmlTextReaderConstValue(reader)
                    if SubTypeElementValue != nil {
                        
                        SubTypeListArray.append(String.fromCString(UnsafePointer<CChar>(SubTypeElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PresentationID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PresentationIDElementValue = xmlTextReaderConstValue(reader)
                    if PresentationIDElementValue != nil {
                        
                        self.PresentationID = NSURL(string: String.fromCString(UnsafePointer<CChar>(PresentationIDElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PlayableSequenceID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PlayableSequenceIDElementValue = xmlTextReaderConstValue(reader)
                    if PlayableSequenceIDElementValue != nil {
                        
                        self.PlayableSequenceID = NSURL(string: String.fromCString(UnsafePointer<CChar>(PlayableSequenceIDElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ExperienceID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ExperienceIDElementValue = xmlTextReaderConstValue(reader)
                    if ExperienceIDElementValue != nil {
                        
                        self.ExperienceID = NSURL(string: String.fromCString(UnsafePointer<CChar>(ExperienceIDElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PictureID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PictureIDElementValue = xmlTextReaderConstValue(reader)
                    if PictureIDElementValue != nil {
                        
                        self.PictureID = NSURL(string: String.fromCString(UnsafePointer<CChar>(PictureIDElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("GalleryID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let GalleryIDElementValue = xmlTextReaderConstValue(reader)
                    if GalleryIDElementValue != nil {
                        
                        self.GalleryID = NSURL(string: String.fromCString(UnsafePointer<CChar>(GalleryIDElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("AppGroupID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AppGroupIDElementValue = xmlTextReaderConstValue(reader)
                    if AppGroupIDElementValue != nil {
                        
                        self.AppGroupID = NSURL(string: String.fromCString(UnsafePointer<CChar>(AppGroupIDElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TextGroupID" == _currentElementName) {
                    
                    self.TextGroupID = NGETextGroupID(reader: reader)
                    handledInChild = true
                    
                } else if("URL" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let URLElementValue = xmlTextReaderConstValue(reader)
                    if URLElementValue != nil {
                        
                        self.URL = NSURL(string: String.fromCString(UnsafePointer<CChar>(URLElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("AdID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AdIDElementValue = xmlTextReaderConstValue(reader)
                    if AdIDElementValue != nil {
                        
                        self.AdID = String.fromCString(UnsafePointer<CChar>(AdIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ISRC" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ISRCElementValue = xmlTextReaderConstValue(reader)
                    if ISRCElementValue != nil {
                        
                        self.ISRC = String.fromCString(UnsafePointer<CChar>(ISRCElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ProductID" == _currentElementName) {
                    
                    self.ProductID = NGEOtherIDType(reader: reader)
                    handledInChild = true
                    
                } else if("OtherID" == _currentElementName) {
                    
                    self.OtherID = NGEOtherIDType(reader: reader)
                    handledInChild = true
                    
                } else if("TimePeriod" == _currentElementName) {
                    
                    self.TimePeriod = NGEEventPeriodType(reader: reader)
                    handledInChild = true
                    
                } else if("Location" == _currentElementName) {
                    
                    self.Location = NGEEventLocationType(reader: reader)
                    handledInChild = true
                    
                } else if("Offset" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let OffsetElementValue = xmlTextReaderConstValue(reader)
                    if OffsetElementValue != nil {
                        
                        self.Offset = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(OffsetElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TimecodeOffset" == _currentElementName) {
                    
                    self.TimecodeOffset = NGETimecodeType(reader: reader)
                    handledInChild = true
                    
                } else if("Initialization" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let InitializationElementValue = xmlTextReaderConstValue(reader)
                    if InitializationElementValue != nil {
                        
                        self.Initialization = String.fromCString(UnsafePointer<CChar>(InitializationElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected: \(_currentElementName)")
                    //break
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(SubTypeListArray.count > 0) { self.SubTypeList = SubTypeListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.StartTimecode != nil) {
            dict["StartTimecode"] = self.StartTimecode!
        }
        
        if(self.EndTimecode != nil) {
            dict["EndTimecode"] = self.EndTimecode!
        }
        
        if(self.Type != nil) {
            
            dict["Type"] = self.Type!
            
        }
        
        if(self.SubTypeList != nil) {
            
            dict["SubTypeList"] = self.SubTypeList!
            
        }
        
        if(self.PresentationID != nil) {
            
            dict["PresentationID"] = self.PresentationID!
            
        }
        
        if(self.PlayableSequenceID != nil) {
            
            dict["PlayableSequenceID"] = self.PlayableSequenceID!
            
        }
        
        if(self.ExperienceID != nil) {
            
            dict["ExperienceID"] = self.ExperienceID!
            
        }
        
        if(self.PictureID != nil) {
            
            dict["PictureID"] = self.PictureID!
            
        }
        
        if(self.GalleryID != nil) {
            
            dict["GalleryID"] = self.GalleryID!
            
        }
        
        if(self.AppGroupID != nil) {
            
            dict["AppGroupID"] = self.AppGroupID!
            
        }
        
        if(self.TextGroupID != nil) {
            dict["TextGroupID"] = self.TextGroupID!
        }
        
        if(self.URL != nil) {
            
            dict["URL"] = self.URL!
            
        }
        
        if(self.AdID != nil) {
            
            dict["AdID"] = self.AdID!
            
        }
        
        if(self.ISRC != nil) {
            
            dict["ISRC"] = self.ISRC!
            
        }
        
        if(self.ProductID != nil) {
            dict["ProductID"] = self.ProductID!
        }
        
        if(self.OtherID != nil) {
            dict["OtherID"] = self.OtherID!
        }
        
        if(self.TimePeriod != nil) {
            dict["TimePeriod"] = self.TimePeriod!
        }
        
        if(self.Location != nil) {
            dict["Location"] = self.Location!
        }
        
        if(self.Offset != nil) {
            
            dict["Offset"] = self.Offset!
            
        }
        
        if(self.TimecodeOffset != nil) {
            dict["TimecodeOffset"] = self.TimecodeOffset!
        }
        
        if(self.Initialization != nil) {
            
            dict["Initialization"] = self.Initialization!
            
        }
        
        return dict
    }*/
    
}

