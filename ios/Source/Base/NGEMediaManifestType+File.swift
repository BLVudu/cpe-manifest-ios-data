import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

extension NGEMediaManifestType {
    class func NGEMediaManifestTypeFromURL(url:NSURL) -> NGEMediaManifestType? {
        let s = (url.absoluteString as NSString).UTF8String
        let reader = xmlReaderForFile( s, nil, 0/*options*/)
        
        if(reader != nil) {
            let ret = xmlTextReaderRead(reader)
            if(ret == 1/*XML_READER_TYPE_ELEMENT*/) {
                return NGEMediaManifestType(reader: reader)
            }
            xmlFreeTextReader(reader)
        }
        
        return nil
    }
    
    class func NGEMediaManifestTypeFromFile(path:String) -> NGEMediaManifestType? {
        let url = NSURL(fileURLWithPath:path)
        return self.NGEMediaManifestTypeFromURL(url)
    }
    
    class func NGEMediaManifestTypeFromData(data:NSData) -> NGEMediaManifestType? {
        let bytes = UnsafePointer<Int8>(data.bytes)
        let length = Int32(data.length)
        let reader = xmlReaderForMemory(bytes, length, nil, nil, 0/*options*/)
        
        if(reader != nil) {
            let ret = xmlTextReaderRead(reader)
            if(ret > 0) {
                return NGEMediaManifestType(reader: reader)
            }
            xmlFreeTextReader(reader)
        }
        
        return nil
    }
}

