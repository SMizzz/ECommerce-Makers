//
//  NewViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/11.
//

import UIKit

class NewViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var products = [Product]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    getData()
  }
  
  private func configureTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(
      UINib(nibName: "AllItemTableViewCell", bundle: nil),
      forCellReuseIdentifier: "AllItemTableViewCell")
  }
  
  private func getData() {
    ProductsNetworkManager.getProductsData { (products) in
      self.products = products
      OperationQueue.main.addOperation {
        self.tableView.reloadData()
      }
    }
  }
}

extension NewViewController:
  UITableViewDelegate,
  UITableViewDataSource {
  func numberOfSections(
    in tableView: UITableView
  ) -> Int {
    return 2
  }
  
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    if section == 0 {
      return 1
    } else if section == 1 {
      return products.count
    }
    return 1
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "WeekTableViewCell", for: indexPath)
      return cell
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "AllItemTableViewCell", for: indexPath) as! AllItemTableViewCell
      let product = products[indexPath.row]
      cell.itemImageView.kf.setImage(with: URL(string: product.imageName))
      cell.titleLabel.text = product.name
      cell.contentLabel.text = product.description
      cell.ordererCountLabel.text = "\(product.countInStock)개의 재고가 있습니다."
      cell.loveButton.setTitle(" \(product.numReviews) 개", for: .normal)
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    let homeStoryBoard = UIStoryboard(name: "Home", bundle: nil)
    guard let detailVC = homeStoryBoard.instantiateViewController(withIdentifier: "ProductDetailVC") as? ProductDetailViewController else { return }
    detailVC.id = products[indexPath.row].id
    navigationController?.pushViewController(detailVC, animated: true)
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    if indexPath.section == 0 {
      return 120
    } else if indexPath.section == 1 {
      return 550.0
    }
    return UITableView.automaticDimension
  }
}
