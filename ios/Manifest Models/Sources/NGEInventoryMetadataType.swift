
import Foundation

@objc
class NGEInventoryMetadataType : NSObject{
    
    var ContentID: String!
    
    var ContainerReferenceList: [NGEContainerReference]?
    
    var BasicMetadata: NGEBasicMetadataType?
    
    var AliasList: [NGEInventoryMetadataAliasType]?
    
    func readAttributes(reader: xmlTextReaderPtr) {
        
        let ContentIDAttrName = UnsafePointer<xmlChar>(NSString(stringLiteral: "ContentID").UTF8String)
        let ContentIDAttrValue = xmlTextReaderGetAttribute(reader, ContentIDAttrName)
        if(ContentIDAttrValue != nil) {
            
            self.ContentID = String.fromCString(UnsafePointer<CChar>(ContentIDAttrValue))
            xmlFree(ContentIDAttrValue)
        }
    }
    
    init(reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var ContainerReferenceListArray = [NGEContainerReference]()
        
        var AliasListArray = [NGEInventoryMetadataAliasType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader)
                let _currentElementName = String.fromCString(UnsafePointer<CChar>(_currentElementNameXmlChar))
                if("ContainerReference" == _currentElementName) {
                    
                    ContainerReferenceListArray.append(NGEContainerReference(reader: reader))
                    handledInChild = true
                    
                } else if("BasicMetadata" == _currentElementName) {
                    
                    self.BasicMetadata = NGEBasicMetadataType(reader: reader)
                    handledInChild = true
                    
                } else if("Alias" == _currentElementName) {
                    
                    AliasListArray.append(NGEInventoryMetadataAliasType(reader: reader))
                    handledInChild = true
                    
                } else   if(true) {
                    print("Ignoring unexpected in NGEInventoryMetadataType: \(_currentElementName)")
                    if superclass != NSObject.self {
                        break
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(ContainerReferenceListArray.count > 0) { self.ContainerReferenceList = ContainerReferenceListArray }
        
        if(AliasListArray.count > 0) { self.AliasList = AliasListArray }
    }
    
    /*var dictionary: [String: AnyObject] {
        var dict = [String: AnyObject]()
        
        if(self.ContentID != nil) {
            
            dict["ContentID"] = self.ContentID!
            
        }
        
        if(self.ContainerReferenceList != nil) {
            dict["ContainerReferenceList"] = self.ContainerReferenceList!.map({$0.dictionary})
        }
        
        if(self.BasicMetadata != nil) {
            dict["BasicMetadata"] = self.BasicMetadata!
        }
        
        if(self.AliasList != nil) {
            dict["AliasList"] = self.AliasList!.map({$0.dictionary})
        }
        
        return dict
    }*/
    
}

