//
//  ThisWeekNewProductTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/06.
//

import UIKit

class ThisWeekNewProductTableViewCell: UITableViewCell {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var thisWeekProduct = [
    ThisWeekNewProduct(
      productImage: "pizza",
      productName: "마이 허니 버터피자",
      orderCount: 158),
    ThisWeekNewProduct(
      productImage: "ring",
      productName: "프레시오사 정품 아르모니아 컬렉션",
      orderCount: 29),
    ThisWeekNewProduct(
      productImage: "airfried",
      productName: "OLLY 에어그릴 에어프라이어 OLAG09B",
      orderCount: 24),
    ThisWeekNewProduct(
      productImage: "recyclingbin",
      productName: "편리한 분리수거함",
      orderCount: 633)
  ]
  
  override func awakeFromNib() {
    super.awakeFromNib()
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(
      UINib(
        nibName: "ThisWeekNewProductCollectionViewCell",
        bundle: nil), forCellWithReuseIdentifier: "ThisWeekNewProductCollectionViewCell")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

}

extension ThisWeekNewProductTableViewCell:
  UICollectionViewDelegate,
  UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return thisWeekProduct.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThisWeekNewProductCollectionViewCell", for: indexPath) as! ThisWeekNewProductCollectionViewCell
    let productData = thisWeekProduct[indexPath.item]
    cell.productImageView.image = UIImage(named: productData.productImage)
    cell.productTitle.text = productData.productName
    cell.orderCountLabel.text = "\(productData.orderCount)명 주문중"
    return cell
  }
}

extension ThisWeekNewProductTableViewCell:
  UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.safeAreaLayoutGuide.layoutFrame.width
    let height = collectionView.safeAreaLayoutGuide.layoutFrame.height
    return CGSize(width: width / 2 - 5 , height: height / 2 - 5)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 5
  }
}
