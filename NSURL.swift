//
//  NSURL.swift
//  twitter-authorization
//
//  Created by Kensuke Hoshikawa on 2016/05/08.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation

extension NSURL {
  var queryItems: [String: String]? {
    var params = [String: String]()
    return NSURLComponents(URL: self, resolvingAgainstBaseURL: false)?
      .queryItems?
      .reduce([:], combine: { (_, item) -> [String: String] in
        params[item.name] = item.value
        return params
      })
  }
}