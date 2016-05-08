//
//  GET_Songs.swift
//  twitter-authorization
//
//  Created by Kensuke Hoshikawa on 2016/05/08.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import APIKit
import Himotoki

struct GetSongsRequest: MusicedApiRequestType {
  typealias Response = String
  let token:String?
  
  init(token:String?) {
    self.token = token
  }
  
  var method: HTTPMethod {
    return .GET
  }
  
  var HTTPHeaderFields:[String:String] {
    if let token = token {
      return ["Authorization": "Bearer \(token)"]
    }
    return ["Authorization": "Bearer invalid_token"]
  }
  
  var path: String {
    return "songs.json"
  }
  
  func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Response? {
    print(object)
    //    print(URLResponse)
    return "print"
  }
}