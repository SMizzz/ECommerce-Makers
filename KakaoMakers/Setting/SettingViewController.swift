//
//  SettingViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/02.
//

import UIKit

class SettingViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var personalInfo = ["휴대폰 번호", "알림/광고 동의 관리"]
  var paymentInfo = ["현금영수증 정보 관리", "환불관리"]
  var appInfo = ["버전정보", "오픈소스 라이언스", "개인정보 처리방침", "도움말 / 고객센터", "친구에게 공유하기"]
  var authInfo = ["로그아웃", "카카오 쇼핑 안내"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = UITableView.automaticDimension
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    tabBarController?.tabBar.isHidden = false
  }
  
  @IBAction func backBtnTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(
    in tableView: UITableView
  ) -> Int {
    return 4
  }
  
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    if section == 0 {
      return personalInfo.count
    } else if section == 1 {
      return paymentInfo.count
    } else if section == 2 {
      return appInfo.count
    } else if section == 3 {
      return authInfo.count
    }
    return 0
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let informCell = tableView.dequeueReusableCell(withIdentifier: "InformTableViewCell", for: indexPath)
    let detailCell = tableView.dequeueReusableCell(withIdentifier: "DetailInformTableViewCell", for: indexPath)
    
    switch indexPath.section {
    case 0:
      detailCell.textLabel?.text = personalInfo[indexPath.row]
      if indexPath.row == 0 {
        detailCell.detailTextLabel?.text = "0105398922"
        detailCell.accessoryType = .none
      } else {
        detailCell.detailTextLabel?.text = ""
      }
      return detailCell
      
    case 1:
      informCell.textLabel?.text = paymentInfo[indexPath.row]
      return informCell
      
    case 2:
      if indexPath.row == 0 {
        detailCell.textLabel?.text = appInfo[0]
        detailCell.detailTextLabel?.text = "최신버전입니다."
        detailCell.accessoryType = .none
        return detailCell
      } else {
        informCell.textLabel?.text = appInfo[indexPath.row]
        return informCell
      }
      
    case 3:
      informCell.textLabel?.text = authInfo[indexPath.row]
      if indexPath.row == 0 {
        informCell.accessoryType = .none
      }
      return informCell
    default:
      return UITableViewCell()
    }
  }
  
  //    if indexPath.section == 0 {
  //
  //      cell.textLabel?.text = personalInfo[indexPath.row]
  //      if indexPath.row == 0 {
  //        print(personalInfo[indexPath.row])
  ////        cell.detailTextLabel?.textColor = .black
  //        cell.detailTextLabel?.text = "01054960624"
  //        cell.accessoryType = .none
  //      }
  //
  //    } else if indexPath.section == 1 {
  //
  //      cell.textLabel?.text = paymentInfo[indexPath.row]
  //
  //    } else if indexPath.section == 2 {
  //
  //      cell.textLabel?.text = appInfo[indexPath.row]
  //
  //    } else if indexPath.section == 3 {
  //
  //      cell.textLabel?.text = authInfo[indexPath.row]
  //
  //    }
  //    return cell
  //  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    switch section {
    case 0:
      return 0
    default:
      return 10
    }
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    if section == 4 {
      return 10
    } else {
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10))
    view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    return view
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
    view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    return view
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.section {
    case 0:
      if indexPath.row == 1 {
        let settingDetailSB = UIStoryboard(name: "SettingDetail", bundle: nil)
        let settingDetailVC = settingDetailSB.instantiateViewController(withIdentifier: "SettingDetailVC")
        navigationController?.pushViewController(settingDetailVC, animated: true)
      }
      
    case 1:
      if indexPath.row == 0 {
        let settingDetailSB = UIStoryboard(name: "SettingDetail", bundle: nil)
        let CashReceiptVC = settingDetailSB.instantiateViewController(withIdentifier: "CashReceiptVC")
        navigationController?.pushViewController(CashReceiptVC, animated: true)
      }
      
    case 3:
      if indexPath.row == 0 {
        print("로그아웃 하시겠습니까")
      }
    default:
      0
    }
  }
}
