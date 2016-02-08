
import Foundation

@objc
class NGEDigitalAssetVideoEncodingType : NSObject{
    
    var Codec: String?
    
    var CodecTypeList: [String]?
    
    var MPEGProfile: String?
    
    var MPEGLevel: String?
    
    var BitrateMax: Int?
    
    var BitRateAverage: Int?
    
    var VBR: String?
    
    var WatermarkList: [NGEDigitalAssetWatermarkType]?
    
    var ActualLength: String?
    
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
        
        var CodecTypeListArray = [String]()
        
        var WatermarkListArray = [NGEDigitalAssetWatermarkType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Codec" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let CodecElementValue = xmlTextReaderConstValue(reader)
                    if CodecElementValue != nil {
                        
                        self.Codec = String.fromCString(UnsafePointer<CChar>(CodecElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("CodecType" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let CodecTypeElementValue = xmlTextReaderConstValue(reader)
                    if CodecTypeElementValue != nil {
                        
                        CodecTypeListArray.append(String.fromCString(UnsafePointer<CChar>(CodecTypeElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("MPEGProfile" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let MPEGProfileElementValue = xmlTextReaderConstValue(reader)
                    if MPEGProfileElementValue != nil {
                        
                        self.MPEGProfile = String.fromCString(UnsafePointer<CChar>(MPEGProfileElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("MPEGLevel" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let MPEGLevelElementValue = xmlTextReaderConstValue(reader)
                    if MPEGLevelElementValue != nil {
                        
                        self.MPEGLevel = String.fromCString(UnsafePointer<CChar>(MPEGLevelElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("BitrateMax" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let BitrateMaxElementValue = xmlTextReaderConstValue(reader)
                    if BitrateMaxElementValue != nil {
                        
                        self.BitrateMax = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(BitrateMaxElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("BitRateAverage" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let BitRateAverageElementValue = xmlTextReaderConstValue(reader)
                    if BitRateAverageElementValue != nil {
                        
                        self.BitRateAverage = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(BitRateAverageElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("VBR" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let VBRElementValue = xmlTextReaderConstValue(reader)
                    if VBRElementValue != nil {
                        
                        self.VBR = String.fromCString(UnsafePointer<CChar>(VBRElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Watermark" == _currentElementName) {
                    
                    WatermarkListArray.append(NGEDigitalAssetWatermarkType(reader: reader))
                    handledInChild = true
                    
                } else if("ActualLength" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ActualLengthElementValue = xmlTextReaderConstValue(reader)
                    if ActualLengthElementValue != nil {
                        
                        self.ActualLength = String.fromCString(UnsafePointer<CChar>(ActualLengthElementValue))
                        
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
        
        if(CodecTypeListArray.count > 0) { self.CodecTypeList = CodecTypeListArray }
        
        if(WatermarkListArray.count > 0) { self.WatermarkList = WatermarkListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.Codec != nil) {
            
            dict["Codec"] = self.Codec!
            
        }
        
        if(self.CodecTypeList != nil) {
            
            dict["CodecTypeList"] = self.CodecTypeList!
            
        }
        
        if(self.MPEGProfile != nil) {
            
            dict["MPEGProfile"] = self.MPEGProfile!
            
        }
        
        if(self.MPEGLevel != nil) {
            
            dict["MPEGLevel"] = self.MPEGLevel!
            
        }
        
        if(self.BitrateMax != nil) {
            
            dict["BitrateMax"] = self.BitrateMax!
            
        }
        
        if(self.BitRateAverage != nil) {
            
            dict["BitRateAverage"] = self.BitRateAverage!
            
        }
        
        if(self.VBR != nil) {
            
            dict["VBR"] = self.VBR!
            
        }
        
        if(self.WatermarkList != nil) {
            dict["WatermarkList"] = self.WatermarkList!.map({$0.dictionary})
        }
        
        if(self.ActualLength != nil) {
            
            dict["ActualLength"] = self.ActualLength!
            
        }
        
        return dict
    }*/
    
}

