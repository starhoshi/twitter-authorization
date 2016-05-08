//
//  KeychainManager.swift
//  twitter-authorization
//
//  Created by Kensuke Hoshikawa on 2016/05/08.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Foundation
import KeychainAccess

struct KeychainManager {
  private static let TOKEN = "TOKEN"
  private static let keychain = Keychain(service: "pi-chan")
  
  static func initialSettings(){
    if getToken() == nil {
      setToken("")
    }
  }
  static func clear() {
    setToken("")
  }
  
  static func getToken() -> String?{
    return keychain[TOKEN]
  }
  static func setToken(token:String){
    keychain[TOKEN] = token
  }
}