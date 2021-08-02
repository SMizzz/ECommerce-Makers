//
//  ItemData.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/07/29.
//

import Foundation

struct HomeItem {
  let imageName: String
  let title: String
  let content: String
  let orderer: Int
  let lover: Int
}

struct OpenItem {
  let imageName: String
  let title: String
  let content: String
  let waiter: Int
}

struct TalkAlert {
  let imageName: String
  let title: String
  let waiter: Int
}

struct Like {
  let imageName: String
  let title: String
  let price: Int
  let dDayLabel: String
}
