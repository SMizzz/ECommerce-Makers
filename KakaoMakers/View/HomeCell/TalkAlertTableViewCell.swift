//
//  TalkAlertTableViewCell.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/02.
//

import UIKit

class TalkAlertTableViewCell: UITableViewCell {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var talkAlert = [TalkAlert]()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureCollectionView()
  }
  
  private func configureCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(
      UINib(nibName: "TalkAlertCollectionViewCell", bundle: nil),
      forCellWithReuseIdentifier: "TalkAlertCollectionViewCell")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func config(with talkAlert: [TalkAlert]) {
    self.talkAlert = talkAlert
    collectionView.reloadData()
  }
  
}

extension TalkAlertTableViewCell:
  UICollectionViewDelegate,
  UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return talkAlert.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: "TalkAlertCollectionViewCell",
      for: indexPath) as! TalkAlertCollectionViewCell
    let talk = talkAlert[indexPath.item]
    cell.productImageView.image = UIImage(named: talk.imageName)
    cell.productNameLabel.text = talk.title
    
    let fontSize = UIFont.boldSystemFont(ofSize: 13)
    let attributedStr = NSMutableAttributedString(string: "\(talk.waiter)")
    attributedStr.addAttribute(
      .font,
      value: fontSize,
      range: (cell.waiterLabel.text! as NSString).range(of: "\(talk.waiter)"))
    cell.waiterLabel.attributedText = attributedStr
    cell.waiterLabel.text = "\(talk.waiter)명이 기다려요"
    return cell
  }
  
  
}

extension TalkAlertTableViewCell:
  UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let width = collectionView.safeAreaLayoutGuide.layoutFrame.width
    let height = collectionView.safeAreaLayoutGuide.layoutFrame.height
    return CGSize(width: width, height: height)
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    return 5
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAt section: Int
  ) -> CGFloat {
    return 0
  }
}
