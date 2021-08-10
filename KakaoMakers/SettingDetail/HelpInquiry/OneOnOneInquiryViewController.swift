//
//  OneOnOneInquiryViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/05.
//

import UIKit
//InformationKakaoCenterTableViewCell
//InformationKakaoTableViewCell
class OneOnOneInquiryViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var expandedIndexSet: IndexSet = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    tabBarController?.tabBar.isHidden = true
  }
  
  private func configureTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UINib(nibName: "ConsultationInquiryTableViewCell", bundle: nil), forCellReuseIdentifier: "ConsultationInquiryTableViewCell")
    tableView.register(UINib(nibName: "InformationKakaoCenterTableViewCell", bundle: nil), forCellReuseIdentifier: "InformationKakaoCenterTableViewCell")
    tableView.register(UINib(nibName: "InformationKakaoTableViewCell", bundle: nil), forCellReuseIdentifier: "InformationKakaoTableViewCell")
  }
}

extension OneOnOneInquiryViewController:
  UITableViewDataSource,
  UITableViewDelegate {
  func numberOfSections(
    in tableView: UITableView
  ) -> Int {
    return 4
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
      let cell = tableView.dequeueReusableCell(withIdentifier: "ConsultationInquiryTableViewCell", for: indexPath) as! ConsultationInquiryTableViewCell
      return cell
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "InquiryListTableViewCell", for: indexPath)
      return cell
    }
    if indexPath.section == 2 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "InformationKakaoCenterTableViewCell", for: indexPath) as! InformationKakaoCenterTableViewCell
      return cell
    } else if indexPath.section == 3 {
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
      return 200
    } else if indexPath.section == 1 {
      return 240
    } else if indexPath.section == 2 {
      return 100
    } else if indexPath.section == 3 {
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
    if indexPath.section == 3 {
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
