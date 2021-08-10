//
//  CashReceiptViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/04.
//

import UIKit

class CashReceiptViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var expandedIndexSet: IndexSet = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
  }
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "InformationKakaoCenterTableViewCell", bundle: nil), forCellReuseIdentifier: "InformationKakaoCenterTableViewCell")
    tableView.register(UINib(nibName: "InformationKakaoTableViewCell", bundle: nil), forCellReuseIdentifier: "InformationKakaoTableViewCell")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.navigationBar.barTintColor = .white
    tabBarController?.tabBar.isHidden = true
    navigationController?.navigationBar.isHidden = false
  }
  
  @IBAction func backBtnTap(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func homeBtnTap(_ sender: Any) {
    
  }
  
  @IBAction func registerBtnTap(_ sender: Any) {
    
  }
}

extension CashReceiptViewController:
  UITableViewDelegate,
  UITableViewDataSource {
  func numberOfSections(
    in tableView: UITableView
  ) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 1
    } else if section == 1 {
      return 1
    }
    return 0
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "InformationKakaoCenterTableViewCell", for: indexPath) as! InformationKakaoCenterTableViewCell
      return cell
    } else if indexPath.section == 1 {
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
      return 100
    } else if indexPath.section == 1 {
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
    if indexPath.section == 1 {
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
