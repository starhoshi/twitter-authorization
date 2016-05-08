//
//  MusicedApi.swift
//  twitter-authorization
//
//  Created by Kensuke Hoshikawa on 2016/05/08.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import APIKit
import Result
import Dollar

protocol MusicedApiRequestType: RequestType {
}

extension MusicedApiRequestType {
  var baseURL: NSURL {
    return NSURL(string: "http://localhost:3000")!
  }
}
