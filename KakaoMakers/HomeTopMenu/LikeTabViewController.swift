//
//  LikeTabViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/07/26.
//

import UIKit

class LikeTabViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var likeData = [
    Like(
      imageName: "Choc-Chip-Cookie",
      title: "[칙촉] 촉촉한 초코칩 미니 16P",
      price: 3500,
      dDayLabel: "주문종료 D-day 3"),
    Like(
      imageName: "Choc-Chip-Cookie",
      title: "[칙촉] 촉촉한 초코칩 미니 16P",
      price: 3500,
      dDayLabel: "주문종료 D-day 3")
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
  }
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension LikeTabViewController:
  UITableViewDelegate,
  UITableViewDataSource {
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    return 1
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "LikeTableViewCell",
      for: indexPath) as! LikeTableViewCell
    cell.config(with: likeData)
    return cell
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    return 862.0
  }
}
