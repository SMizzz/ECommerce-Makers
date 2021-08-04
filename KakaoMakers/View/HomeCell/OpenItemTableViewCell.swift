//
//  OpenItemTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/07/29.
//

import UIKit

class OpenItemTableViewCell: UITableViewCell {
  
  @IBOutlet weak var openItemImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentLabel: UILabel!
  @IBOutlet weak var watingCountLabel: UILabel!
  @IBOutlet weak var bellButton: UIButton!
  
//  override var isSelected: Bool {
//    didSet {
//      if isSelected {
//        print("선택")
//        bellButton.setTitle("알림 신청 완료", for: .normal)
//        bellButton.layer.backgroundColor = UIColor.systemPink.cgColor
//        bellButton.titleLabel?.textColor = .white
//        bellButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
//      }
//
//      else {
//        bellButton.setImage(UIImage(systemName: "bell.fill"), for: .normal)
//        bellButton.tintColor = UIColor.systemPink
//        bellButton.setTitle("  톡으로 알림받기", for: .normal)
//        bellButton.titleLabel?.textColor = .darkGray
//      }
//    }
//  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureButton()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    if selected {
      print("선택")
      bellButton.setImage(nil, for: .normal)
      bellButton.setTitle("알림 신청 완료", for: .normal)
      bellButton.layer.backgroundColor = UIColor.systemPink.cgColor
      bellButton.titleLabel?.textColor = .white
      bellButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    else {
      bellButton.setImage(UIImage(systemName: "bell.fill"), for: .normal)
      bellButton.tintColor = UIColor.systemPink
      bellButton.setTitle("  톡으로 알림받기", for: .normal)
      bellButton.titleLabel?.textColor = .darkGray
    }
  }

  private func configureButton() {
    bellButton.layer.borderColor = UIColor.lightGray.cgColor
    bellButton.layer.borderWidth = 1
    bellButton.layer.shadowColor = UIColor.lightGray.cgColor
    bellButton.layer.shadowOffset = CGSize(width: 3, height: 3)
    bellButton.layer.shadowOpacity = 0.8
  }
  
}
