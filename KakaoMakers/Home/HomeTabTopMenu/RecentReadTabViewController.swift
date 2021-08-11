//
//  RecentReadTabViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/07/26.
//

import UIKit

class RecentReadTabViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var product = [Product]()
  var expandedIndexSet: IndexSet = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    getData()
  }
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "RecentViewListTableViewCell", bundle: nil), forCellReuseIdentifier: "RecentViewListTableViewCell")
    tableView.register(UINib(nibName: "InformationKakaoCenterTableViewCell", bundle: nil), forCellReuseIdentifier: "InformationKakaoCenterTableViewCell")
    tableView.register(UINib(nibName: "InformationKakaoTableViewCell", bundle: nil), forCellReuseIdentifier: "InformationKakaoTableViewCell")
  }
  
  private func getData() {
    ProductsNetworkManager.getProductsData { (products) in
      self.product = products
      OperationQueue.main.addOperation {
        self.tableView.reloadData()
      }
    }
  }
}

extension RecentReadTabViewController:
  UITableViewDelegate,
  UITableViewDataSource {
  func numberOfSections(
    in tableView: UITableView
  ) -> Int {
    return 7
  }
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    if section == 0 {
      return 1
    } else if section == 1 {
      return product.count
    } else if section == 2 {
      return 1
    } else if section == 3 {
      return 1
    } else if section == 4 {
      return 1
    } else if section == 5 {
      return 1
    } else if section == 6 {
      return 1
    }
    return 1
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "RecentAllDeleteTableViewCell", for: indexPath) as! RecentAllDeleteTableViewCell
      cell.delegate = self
      return cell
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "RecentViewListTableViewCell", for: indexPath) as! RecentViewListTableViewCell
      let productData = product[indexPath.row]
      cell.delegate = self
      cell.productImageView.kf.setImage(with: URL(string: productData.imageName))
      cell.productNameLabel.text = productData.name
      cell.productPriceLabel.text = "\(productData.price)$"
      cell.orderLabel.text = "잔여: \(productData.countInStock)개"
      return cell
    } else if indexPath.section == 2 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "RecentAddKakaoChannelTableViewCell", for: indexPath)
      return cell
    } else if indexPath.section == 3 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "RecentInquiryTableViewCell", for: indexPath)
      return cell
    } else if indexPath.section == 4 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "RecentIntroduceShareTableViewCell", for: indexPath) as! RecentIntroduceShareTableViewCell
      return cell
    } else if indexPath.section == 5 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "InformationKakaoCenterTableViewCell", for: indexPath) as! InformationKakaoCenterTableViewCell
      return cell
    } else if indexPath.section == 6 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "InformationKakaoTableViewCell", for: indexPath) as! InformationKakaoTableViewCell
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    if indexPath.section == 0 {
      return 60.0
    } else if indexPath.section == 1 {
      return 130.0
    } else if indexPath.section == 2 {
      return 375.0
    } else if indexPath.section == 3 {
      return 100.0
    } else if indexPath.section == 4 {
      return 100.0
    } else if indexPath.section == 5 {
      return 100.0
    } else if indexPath.section == 6 {
      if expandedIndexSet.contains(indexPath.row) {
        return 270
      } else {
        return 70
      }
    }
    return UITableView.automaticDimension
  }
  
  func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    if indexPath.section == 6 {
      if expandedIndexSet.contains(indexPath.row) {
        expandedIndexSet.remove(indexPath.row)
      } else {
        expandedIndexSet.insert(indexPath.row)
      }
    }
    self.tableView.reloadRows(at: [indexPath], with: .automatic)
    self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
  }
}

extension RecentReadTabViewController:
  RecentVCToAllDeleteDelegate,
  RecentVCToViewListDelegate {
  func allDeleteDelegate(cell: RecentAllDeleteTableViewCell) {
    product.removeAll()
    tableView.reloadData()
  }
  
  func deleteTapped(cell: RecentViewListTableViewCell) {
    print("tapped")
    let indexPath = tableView.indexPath(for: cell)
    product.remove(at: indexPath!.row)
    tableView.reloadData()
  }
}
