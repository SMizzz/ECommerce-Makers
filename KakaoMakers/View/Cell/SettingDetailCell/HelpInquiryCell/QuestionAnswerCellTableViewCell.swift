//
//  QuestionAnswerCellTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/05.
//

import UIKit

class QuestionAnswerCellTableViewCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var downButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
