//
//  TalkAlertCollectionViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/02.
//

import UIKit

class TalkAlertCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var productNameLabel: UILabel!
  @IBOutlet weak var waiterLabel: UILabel!
  @IBOutlet weak var alertButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureCellUI()
  }
  
  private func configureCellUI() {
    productImageView.layer.cornerRadius = productImageView.frame.size.height / 2
    productImageView.clipsToBounds = true
    
    alertButton.layer.borderWidth = 1
    alertButton.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1).cgColor
  }
}
