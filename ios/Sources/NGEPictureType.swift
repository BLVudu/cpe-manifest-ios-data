
import Foundation

@objc
class NGEPictureType : NSObject{
    
    var PictureID: String!
    
    var ImageID: String!
    
    var ThumbnailImageID: String?
    
    var LanguageInImageList: [String]?
    
    var AlternateTextList: [NGEAlternateText]?
    
    var CaptionList: [NGECaption]?
    
    var Sequence: Int?
    
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
        
        var LanguageInImageListArray = [String]()
        var AlternateTextListArray = [NGEAlternateText]()
        var CaptionListArray = [NGECaption]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("PictureID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PictureIDElementValue = xmlTextReaderConstValue(reader)
                    if PictureIDElementValue != nil {
                        
                        self.PictureID = String.fromCString(UnsafePointer<CChar>(PictureIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ImageID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ImageIDElementValue = xmlTextReaderConstValue(reader)
                    if ImageIDElementValue != nil {
                        
                        self.ImageID = String.fromCString(UnsafePointer<CChar>(ImageIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ThumbnailImageID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ThumbnailImageIDElementValue = xmlTextReaderConstValue(reader)
                    if ThumbnailImageIDElementValue != nil {
                        
                        self.ThumbnailImageID = String.fromCString(UnsafePointer<CChar>(ThumbnailImageIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("LanguageInImage" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let LanguageInImageElementValue = xmlTextReaderConstValue(reader)
                    if LanguageInImageElementValue != nil {
                        
                        LanguageInImageListArray.append(String.fromCString(UnsafePointer<CChar>(LanguageInImageElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("AlternateText" == _currentElementName) {
                    
                    AlternateTextListArray.append(NGEAlternateText(reader: reader))
                    handledInChild = true
                    
                } else if("Caption" == _currentElementName) {
                    
                    CaptionListArray.append(NGECaption(reader: reader))
                    handledInChild = true
                    
                } else if("Sequence" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SequenceElementValue = xmlTextReaderConstValue(reader)
                    if SequenceElementValue != nil {
                        
                        self.Sequence = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(SequenceElementValue))!)!.integerValue
                        
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
        
        if(LanguageInImageListArray.count > 0) { self.LanguageInImageList = LanguageInImageListArray }
        if(AlternateTextListArray.count > 0) { self.AlternateTextList = AlternateTextListArray }
        if(CaptionListArray.count > 0) { self.CaptionList = CaptionListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.PictureID != nil) {
            
            dict["PictureID"] = self.PictureID!
            
        }
        
        if(self.ImageID != nil) {
            
            dict["ImageID"] = self.ImageID!
            
        }
        
        if(self.ThumbnailImageID != nil) {
            
            dict["ThumbnailImageID"] = self.ThumbnailImageID!
            
        }
        
        if(self.LanguageInImageList != nil) {
            
            dict["LanguageInImageList"] = self.LanguageInImageList!
            
        }
        
        if(self.AlternateTextList != nil) {
            dict["AlternateTextList"] = self.AlternateTextList!.map({$0.dictionary})
        }
        
        if(self.CaptionList != nil) {
            dict["CaptionList"] = self.CaptionList!.map({$0.dictionary})
        }
        
        if(self.Sequence != nil) {
            
            dict["Sequence"] = self.Sequence!
            
        }
        
        return dict
    }*/
    
}

