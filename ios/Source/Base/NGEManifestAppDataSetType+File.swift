
import Foundation

extension NGEManifestAppDataSetType {
    class func NGEManifestAppDataSetTypeFromURL(url:NSURL) -> NGEManifestAppDataSetType? {
        let s = (url.absoluteString as NSString).UTF8String
        let reader = xmlReaderForFile( s, nil, 0/*options*/)
        
        if(reader != nil) {
            let ret = xmlTextReaderRead(reader)
            if(ret == 1/*XML_READER_TYPE_ELEMENT*/) {
                return NGEManifestAppDataSetType(reader: reader)
            }
            xmlFreeTextReader(reader)
        }
        
        return nil
    }
    
    class func NGEManifestAppDataSetTypeFromFile(path:String) -> NGEManifestAppDataSetType? {
        let url = NSURL(fileURLWithPath:path)
        return self.NGEManifestAppDataSetTypeFromURL(url)
    }
    
    class func NGEManifestAppDataSetTypeFromData(data:NSData) -> NGEManifestAppDataSetType? {
        let bytes = UnsafePointer<Int8>(data.bytes)
        let length = Int32(data.length)
        let reader = xmlReaderForMemory(bytes, length, nil, nil, 0/*options*/)
        
        if(reader != nil) {
            let ret = xmlTextReaderRead(reader)
            if(ret > 0) {
                return NGEManifestAppDataSetType(reader: reader)
            }
            xmlFreeTextReader(reader)
        }
        
        return nil
    }
}

