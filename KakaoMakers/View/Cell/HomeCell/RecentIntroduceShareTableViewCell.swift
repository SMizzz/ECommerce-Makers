//
//  RecentIntroduceShareTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/12.
//

import UIKit

class RecentIntroduceShareTableViewCell: UITableViewCell {

  @IBOutlet weak var kakaoMakersIntroduceButton: UIButton!
  @IBOutlet weak var talkLogoButton: UIButton!
  @IBOutlet weak var storyLogoButton: UIButton!
  @IBOutlet weak var facebookLogoButton: UIButton!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
