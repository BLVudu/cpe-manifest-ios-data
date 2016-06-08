import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEFileManifestInfoType : NSObject{
    
    var PackageID: String!
    
    var PackageDateTime: NSDate!
    
    var Publisher: NGEOrgNameType!
    
    var AvailsEntryIDList: [String]?
    
    var TotalFilesInPackage: Int!
    
    var FileInfoList: [NGEFileInfoType]!
    
    var ExceptionFlag: Bool?
    
    var Comments: String?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let numFormatter = NSNumberFormatter()
        numFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        self.readAttributes(reader)
        
        var AvailsEntryIDListArray = [String]()
        
        var FileInfoListArray = [NGEFileInfoType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("PackageID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PackageIDElementValue = xmlTextReaderConstValue(reader)
                    if PackageIDElementValue != nil {
                        
                        self.PackageID = String.fromCString(UnsafePointer<CChar>(PackageIDElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("PackageDateTime" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let PackageDateTimeElementValue = xmlTextReaderConstValue(reader)
                    if PackageDateTimeElementValue != nil {
                        
                        self.PackageDateTime = dateFormatter.dateFromString(String.fromCString(UnsafePointer<CChar>(PackageDateTimeElementValue))!)
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Publisher" == _currentElementName) {
                    
                    self.Publisher = NGEOrgNameType(reader: reader)
                    handledInChild = true
                    
                } else if("AvailsEntryID" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let AvailsEntryIDElementValue = xmlTextReaderConstValue(reader)
                    if AvailsEntryIDElementValue != nil {
                        
                        AvailsEntryIDListArray.append(String.fromCString(UnsafePointer<CChar>(AvailsEntryIDElementValue))!)
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("TotalFilesInPackage" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let TotalFilesInPackageElementValue = xmlTextReaderConstValue(reader)
                    if TotalFilesInPackageElementValue != nil {
                        
                        self.TotalFilesInPackage = numFormatter.numberFromString(String.fromCString(UnsafePointer<CChar>(TotalFilesInPackageElementValue))!)!.integerValue
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("FileInfo" == _currentElementName) {
                    
                    FileInfoListArray.append(NGEFileInfoType(reader: reader))
                    handledInChild = true
                    
                } else if("ExceptionFlag" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let ExceptionFlagElementValue = xmlTextReaderConstValue(reader)
                    if ExceptionFlagElementValue != nil {
                        
                        self.ExceptionFlag = String.fromCString(UnsafePointer<CChar>(ExceptionFlagElementValue)) == "true"
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else if("Comments" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let CommentsElementValue = xmlTextReaderConstValue(reader)
                    if CommentsElementValue != nil {
                        
                        self.Comments = String.fromCString(UnsafePointer<CChar>(CommentsElementValue))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEFileManifestInfoType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(AvailsEntryIDListArray.count > 0) { self.AvailsEntryIDList = AvailsEntryIDListArray }
        
        if(FileInfoListArray.count > 0) { self.FileInfoList = FileInfoListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.PackageID != nil) {
            
            dict["PackageID"] = self.PackageID!
            
        }
        
        if(self.PackageDateTime != nil) {
            
            dict["PackageDateTime"] = self.PackageDateTime!
            
        }
        
        if(self.Publisher != nil) {
            dict["Publisher"] = self.Publisher!
        }
        
        if(self.AvailsEntryIDList != nil) {
            
            dict["AvailsEntryIDList"] = self.AvailsEntryIDList!
            
        }
        
        if(self.TotalFilesInPackage != nil) {
            
            dict["TotalFilesInPackage"] = self.TotalFilesInPackage!
            
        }
        
        if(self.FileInfoList != nil) {
            dict["FileInfoList"] = self.FileInfoList!.map({$0.dictionary})
        }
        
        if(self.ExceptionFlag != nil) {
            
            dict["ExceptionFlag"] = self.ExceptionFlag!
            
        }
        
        if(self.Comments != nil) {
            
            dict["Comments"] = self.Comments!
            
        }
        
        return dict
    }*/
    
}

