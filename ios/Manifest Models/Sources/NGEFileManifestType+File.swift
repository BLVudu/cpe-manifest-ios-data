
import Foundation

extension NGEFileManifestType {
    class func NGEFileManifestTypeFromURL(url:NSURL) -> NGEFileManifestType? {
        let s = (url.absoluteString as NSString).UTF8String
        let reader = xmlReaderForFile( s, nil, 0/*options*/)
        
        if(reader != nil) {
            let ret = xmlTextReaderRead(reader)
            if(ret == 1/*XML_READER_TYPE_ELEMENT*/) {
                return NGEFileManifestType(reader: reader)
            }
            xmlFreeTextReader(reader)
        }
        
        return nil
    }
    
    class func NGEFileManifestTypeFromFile(path:String) -> NGEFileManifestType? {
        let url = NSURL(fileURLWithPath:path)
        return self.NGEFileManifestTypeFromURL(url)
    }
    
    class func NGEFileManifestTypeFromData(data:NSData) -> NGEFileManifestType? {
        let bytes = UnsafePointer<Int8>(data.bytes)
        let length = Int32(data.length)
        let reader = xmlReaderForMemory(bytes, length, nil, nil, 0/*options*/)
        
        if(reader != nil) {
            let ret = xmlTextReaderRead(reader)
            if(ret > 0) {
                return NGEFileManifestType(reader: reader)
            }
            xmlFreeTextReader(reader)
        }
        
        return nil
    }
}

