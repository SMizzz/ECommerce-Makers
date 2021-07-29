//
//  MenuBarTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/07/28.
//

import UIKit

class MenuBarTableViewCell: UITableViewCell {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  let menuList: [String] = ["전체", "신규", "카테고리"]
  var isSelectedArray: [Bool] = [true, false, false]
  var selectedIndexPath: IndexPath!
    
  override func awakeFromNib() {
    super.awakeFromNib()
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(
      UINib(nibName: "MenuBarCollectionViewCell", bundle: nil),
      forCellWithReuseIdentifier: "MenuBarCollectionViewCell")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}

extension MenuBarTableViewCell:
  UICollectionViewDataSource,
  UICollectionViewDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return menuList.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuBarCollectionViewCell", for: indexPath) as! MenuBarCollectionViewCell
    let menu = menuList[indexPath.item]
    cell.menuTitleLabel.text = menu
    if indexPath.item == 0 {
      cell.isSelected = true
      selectedIndexPath = indexPath
    }
    return cell
  }
}

extension MenuBarTableViewCell:
  UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let menu = menuList[indexPath.row]
    let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
    let size = CGSize(width: 250, height: 1500)
    let estimatedFrame = NSString(string: menu).boundingRect(
      with: size,
      options: options,
      attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)],
      context: nil)
    let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]
    
    let labelSize: CGSize = menu.size(withAttributes: attributes)
    var labelWidth = labelSize.width + 30
    if labelWidth < 30 {
      labelWidth = 30
    }
    return CGSize(width: estimatedFrame.width + 35, height: estimatedFrame.height + 20)
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    return 0
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAt section: Int
  ) -> CGFloat {
    return 5
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    shouldSelectItemAt indexPath: IndexPath
  ) -> Bool {
    if selectedIndexPath.item == 0 {
      let cell = collectionView.cellForItem(at: selectedIndexPath)
//      print("선택되었습니다.\(indexPath)", cell?.isSelected)
      cell?.isSelected = false
//      print("선택되었습니다.\(indexPath)", cell?.isSelected)
    }
    return true
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath
  ) {
    
  }
}
