//
//  LikeTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/02.
//

import UIKit

class LikeTableViewCell: UITableViewCell {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var likeData = [Like]()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureCollectionview()
  }
  
  private func configureCollectionview() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(
      UINib(nibName: "LikeItemCollectionViewCell", bundle: nil),
      forCellWithReuseIdentifier: "LikeItemCollectionViewCell")
  }
  
  func config(with like: [Like]) {
    self.likeData = like
    collectionView.reloadData()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}


extension LikeTableViewCell:
  UICollectionViewDelegate,
  UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return likeData.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LikeItemCollectionViewCell", for: indexPath) as! LikeItemCollectionViewCell
    let like = likeData[indexPath.item]
    cell.productImageView.image = UIImage(named: like.imageName)
    cell.productName.text = like.title
    cell.dDayOrderLabel.text = like.dDayLabel
    
    return cell
  }
}

extension LikeTableViewCell:
  UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let width = collectionView.frame.width / 2
    let height = collectionView.safeAreaLayoutGuide.layoutFrame.height
    
    return CGSize(width: width, height: height)
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAt section: Int
  ) -> CGFloat {
    return 0
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    return 0
  }
}
