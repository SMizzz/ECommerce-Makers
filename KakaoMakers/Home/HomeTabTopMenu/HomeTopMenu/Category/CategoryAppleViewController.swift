//
//  CategoryAppleViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/11.
//

import UIKit
import Kingfisher

class CategoryAppleViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var products = [Product]()
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionView()
    getData()
  }
  
  private func configureCollectionView() {
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(UINib(nibName: "AppleItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AppleItemCollectionViewCell")
  }
  
  private func getData() {
    ProductsNetworkManager.getProductsData { (products) in
      self.products = products
      OperationQueue.main.addOperation() {
        self.collectionView.reloadData()
      }
    }
  }

}

extension CategoryAppleViewController:
  UICollectionViewDelegate,
  UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return products.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppleItemCollectionViewCell", for: indexPath) as! AppleItemCollectionViewCell
    let product = products[indexPath.item]
    cell.productImageView.kf.setImage(with: URL(string: product.imageName))
    cell.productNameLabel.text = product.name
    cell.priceLabel.text = "\(product.price)$"
    return cell
  }
  
  
}

extension CategoryAppleViewController:
  UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let width = collectionView.safeAreaLayoutGuide.layoutFrame.width
    return CGSize(width: width/2 - 5 , height: 300)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
