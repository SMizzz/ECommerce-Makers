//
//  PushAdTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/04.
//

import UIKit

class PushAdTableViewCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var alertAcceptSwitch: UISwitch!
  @IBOutlet weak var contentLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}
