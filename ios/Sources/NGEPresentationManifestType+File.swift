
import Foundation

extension NGEPresentationManifestType {
    class func NGEPresentationManifestTypeFromURL(url:NSURL) -> NGEPresentationManifestType? {
        let s = (url.absoluteString as NSString).UTF8String
        let reader = xmlReaderForFile( s, nil, 0/*options*/)
        
        if(reader != nil) {
            let ret = xmlTextReaderRead(reader)
            if(ret == 1/*XML_READER_TYPE_ELEMENT*/) {
                return NGEPresentationManifestType(reader: reader)
            }
            xmlFreeTextReader(reader)
        }
        
        return nil
    }
    
    class func NGEPresentationManifestTypeFromFile(path:String) -> NGEPresentationManifestType? {
        let url = NSURL(fileURLWithPath:path)
        return self.NGEPresentationManifestTypeFromURL(url)
    }
    
    class func NGEPresentationManifestTypeFromData(data:NSData) -> NGEPresentationManifestType? {
        let bytes = UnsafePointer<Int8>(data.bytes)
        let length = Int32(data.length)
        let reader = xmlReaderForMemory(bytes, length, nil, nil, 0/*options*/)
        
        if(reader != nil) {
            let ret = xmlTextReaderRead(reader)
            if(ret > 0) {
                return NGEPresentationManifestType(reader: reader)
            }
            xmlFreeTextReader(reader)
        }
        
        return nil
    }
}

