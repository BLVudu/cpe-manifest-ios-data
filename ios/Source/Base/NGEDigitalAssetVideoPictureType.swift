import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEDigitalAssetVideoPictureType : NSObject{
    
    var AspectRatio: String?
    
    var PixelAspect: NGEStringVideoPicPixelAspectEnum?
    
    var WidthPixels: Int?
    
    var HeightPixels: Int?
    
    var ActiveWidthPixels: Int?
    
    var ActiveHeightPixels: Int?
    
    var FrameRate: NGEDigitalAssetVideoPictureFrameRateType?
    
    var Progressive: NGEDigitalAssetVideoPictureProgressiveType?
    
    var ColorSubsampling: String?
    
    var Colorimetry: String?
    
    var Type3D: String?
    
    var MasteredColorVolume: NGEDigitalAssetColorVolumeType?
    
    var ColorEncoding: NGEDigitalAssetColorEncodingType?
    
    var LightLevel: NGEDigitalAssetVideoPictureLightLevelType?
    
    var HDRPlaybackInfo: NGEDigitalAssetVideoPictureHDRPlaybackInfoType?
    
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
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("AspectRatio" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AspectRatioElementValue = xmlTextReaderConstValue(reader)
                    if AspectRatioElementValue != nil {
                        
                        self.AspectRatio = String.fromCString(UnsafePointer<CChar>(AspectRatioElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PixelAspect" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PixelAspectElementValue = xmlTextReaderConstValue(reader)
                    if PixelAspectElementValue != nil {
                        
                        self.PixelAspect = NGEStringVideoPicPixelAspectEnum.fromString(String.fromCString(UnsafePointer<CChar>(PixelAspectElementValue)))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("WidthPixels" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let WidthPixelsElementValue = xmlTextReaderConstValue(reader)
                    if WidthPixelsElementValue != nil {
                        
                        self.WidthPixels = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(WidthPixelsElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("HeightPixels" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let HeightPixelsElementValue = xmlTextReaderConstValue(reader)
                    if HeightPixelsElementValue != nil {
                        
                        self.HeightPixels = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(HeightPixelsElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ActiveWidthPixels" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ActiveWidthPixelsElementValue = xmlTextReaderConstValue(reader)
                    if ActiveWidthPixelsElementValue != nil {
                        
                        self.ActiveWidthPixels = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(ActiveWidthPixelsElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ActiveHeightPixels" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ActiveHeightPixelsElementValue = xmlTextReaderConstValue(reader)
                    if ActiveHeightPixelsElementValue != nil {
                        
                        self.ActiveHeightPixels = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(ActiveHeightPixelsElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("FrameRate" == _currentElementName) {
                    
                    self.FrameRate = NGEDigitalAssetVideoPictureFrameRateType(reader: reader)
                    handledInChild = true
                    
                } else if("Progressive" == _currentElementName) {
                    
                    self.Progressive = NGEDigitalAssetVideoPictureProgressiveType(reader: reader)
                    handledInChild = true
                    
                } else if("ColorSubsampling" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ColorSubsamplingElementValue = xmlTextReaderConstValue(reader)
                    if ColorSubsamplingElementValue != nil {
                        
                        self.ColorSubsampling = String.fromCString(UnsafePointer<CChar>(ColorSubsamplingElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Colorimetry" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ColorimetryElementValue = xmlTextReaderConstValue(reader)
                    if ColorimetryElementValue != nil {
                        
                        self.Colorimetry = String.fromCString(UnsafePointer<CChar>(ColorimetryElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Type3D" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let Type3DElementValue = xmlTextReaderConstValue(reader)
                    if Type3DElementValue != nil {
                        
                        self.Type3D = String.fromCString(UnsafePointer<CChar>(Type3DElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("MasteredColorVolume" == _currentElementName) {
                    
                    self.MasteredColorVolume = NGEDigitalAssetColorVolumeType(reader: reader)
                    handledInChild = true
                    
                } else if("ColorEncoding" == _currentElementName) {
                    
                    self.ColorEncoding = NGEDigitalAssetColorEncodingType(reader: reader)
                    handledInChild = true
                    
                } else if("LightLevel" == _currentElementName) {
                    
                    self.LightLevel = NGEDigitalAssetVideoPictureLightLevelType(reader: reader)
                    handledInChild = true
                    
                } else if("HDRPlaybackInfo" == _currentElementName) {
                    
                    self.HDRPlaybackInfo = NGEDigitalAssetVideoPictureHDRPlaybackInfoType(reader: reader)
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEDigitalAssetVideoPictureType: \(_currentElementName)")
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
        
        if(self.AspectRatio != nil) {
            
            dict["AspectRatio"] = self.AspectRatio!
            
        }
        
        if(self.PixelAspect != nil) {
            
            let obj = NGEStringVideoPicPixelAspectEnum.toString(PixelAspect!)
            dict["value"] = obj
            
        }
        
        if(self.WidthPixels != nil) {
            
            dict["WidthPixels"] = self.WidthPixels!
            
        }
        
        if(self.HeightPixels != nil) {
            
            dict["HeightPixels"] = self.HeightPixels!
            
        }
        
        if(self.ActiveWidthPixels != nil) {
            
            dict["ActiveWidthPixels"] = self.ActiveWidthPixels!
            
        }
        
        if(self.ActiveHeightPixels != nil) {
            
            dict["ActiveHeightPixels"] = self.ActiveHeightPixels!
            
        }
        
        if(self.FrameRate != nil) {
            dict["FrameRate"] = self.FrameRate!
        }
        
        if(self.Progressive != nil) {
            dict["Progressive"] = self.Progressive!
        }
        
        if(self.ColorSubsampling != nil) {
            
            dict["ColorSubsampling"] = self.ColorSubsampling!
            
        }
        
        if(self.Colorimetry != nil) {
            
            dict["Colorimetry"] = self.Colorimetry!
            
        }
        
        if(self.Type3D != nil) {
            
            dict["Type3D"] = self.Type3D!
            
        }
        
        if(self.MasteredColorVolume != nil) {
            dict["MasteredColorVolume"] = self.MasteredColorVolume!
        }
        
        if(self.ColorEncoding != nil) {
            dict["ColorEncoding"] = self.ColorEncoding!
        }
        
        if(self.LightLevel != nil) {
            dict["LightLevel"] = self.LightLevel!
        }
        
        if(self.HDRPlaybackInfo != nil) {
            dict["HDRPlaybackInfo"] = self.HDRPlaybackInfo!
        }
        
        return dict
    }*/
    
}

