//
//  UIImageRemoteLoader.swift
//

import UIKit

public struct UIImageRemoteLoader {
    
    public static func loadImage(_ url: URL, completion: ((_ image: UIImage?) -> Void)?) -> URLSessionDataTask? {
        let request = URLRequest(url: url)
        let urlCache = URLCache(memoryCapacity: 0, diskCapacity: 1024 * 1024 * 512, diskPath: "com.wb.nextgen_image_cache") // 512Mb
        if let cachedResponse = urlCache.cachedResponse(for: request) , cachedResponse.data.count > 0 {
            if let completion = completion {
                completion(UIImage(data: cachedResponse.data, scale: UIScreen.main.scale))
            }
            
            return nil
        }
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.requestCachePolicy = NSURLRequest.CachePolicy.returnCacheDataElseLoad
        sessionConfiguration.urlCache = urlCache
        sessionConfiguration.timeoutIntervalForRequest = 10
        let task = URLSession(configuration: sessionConfiguration).dataTask(with: URLRequest(url: url), completionHandler: { (data, response, error) -> Void in
            if let completion = completion {
                completion((data != nil ? UIImage(data: data!, scale: UIScreen.main.scale) : nil))
            }
        }) 
        
        task.resume()
        return task
    }
    
}
