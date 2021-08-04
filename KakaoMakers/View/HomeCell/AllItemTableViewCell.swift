//
//  ItemTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/07/29.
//

import UIKit

class AllItemTableViewCell: UITableViewCell {
  
  @IBOutlet weak var itemImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentLabel: UILabel!
  @IBOutlet weak var ordererCountLabel: UILabel!
  @IBOutlet weak var loveButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureButton()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  private func configureButton() {
    loveButton.layer.borderWidth = 1
    loveButton.layer.borderColor = UIColor.lightGray.cgColor
    
    let attrString = NSMutableAttributedString(string: contentLabel.text!)
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = 4
    attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
    contentLabel.attributedText = attrString
  }
  
}
