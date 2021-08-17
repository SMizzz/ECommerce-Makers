//
//  Reviews.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/16.
//

import Foundation

struct Review: Codable {
  var reviewId: String
  var name: String
  var rating: Float
  var comment: String
  var userId: String
  var createdAt: String
  var updatedAt: String
  
  enum CodingKeys: String, CodingKey {
    case reviewId = "_id"
    case name
    case rating
    case comment
    case userId = "user"
    case createdAt
    case updatedAt
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    reviewId = try values.decode(String.self, forKey: .reviewId)
    name = try values.decode(String.self, forKey: .name)
    rating = try values.decode(Float.self, forKey: .rating)
    comment = try values.decode(String.self, forKey: .comment)
    userId = try values.decode(String.self, forKey: .userId)
    createdAt = try values.decode(String.self, forKey: .createdAt)
    updatedAt = try values.decode(String.self, forKey: .updatedAt)
  }
}
