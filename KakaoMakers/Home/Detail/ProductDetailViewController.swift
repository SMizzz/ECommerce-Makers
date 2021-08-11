//
//  ProductDetailViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/06.
//

import UIKit
import Kingfisher

class ProductDetailViewController: UIViewController {
  
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var productNameLabel: UILabel!
  @IBOutlet weak var productPriceLabel: UILabel!
  @IBOutlet weak var ProductStockLabel: UILabel!
  @IBOutlet weak var productDescriptionLabel: UILabel!
  
  var id: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    navigationController?.navigationBar.barTintColor = .white
    tabBarController?.tabBar.isHidden = true
  }
  
  private func getData() {
    ProductsNetworkManager.getDetailProductsData(id: id) { [self] (product) in
      categoryLabel.text = "category > \(product.category)"
      productImageView.kf.setImage(with: URL(string: product.imageName))
      productNameLabel.text = product.name
      productPriceLabel.text = "\(product.price)$"
      ProductStockLabel.text = "\(product.countInStock)개 남았어요!"
      productDescriptionLabel.text = product.description
    }
  }
  @IBAction func backBtnTap(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
}
