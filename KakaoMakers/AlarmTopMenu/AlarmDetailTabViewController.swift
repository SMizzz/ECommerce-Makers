//
//  AlarmDetailTabViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/07/26.
//

import UIKit

class AlarmDetailTabViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var detailAlertData = [
    DetailAlert(
      title: "집에서 즐기는 온 가족 영양 간식😀",
      content: "(광고)직접 구워 깐 100% 국산 군밤[수신거부: 마이 > 설정]"),
    DetailAlert(
      title: "집에서 즐기는 온 가족 영양 간식😀",
      content: "(광고)직접 구워 깐 100% 국산 군밤[수신거부: 마이 > 설정]")
  ]
  
  let formatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    dateFormatter.timeStyle = .short
    dateFormatter.locale = Locale(identifier: "ko")
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    return dateFormatter
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(
      UINib(nibName: "DetailAlarmTableViewCell", bundle: nil),
      forCellReuseIdentifier: "DetailAlarmTableViewCell")
  }
}

extension AlarmDetailTabViewController:
  UITableViewDelegate,
  UITableViewDataSource {
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    return detailAlertData.count
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "DetailAlarmTableViewCell",
      for: indexPath) as! DetailAlarmTableViewCell
    let detailData = detailAlertData[indexPath.row]
    cell.logoImageView.image = UIImage(named: "alertKakaoMakersLogo")
    cell.titleLabel.text = detailData.title
    cell.contentLabel.text = detailData.content
    let nowDate = Date()
    let str = formatter.string(from: nowDate)
    cell.dateLabel.text = str
    return cell
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    return 120
  }
}
