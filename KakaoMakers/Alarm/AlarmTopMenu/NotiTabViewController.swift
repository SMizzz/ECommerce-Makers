//
//  NotiTabViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/07/26.
//

import UIKit

class NotiTabViewController:
  UIViewController {
  
  @IBOutlet weak var notiTableView: UITableView!
  
  var expandedIndexSet: IndexSet = []
  
  var notiData = [
    Noti(
      title: "[안내] 카카오커머스 합병에 따른 개인정보 이전 안내 [안내] 카카오커머스 합병에 따른 개인정보 이전 안내[안내] 카카오커머스 합병에 따른 개인정보 이전 안내[안내] 카카오커머스 합병에 따른 개인정보 이전 안내[안내] 카카오커머스 합병에 따른 개인정보 이전 안내[안내] 카카오커머스 합병에 따른 개인정보 이전 안내[안내] 카카오커머스 합병에 따른 개인정보 이전 안내[안내] 카카오커머스 합병에 따른 개인정보 이전 안내[안내] 카카오커머스 합병에 따른 개인정보 이전 안내[안내] 카카오커머스 합병에 따른 개인정보 이전 안내",
      date: Date()),
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
    
//    notiTableView.rowHeight = UITableView.automaticDimension
  
    notiTableView.delegate = self
    notiTableView.dataSource = self
    notiTableView.register(UINib(nibName: "NotiTableViewCell", bundle: nil), forCellReuseIdentifier: "NotiTableViewCell")
    notiTableView.rowHeight = UITableView.automaticDimension
    

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
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "NotiTableViewCell",
      for: indexPath) as! NotiTableViewCell
    let noti = notiData[indexPath.row]
    cell.notiTitleLabel.text = noti.title
    let str = formatter.string(from: noti.date)
    cell.dateLabel.text = str
    
    if expandedIndexSet.contains(indexPath.row) {
      cell.notiTitleLabel.numberOfLines = 0
      cell.moreButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
    } else {
      cell.notiTitleLabel.numberOfLines = 1
      cell.moreButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    }
    return cell
  }
  
  func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    if expandedIndexSet.contains(indexPath.row) {
      expandedIndexSet.remove(indexPath.row)
    } else {
      expandedIndexSet.insert(indexPath.row)
    }
    self.notiTableView.reloadRows(at: [indexPath], with: .automatic)
  }
  
//  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    if expandedIndexSet.contains(indexPath.row) {
//      return UITableView.automaticDimension
//    } else {
//      return 85.0
//    }
//  }

  
//  func tableView(
//    _ tableView: UITableView,
//    heightForRowAt indexPath: IndexPath
//  ) -> CGFloat {
//    if expandedIndexSet.contains(indexPath.row) {
//      return UITableView.automaticDimension
//    } else {
//      expandedIndexSet.insert(indexPath.row)
//    }

//    return UITableView.automaticDimension
//  }
}
