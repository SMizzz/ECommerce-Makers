//
//  NotiTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/02.
//

import UIKit

class NotiTableViewCell: UITableViewCell {

  @IBOutlet weak var notiTitleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  
  @IBOutlet weak var moreButton: UIButton!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
