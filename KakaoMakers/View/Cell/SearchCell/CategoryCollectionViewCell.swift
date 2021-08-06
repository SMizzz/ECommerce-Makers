//
//  CategoryCollectionViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/06.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var categoryLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.layer.masksToBounds = true
    self.layer.cornerRadius = 15
    self.layer.borderWidth = 2
    self.layer.borderColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1).cgColor
  }
  
}
