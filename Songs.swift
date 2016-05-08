//
//  Songs.swift
//  twitter-authorization
//
//  Created by Kensuke Hoshikawa on 2016/05/08.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import Himotoki

struct Songs{
  let title: String
  let artist: String?
  let album: String?
}

extension Songs: Decodable {
  static func decode(e: Extractor) throws -> Songs {
    
    return try Songs(
      title: e <| "title",
      artist: e <|? "artist",
      album: e <|? "album"
    )
  }
}
