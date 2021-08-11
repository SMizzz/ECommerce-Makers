//
//  RecentAddKakaoChannelTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/12.
//

import UIKit

class RecentAddKakaoChannelTableViewCell: UITableViewCell {

  @IBOutlet weak var addChannelButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    addChannelButton.layer.masksToBounds = true
    addChannelButton.layer.cornerRadius = self.frame.size.width / 20
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
