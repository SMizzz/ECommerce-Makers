//
//  HomeInquiryCollectionViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/05.
//

import UIKit

class HomeInquiryCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.layer.borderWidth = 1
    self.layer.borderColor = UIColor(
      red: 235/255,
      green: 235/255,
      blue: 235/255,
      alpha: 1).cgColor
  }
  
}
