
import Foundation

extension NGEPresentationType {
    class func NGEPresentationTypeFromURL(url:NSURL) -> NGEPresentationType? {
        let s = (url.absoluteString as NSString).UTF8String
        let reader = xmlReaderForFile( s, nil, 0/*options*/)
        
        if(reader != nil) {
            let ret = xmlTextReaderRead(reader)
            if(ret == 1/*XML_READER_TYPE_ELEMENT*/) {
                return NGEPresentationType(reader: reader)
            }
            xmlFreeTextReader(reader)
        }
        
        return nil
    }
    
    class func NGEPresentationTypeFromFile(path:String) -> NGEPresentationType? {
        let url = NSURL(fileURLWithPath:path)
        return self.NGEPresentationTypeFromURL(url)
    }
    
    class func NGEPresentationTypeFromData(data:NSData) -> NGEPresentationType? {
        let bytes = UnsafePointer<Int8>(data.bytes)
        let length = Int32(data.length)
        let reader = xmlReaderForMemory(bytes, length, nil, nil, 0/*options*/)
        
        if(reader != nil) {
            let ret = xmlTextReaderRead(reader)
            if(ret > 0) {
                return NGEPresentationType(reader: reader)
            }
            xmlFreeTextReader(reader)
        }
        
        return nil
    }
}

