
import Foundation

@objc
class NGEDigitalAssetAudioEncodingType : NSObject{
    
    var Codec: String!
    
    var CodecTypeList: [String]?
    
    var BitrateMax: Int?
    
    var BitrateAverage: Int?
    
    var VBR: String?
    
    var SampleRate: Int?
    
    var SampleBitDepth: Int?
    
    var ChannelMapping: String?
    
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
                    
                } else if("BitrateMax" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let BitrateMaxElementValue = xmlTextReaderConstValue(reader)
                    if BitrateMaxElementValue != nil {
                        
                        self.BitrateMax = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(BitrateMaxElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("BitrateAverage" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let BitrateAverageElementValue = xmlTextReaderConstValue(reader)
                    if BitrateAverageElementValue != nil {
                        
                        self.BitrateAverage = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(BitrateAverageElementValue))!)!.integerValue
                        
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
                    
                } else if("SampleRate" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SampleRateElementValue = xmlTextReaderConstValue(reader)
                    if SampleRateElementValue != nil {
                        
                        self.SampleRate = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(SampleRateElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("SampleBitDepth" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let SampleBitDepthElementValue = xmlTextReaderConstValue(reader)
                    if SampleBitDepthElementValue != nil {
                        
                        self.SampleBitDepth = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(SampleBitDepthElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("ChannelMapping" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ChannelMappingElementValue = xmlTextReaderConstValue(reader)
                    if ChannelMappingElementValue != nil {
                        
                        self.ChannelMapping = String.fromCString(UnsafePointer<CChar>(ChannelMappingElementValue))
                        
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
                    print("Ignoring unexpected in NGEDigitalAssetAudioEncodingType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
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
        
        if(self.BitrateMax != nil) {
            
            dict["BitrateMax"] = self.BitrateMax!
            
        }
        
        if(self.BitrateAverage != nil) {
            
            dict["BitrateAverage"] = self.BitrateAverage!
            
        }
        
        if(self.VBR != nil) {
            
            dict["VBR"] = self.VBR!
            
        }
        
        if(self.SampleRate != nil) {
            
            dict["SampleRate"] = self.SampleRate!
            
        }
        
        if(self.SampleBitDepth != nil) {
            
            dict["SampleBitDepth"] = self.SampleBitDepth!
            
        }
        
        if(self.ChannelMapping != nil) {
            
            dict["ChannelMapping"] = self.ChannelMapping!
            
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

