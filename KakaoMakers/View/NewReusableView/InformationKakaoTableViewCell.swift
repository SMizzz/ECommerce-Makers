//
//  InformationKakaoTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/06.
//

import UIKit

class InformationKakaoTableViewCell: UITableViewCell {
  @IBOutlet weak var kakaoCommerceButton: UIButton!
  @IBOutlet weak var expandableView: UIView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
