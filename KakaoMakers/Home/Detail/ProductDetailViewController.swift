//
//  ProductDetailViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/06.
//

import UIKit
import Kingfisher

class ProductDetailViewController: UIViewController {
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var productNameLabel: UILabel!
  @IBOutlet weak var productDescriptionLabel: UILabel!
  
  var id: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getData()
  }
  
  private func getData() {
    ProductsNetworkManager.getDetailProductsData(id: id) { [self] (product) in
      productImageView.kf.setImage(with: URL(string: product.imageName))
      productNameLabel.text = product.name
      productDescriptionLabel.text = product.description
    }
  }
}
