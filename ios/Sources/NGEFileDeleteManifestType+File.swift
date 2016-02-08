
import Foundation

extension NGEFileDeleteManifestType {
    class func NGEFileDeleteManifestTypeFromURL(url:NSURL) -> NGEFileDeleteManifestType? {
        let s = (url.absoluteString as NSString).UTF8String
        let reader = xmlReaderForFile( s, nil, 0/*options*/)
        
        if(reader != nil) {
            let ret = xmlTextReaderRead(reader)
            if(ret == 1/*XML_READER_TYPE_ELEMENT*/) {
                return NGEFileDeleteManifestType(reader: reader)
            }
            xmlFreeTextReader(reader)
        }
        
        return nil
    }
    
    class func NGEFileDeleteManifestTypeFromFile(path:String) -> NGEFileDeleteManifestType? {
        let url = NSURL(fileURLWithPath:path)
        return self.NGEFileDeleteManifestTypeFromURL(url)
    }
    
    class func NGEFileDeleteManifestTypeFromData(data:NSData) -> NGEFileDeleteManifestType? {
        let bytes = UnsafePointer<Int8>(data.bytes)
        let length = Int32(data.length)
        let reader = xmlReaderForMemory(bytes, length, nil, nil, 0/*options*/)
        
        if(reader != nil) {
            let ret = xmlTextReaderRead(reader)
            if(ret > 0) {
                return NGEFileDeleteManifestType(reader: reader)
            }
            xmlFreeTextReader(reader)
        }
        
        return nil
    }
}

