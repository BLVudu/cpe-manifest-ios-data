import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

extension NGEManifestAppDataSetType {
    class func NGEManifestAppDataSetTypeFromURL(url:NSURL) -> NGEManifestAppDataSetType? {
        if let s = (url.absoluteString as? NSString)?.utf8String {
            let reader = xmlReaderForFile( s, nil, 0/*options*/)
            
            if let reader = reader {
                let ret = xmlTextReaderRead(reader)
                if(ret == 1/*XML_READER_TYPE_ELEMENT*/) {
                    return NGEManifestAppDataSetType(reader)
                }
                xmlFreeTextReader(reader)
            }
        }
        
        return nil
    }
    
    class func NGEManifestAppDataSetTypeFromFile(path:String) -> NGEManifestAppDataSetType? {
        let url = NSURL(fileURLWithPath:path)
        return self.NGEManifestAppDataSetTypeFromURL(url: url)
    }
    
    class func NGEManifestAppDataSetTypeFromData(data:NSData) -> NGEManifestAppDataSetType? {
        if let bytes = data.bytes as? UnsafePointer<Int8> {
            let length = Int32(data.length)
            let reader = xmlReaderForMemory(bytes, length, nil, nil, 0/*options*/)
            
            if let reader = reader {
                let ret = xmlTextReaderRead(reader)
                if(ret > 0) {
                    return NGEManifestAppDataSetType(reader)
                }
                xmlFreeTextReader(reader)
            }
        }
        
        return nil
    }
}

