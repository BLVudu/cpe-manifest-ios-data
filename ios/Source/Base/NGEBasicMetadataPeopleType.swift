import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEBasicMetadataPeopleType : NSObject{
    
    var JobList: [NGEBasicMetadataJobType]!
    
    var Name: NGEPersonNameType!
    
    var IdentifierList: [NGEPersonIdentifierType]?
    
    var Gender: NGEGenderEnum?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var JobListArray = [NGEBasicMetadataJobType]()
        
        var IdentifierListArray = [NGEPersonIdentifierType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("Job" == _currentElementName) {
                    
                    JobListArray.append(NGEBasicMetadataJobType(reader: reader))
                    handledInChild = true
                    
                } else if("Name" == _currentElementName) {
                    
                    self.Name = NGEPersonNameType(reader: reader)
                    handledInChild = true
                    
                } else if("Identifier" == _currentElementName) {
                    
                    IdentifierListArray.append(NGEPersonIdentifierType(reader: reader))
                    handledInChild = true
                    
                } else if("Gender" == _currentElementName) {
                    
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    let GenderElementValue = xmlTextReaderConstValue(reader)
                    if GenderElementValue != nil {
                        
                        self.Gender = NGEGenderEnum.fromString(String.fromCString(UnsafePointer<CChar>(GenderElementValue)))
                        
                    }
                    _readerOk = xmlTextReaderRead(reader)
                    _currentNodeType = xmlTextReaderNodeType(reader)
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEBasicMetadataPeopleType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(JobListArray.count > 0) { self.JobList = JobListArray }
        
        if(IdentifierListArray.count > 0) { self.IdentifierList = IdentifierListArray }
        
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.JobList != nil) {
            dict["JobList"] = self.JobList!.map({$0.dictionary})
        }
        
        if(self.Name != nil) {
            dict["Name"] = self.Name!
        }
        
        if(self.IdentifierList != nil) {
            dict["IdentifierList"] = self.IdentifierList!.map({$0.dictionary})
        }
        
        if(self.Gender != nil) {
            
            let obj = NGEGenderEnum.toString(Gender!)
            dict["value"] = obj
            
        }
        
        return dict
    }*/
    
}

