//
//  NotiTabViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/07/26.
//

import UIKit

class NotiTabViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var notiData = [
    Noti(
      title: "[안내] 카카오커머스 합병에 따른 개인정보 이전 안내",
      date: Date())
  ]
  
  let formatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    dateFormatter.timeStyle = .none
    dateFormatter.locale = Locale(identifier: "ko")
    dateFormatter.dateFormat = "yyyy.MM.dd"
    return dateFormatter
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension NotiTabViewController:
  UITableViewDelegate,
  UITableViewDataSource {
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    return notiData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "NotiTableViewCell", for: indexPath) as! NotiTableViewCell
    let noti = notiData[indexPath.row]
    cell.titleLabel.text = noti.title
    let str = formatter.string(from: noti.date)
    cell.dateLabel.text = str
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 85.0
  }
  
}
