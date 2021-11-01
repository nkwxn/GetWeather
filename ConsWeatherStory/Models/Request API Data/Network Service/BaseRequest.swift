//
//  BaseRequest.swift
//  ConsWeatherStory
//
//  Created by Nicholas on 27/10/21.
//

import Foundation

class BaseRequest: NSObject {

    static func GET(
        url: String,
        completionHandler: @escaping (Any) -> Void
    ) {
        guard let safeUrl = URL(string: url) else { return }
        
        var request = URLRequest(url: safeUrl, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        
        //init session
        let session = URLSession.shared

        //init datatask dengan
        let dataTask = session.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error {
                print(error as Any)
            } else if let dataFromAPI = data {
                completionHandler(dataFromAPI)
            }
        }
        
        dataTask.resume()
    }
    
    static func GET(url: String,
                    header: [String: String],
                    showLoader: Bool,
                    completionHandler: @escaping (Any) -> Void) {
        if showLoader {
            // display loader
        }
        //init request
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        //configure request method dan set header
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = header

        //init session
        let session = URLSession.shared

        //init datatask dengan
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                if let dataFromAPI = data {
                    completionHandler(dataFromAPI)
                }
            }
        })

        dataTask.resume()
    }
    
    /*
    static func POST(url: String,
                     header: [String: String],
                     type: String,
                     status: String,
                     name: String,
                     showLoader: Bool,
                     successCompletion: @escaping (Any) -> Void,
                     failCompletion: @escaping (String) -> Void) {
        if showLoader {
            // display loader
        }
        
        //init request
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)

        let jsonString = """
            {"records":[{"fields": {"type": "\(type)","Status": "\(status)","Namee": "\(name)"}}]}
            """
        let jsonSessionData = jsonString.data(using: .utf8)!
        let jsonSession = try! JSONSerialization.jsonObject(with: jsonSessionData, options: .allowFragments)
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonSession)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = header
        request.httpBody = jsonData
        
        //init session
        let session = URLSession.shared

        //init datatask dengan
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
                failCompletion(error?.localizedDescription ?? "Error make a connection to server")
            } else {
                if let dataFromAPI = data {
                    successCompletion(dataFromAPI)
                }
            }
        })

        dataTask.resume()
        
    }
     */
    
}
