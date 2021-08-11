//
//  RecentViewListTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/11.
//

import UIKit

protocol RecentVCToViewListDelegate: AnyObject {
  func deleteTapped(cell: RecentViewListTableViewCell)
}

class RecentViewListTableViewCell: UITableViewCell {
  weak var delegate: RecentVCToViewListDelegate?
  
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var productNameLabel: UILabel!
  @IBOutlet weak var productPriceLabel: UILabel!
  @IBOutlet weak var orderLabel: UILabel!
  @IBOutlet weak var deleteButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
    
  @IBAction func deleteBtnTap(_ sender: Any) {
    delegate?.deleteTapped(cell: self)
  }
}
