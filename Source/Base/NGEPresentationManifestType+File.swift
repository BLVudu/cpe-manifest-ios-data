import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

extension NGEPresentationManifestType {
    class func NGEPresentationManifestTypeFromURL(url:NSURL) -> NGEPresentationManifestType? {
        if let s = (url.absoluteString as? NSString)?.utf8String {
            let reader = xmlReaderForFile( s, nil, 0/*options*/)
            
            if let reader = reader {
                let ret = xmlTextReaderRead(reader)
                if(ret == 1/*XML_READER_TYPE_ELEMENT*/) {
                    return NGEPresentationManifestType(reader)
                }
                xmlFreeTextReader(reader)
            }
        }
        
        return nil
    }
    
    class func NGEPresentationManifestTypeFromFile(path:String) -> NGEPresentationManifestType? {
        let url = NSURL(fileURLWithPath:path)
        return self.NGEPresentationManifestTypeFromURL(url: url)
    }
    
    class func NGEPresentationManifestTypeFromData(data:NSData) -> NGEPresentationManifestType? {
        if let bytes = data.bytes as? UnsafePointer<Int8> {
            let length = Int32(data.length)
            let reader = xmlReaderForMemory(bytes, length, nil, nil, 0/*options*/)
            
            if let reader = reader {
                let ret = xmlTextReaderRead(reader)
                if(ret > 0) {
                    return NGEPresentationManifestType(reader)
                }
                xmlFreeTextReader(reader)
            }
        }
        
        return nil
    }
}

