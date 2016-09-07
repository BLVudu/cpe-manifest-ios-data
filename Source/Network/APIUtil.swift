//
//  APIUtil.swift
//

import Foundation

public typealias APIUtilSuccessBlock = (result: NSDictionary) -> Void
public typealias APIUtilErrorBlock = (error: NSError?) -> Void

public class APIUtil: NSObject, NSURLSessionDataDelegate {
    
    var apiDomain: String!
    public var customHeaders = [String: String]()
    
    public init(apiDomain: String) {
        super.init()
        
        self.apiDomain = apiDomain
    }
    
    public func requestWithURLPath(urlPath: String) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(URL: NSURL(string: apiDomain + urlPath)!)
        for (field, value) in customHeaders {
            request.addValue(value, forHTTPHeaderField: field)
        }
        
        return request
    }
    
    public func getJSONWithPath(urlPath: String, parameters: [String: String], successBlock: APIUtilSuccessBlock?, errorBlock: APIUtilErrorBlock?) -> NSURLSessionDataTask {
        return getJSONWithRequest(requestWithURLPath(urlPath + "?" + parameters.stringFromHTTPParameters()), successBlock: successBlock, errorBlock: errorBlock)
    }
    
    private func getJSONWithRequest(request: NSURLRequest, successBlock: APIUtilSuccessBlock?, errorBlock: APIUtilErrorBlock?) -> NSURLSessionDataTask {
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfiguration.requestCachePolicy = NSURLRequestCachePolicy.ReturnCacheDataElseLoad
        sessionConfiguration.URLCache = NSURLCache(memoryCapacity: 0, diskCapacity: 1024 * 1024 * 64, diskPath: "com.wb.nextgen_api_cache") // 64Mb
        sessionConfiguration.timeoutIntervalForRequest = 60
        let task = NSURLSession(configuration: sessionConfiguration).dataTaskWithRequest(request) { (data, response, error) -> Void in
            if error == nil {
                if let data = data {
                    do {
                        if let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                            successBlock?(result: jsonDictionary)
                        } else if let jsonArray = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? NSArray {
                            successBlock?(result: ["result": jsonArray])
                        }
                    } catch {
                        errorBlock?(error: nil)
                    }
                }
            } else {
                errorBlock?(error: error)
            }
        }
        
        task.resume()
        return task
    }
    
}