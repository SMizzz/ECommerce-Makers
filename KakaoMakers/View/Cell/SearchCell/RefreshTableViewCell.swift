//
//  RefreshTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/06.
//

import UIKit

class RefreshTableViewCell: UITableViewCell {
  
  @IBOutlet weak var refreshButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    refreshButton.layer.borderWidth = 2
    refreshButton.layer.borderColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1).cgColor
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  
  @IBAction func refreshBtnTap(_ sender: Any) {
    print("새로고침")
  }
  
}
