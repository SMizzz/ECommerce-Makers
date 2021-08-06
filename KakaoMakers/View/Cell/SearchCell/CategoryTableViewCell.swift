//
//  CategoryTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/06.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var categoryData = ["푸드", "생활 / 주방", "패션잡화", "건강 / 스포츠 / 레저", "패션의류", "홈 인테리어", "뷰티", "IT / 디지털", "가전", "취미 / 문구", "도서", "전시 / 체험", "반려동물", "유아동", "#브랜드 전체보기", "#브랜드 스토리" ]
  
  override func awakeFromNib() {
    super.awakeFromNib()
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}

extension CategoryTableViewCell:
  UICollectionViewDelegate,
  UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return categoryData.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
    cell.categoryLabel.text = categoryData[indexPath.row]
    return cell
  }
  
  
}

extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let category = categoryData[indexPath.row]
    let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
    let size = CGSize(width: 250, height: 1500)
    let estimatedFrame = NSString(string: category).boundingRect(
      with: size,
      options: options,
      attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)],
      context: nil)
    let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)]
    
    let labelSize: CGSize = category.size(withAttributes: attributes)
    var labelWidth = labelSize.width + 30
    if labelWidth < 30 {
      labelWidth = 30
    }
    return CGSize(width: estimatedFrame.width + 30, height: estimatedFrame.height + 20)
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
