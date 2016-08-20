//
//  Client.swift
//  custos.ios
//
//  Created by Mik B. Shvets on 19.08.16.
//  Copyright © 2016 Michael Shvets. All rights reserved.
//

import Foundation

@objc public class Custos: NSObject {
  var API_KEY: String
  var API_DOMAIN: String
  
  public init (API_KEY: String) {
    self.API_KEY = API_KEY
    self.API_DOMAIN = "https://api.custos.cloud"
    print(self.API_KEY)
  }
  
  
  public func remove(sessionId: String) {
    
    let API_ENDPOINT = self.API_DOMAIN + "/mapper/remove"
    let url = NSURL(string: API_ENDPOINT)
    let session = NSURLSession.sharedSession()
    let mutableRequest = NSMutableURLRequest(URL: url!)
    mutableRequest.setValue("application/json", forHTTPHeaderField: "Accept")
    mutableRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    mutableRequest.setValue(self.API_KEY, forHTTPHeaderField: "x-api-key")
    mutableRequest.HTTPMethod = "POST"
    let params:[String: AnyObject] = [
      "id" : sessionId
    ]
    //    print(params)
    mutableRequest.HTTPBody = try? NSJSONSerialization.dataWithJSONObject(params, options: NSJSONWritingOptions())
    
    let task = session.dataTaskWithRequest(mutableRequest, completionHandler: { (data, response, error) -> Void in
      
      _ = try? NSJSONSerialization.JSONObjectWithData(data!,options: NSJSONReadingOptions.MutableContainers);
      //      print(jsonResults);
      
    })
    task.resume()
  }
  
  
  public func add(sessionId: String) {
    let API_ENDPOINT = self.API_DOMAIN + "/mapper/add"
    let url = NSURL(string: API_ENDPOINT)
    let session = NSURLSession.sharedSession()
    let mutableRequest = NSMutableURLRequest(URL: url!)
    mutableRequest.setValue("application/json", forHTTPHeaderField: "Accept")
    mutableRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    mutableRequest.setValue(self.API_KEY, forHTTPHeaderField: "x-api-key")
    mutableRequest.HTTPMethod = "POST"
    let params:[String: AnyObject] = [
      "id" : sessionId
    ]
    mutableRequest.HTTPBody = try? NSJSONSerialization.dataWithJSONObject(params, options: NSJSONWritingOptions())
    
    let task = session.dataTaskWithRequest(mutableRequest, completionHandler: { (data, response, error) -> Void in
      
      _ = try? NSJSONSerialization.JSONObjectWithData(data!,options: NSJSONReadingOptions.MutableContainers);
      
    })
    task.resume()
  }
}
