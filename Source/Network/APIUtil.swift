//
//  APIUtil.swift
//

import Foundation

public typealias APIUtilSuccessBlock = (_ result: NSDictionary) -> Void
public typealias APIUtilErrorBlock = (_ error: NSError?) -> Void

open class APIUtil: NSObject, URLSessionDataDelegate {
    
    var apiDomain: String!
    open var customHeaders = [String: String]()
    
    public init(apiDomain: String) {
        super.init()
        
        self.apiDomain = apiDomain
    }
    
    open func requestWithURLPath(_ urlPath: String) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: URL(string: apiDomain + urlPath)!)
        for (field, value) in customHeaders {
            request.addValue(value, forHTTPHeaderField: field)
        }
        
        return request
    }
    
    open func getJSONWithPath(_ urlPath: String, parameters: [String: String], successBlock: APIUtilSuccessBlock?, errorBlock: APIUtilErrorBlock?) -> URLSessionDataTask {
        return getJSONWithRequest(requestWithURLPath(urlPath + "?" + parameters.stringFromHTTPParameters()) as URLRequest, successBlock: successBlock, errorBlock: errorBlock)
    }
    
    fileprivate func getJSONWithRequest(_ request: URLRequest, successBlock: APIUtilSuccessBlock?, errorBlock: APIUtilErrorBlock?) -> URLSessionDataTask {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.requestCachePolicy = NSURLRequest.CachePolicy.returnCacheDataElseLoad
        sessionConfiguration.urlCache = URLCache(memoryCapacity: 0, diskCapacity: 1024 * 1024 * 64, diskPath: "com.wb.nextgen_api_cache") // 64Mb
        sessionConfiguration.timeoutIntervalForRequest = 60
        let task = URLSession(configuration: sessionConfiguration).dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if error == nil {
                if let data = data {
                    do {
                        if let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                            successBlock?(jsonDictionary)
                        } else if let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray {
                            successBlock?(["result": jsonArray])
                        }
                    } catch {
                        errorBlock?(nil)
                    }
                }
            } else {
                errorBlock?(error as NSError?)
            }
        }) 
        
        task.resume()
        return task
    }
    
}
