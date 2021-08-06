//
//  MenuBarCollectionViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/07/28.
//

import UIKit

class MenuBarCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var menuTitleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureLabel()
  }
  
  override var isSelected: Bool {
    didSet {
      if isSelected {
        menuTitleLabel.textColor = .white
        menuTitleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        menuTitleLabel.backgroundColor = .black
      }

      else {
        menuTitleLabel.textColor = .black
        menuTitleLabel.font = UIFont.systemFont(ofSize: 15)
        menuTitleLabel.backgroundColor = .white
      }
    }
  }
  
  func configureLabel() {
    menuTitleLabel.layer.cornerRadius = 18
    menuTitleLabel.layer.borderWidth = 1
    menuTitleLabel.layer.borderColor = UIColor.darkGray.cgColor
    menuTitleLabel.clipsToBounds = true
    menuTitleLabel.sizeToFit()
  }
}
