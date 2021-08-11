//
//  RecentAllDeleteTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/11.
//

import UIKit

protocol RecentVCToAllDeleteDelegate: AnyObject {
  func allDeleteDelegate(cell: RecentAllDeleteTableViewCell)
}

class RecentAllDeleteTableViewCell: UITableViewCell {
  
  weak var delegate: RecentVCToAllDeleteDelegate?
  @IBOutlet weak var recentTitleLabel: UILabel!
  @IBOutlet weak var allDeleteButton: UIButton!
  
  let buttonAttributes: [NSAttributedString.Key: Any] = [
    .font: UIFont.systemFont(ofSize: 14),
    .foregroundColor: UIColor.darkGray,
    .underlineStyle: NSUnderlineStyle.single.rawValue
  ]
  
  override func awakeFromNib() {
    super.awakeFromNib()
    let attributeString = NSMutableAttributedString(
      string: "전체삭제",
      attributes: buttonAttributes
    )
    allDeleteButton.setAttributedTitle(attributeString, for: .normal)
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  @IBAction func allDeleteBtnTap(_ sender: Any) {
    delegate?.allDeleteDelegate(cell: self)
  }
}
