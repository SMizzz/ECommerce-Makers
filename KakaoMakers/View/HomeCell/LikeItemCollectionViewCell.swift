//
//  LikeItemCollectionViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/02.
//

import UIKit

class LikeItemCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var loveButton: UIButton!
  @IBOutlet weak var productName: UILabel!
  @IBOutlet weak var productPriceLabel: UILabel!
  @IBOutlet weak var dDayOrderLabel: UILabel!
  @IBOutlet weak var orderButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureOrderButton()
  }
  
  private func configureOrderButton() {
    orderButton.layer.borderColor = UIColor(
      red: 220/255,
      green: 220/255,
      blue: 220/255, alpha: 1).cgColor
    orderButton.layer.borderWidth = 1
  }
}
