//
//  LikeTabViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/07/26.
//

import UIKit

class LikeTabViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var expandedIndexSet: IndexSet = []
    
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
    tableView.register(UINib(nibName: "RecentAddKakaoChannelTableViewCell", bundle: nil), forCellReuseIdentifier: "RecentAddKakaoChannelTableViewCell")
    tableView.register(UINib(nibName: "RecentInquiryTableViewCell", bundle: nil), forCellReuseIdentifier: "RecentInquiryTableViewCell")
    tableView.register(UINib(nibName: "RecentIntroduceShareTableViewCell", bundle: nil), forCellReuseIdentifier: "RecentIntroduceShareTableViewCell")
    tableView.register(UINib(nibName: "InformationKakaoCenterTableViewCell", bundle: nil), forCellReuseIdentifier: "InformationKakaoCenterTableViewCell")
    tableView.register(UINib(nibName: "InformationKakaoTableViewCell", bundle: nil), forCellReuseIdentifier: "InformationKakaoTableViewCell")
  }
}

extension LikeTabViewController:
  UITableViewDelegate,
  UITableViewDataSource {
  func numberOfSections(
    in tableView: UITableView
  ) -> Int {
    return 6
  }
  
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
//    if section == 0 {
//      return 1
//    } else if section == 1 {
//      return 1
//    }
    return 1
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(
        withIdentifier: "LikeTableViewCell",
        for: indexPath) as! LikeTableViewCell
      cell.config(with: likeData)
      return cell
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "RecentAddKakaoChannelTableViewCell", for: indexPath) as! RecentAddKakaoChannelTableViewCell
      return cell
    } else if indexPath.section == 2 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "RecentInquiryTableViewCell", for: indexPath) as! RecentInquiryTableViewCell
      return cell
    } else if indexPath.section == 3 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "RecentIntroduceShareTableViewCell", for: indexPath) as! RecentIntroduceShareTableViewCell
      return cell
    } else if indexPath.section == 4 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "InformationKakaoCenterTableViewCell", for: indexPath) as! InformationKakaoCenterTableViewCell
      return cell
    } else if indexPath.section == 5 {
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
      return 380.0
    } else if indexPath.section == 1 {
      return 300.0
    } else if indexPath.section == 2 {
      return 100.0
    } else if indexPath.section == 3 {
      return 100.0
    } else if indexPath.section == 4 {
      return 100.0
    } else if indexPath.section == 5 {
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
    if indexPath.section == 5 {
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
