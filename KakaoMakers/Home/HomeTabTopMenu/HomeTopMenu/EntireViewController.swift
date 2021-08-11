//
//  EntireViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/11.
//

import UIKit


class EntireViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
//    var itemData = [
//      HomeItem(
//        imageName: "itemImage",
//        title: "고기 수북한 동남집 양지 특곰탕",
//        content: "맑은 육수에서 풍기는 감칠맛. 양지와 사태를 수북이 얹은 동남집 특곰탕입니다. 얇게 썬 고기에서 사르르 녹는 식감이 느껴지죠. 입맛 돋울 알싸한 마늘 김치도 맛볼 수 있습니다.",
//        orderer: 2500,
//        lover: 1432),
//      HomeItem(
//        imageName: "itemImage2",
//        title: "앉으면 시작되는 종아리 마사지",
//        content: "세븐라이너의 종아리 마사지기가 가벼워졌습니다. 총 6개의 공기압 에어백이 수축과 팽창을 반복하며 효과적으로 주무르죠. 다리를 감싸는 에어벨트는 쉬이 닳지 않도록 내구성을 높였고, 항균 및 탈취 기능도 갖췄습니다.",
//        orderer: 168,
//        lover: 886)
//    ]
  
  var products = [Product]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    getData()
  }
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
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

extension EntireViewController:
  UITableViewDelegate,
  UITableViewDataSource {
  
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    return products.count
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "AllItemTableViewCell",
      for: indexPath) as! AllItemTableViewCell
    let product = products[indexPath.row]
    cell.itemImageView.kf.setImage(with: URL(string: product.imageName))
    cell.titleLabel.text = product.name
    cell.contentLabel.text = product.description
    cell.ordererCountLabel.text = "\(product.countInStock)개의 재고가 있습니다."
    cell.loveButton.setTitle(" \(product.numReviews) 개", for: .normal)
    return cell
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
    return 550.0
  }
}
