//
//  HelpViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/05.
//

import UIKit

class HelpViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  var expandedIndexSet: IndexSet = []
  
  var questionTitle = [
    "주문하기 전에 제품에 대해 궁금한 점이 있습니다.",
    "사고 싶은 제품이 있는데 주문기간이 끝난 것 같아요. 주문할 수 있는 방법이 없을까요?",
    "배송지를 변경하고 싶습니다.",
    "배송조회는 어떻게 가능한가요?",
    "주문한 제품은 언제 배송되나요?",
    "주문한 제품과 다른 제품이 배송되었습니다.",
    "주문한 제품을 아직 못 받았는데, ”배송완료”라 표시되어 있습니다.",
    "메이커스에서는 어떤 이벤트를 진행하고 있나요?"
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tabBarController?.tabBar.isHidden = true
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "InformationKakaoTableViewCell", bundle: nil), forCellReuseIdentifier: "InformationKakaoTableViewCell")
    
  }
  
}

extension HelpViewController:
  UITableViewDelegate,
  UITableViewDataSource {
  func numberOfSections(
    in tableView: UITableView
  ) -> Int {
    return 5
  }
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    if section == 0 {
      return 1
    } else if section == 1 {
      return 1
    } else if section == 2 {
      return questionTitle.count
    } else if section == 3 {
      return 1
    } else if section == 4 {
      return 1
    }
    return 0
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "HomeInquiryTableViewCell", for: indexPath) as! HomeInquiryTableViewCell
      return cell
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTopTitleCell", for: indexPath)
      return cell
    } else if indexPath.section == 2 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionAnswerCell", for: indexPath) as! QuestionAnswerCellTableViewCell
      cell.titleLabel.text = questionTitle[indexPath.row]
      return cell
    } else if indexPath.section == 3 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryGuideCell", for: indexPath)
      cell.textLabel?.text = "배송업체 안내"
      return cell
    } else if indexPath.section == 4 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "InformationKakaoTableViewCell", for: indexPath) as! InformationKakaoTableViewCell
      return cell
    } 
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
      return 150
    } else if indexPath.section == 1 {
      return 70
    } else if indexPath.section == 2 {
      return 60
    } else if indexPath.section == 3 {
      return 60
    } else if indexPath.section == 4 {
      if expandedIndexSet.contains(indexPath.row) {
        return 270
      } else {
        return 70
      }
    }
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.section == 4 {
      if expandedIndexSet.contains(indexPath.row) {
        expandedIndexSet.remove(indexPath.row)
      } else {
        expandedIndexSet.insert(indexPath.row)
      }
    }
    self.tableView.reloadRows(at: [indexPath], with: .automatic)
  }
}
