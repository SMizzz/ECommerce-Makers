//
//  PushAdViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/04.
//

import UIKit

class PushAdViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  let orderInformData = [
    PushAdData(
      title: "주문 정보 알림",
      switchValue: true,
      content: "주문한 상품의 배송알림, 문의에 대한 답변 등 주문과 관련된 정보를 받을 수 있습니다.")
  ]
  
  let eventNewsData = [
    PushAdData(
      title: "이벤트 소식 알림",
      switchValue: true,
      content: "이벤트, 기획전, 추천상품 등 기분 좋은 생활에 도움이 되는 정보를 받을 수 있습니다. ")
  ]
  
  let likeTalkData = [
    PushAdData(
      title: "좋아요톡 수신",
      switchValue: true,
      content: "메이커스 채널 추가하시고 제품 '좋아요'를 해보세요. 메이커스 채널의 대화창이 제품에 저장되어 언제든지 쉽게 찾아볼 수 있어요~")
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
  }
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(
      UINib(nibName: "PushAdTableViewCell", bundle: nil),
      forCellReuseIdentifier: "PushAdTableViewCell")
  }
  
  
  @IBAction func backBtnTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
}


extension PushAdViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(
    in tableView: UITableView
  ) -> Int {
    return 3
  }
  
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    if section == 0 {
      return orderInformData.count
    } else if section == 1 {
      return eventNewsData.count
    } else {
      return likeTalkData.count
    }
    return 1
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "PushAdTableViewCell",
      for: indexPath) as! PushAdTableViewCell
    if indexPath.section == 0 {
      let orderInform = orderInformData[indexPath.row]
      cell.titleLabel.text = orderInform.title
      cell.contentLabel.text = orderInform.content
      return cell
    } else if indexPath.section == 1 {
      let eventNews = eventNewsData[indexPath.row]
      cell.titleLabel.text = eventNews.title
      cell.contentLabel.text = eventNews.content
      return cell
    } else {
      let likeTalk = likeTalkData[indexPath.row]
      cell.titleLabel.text = likeTalk.title
      cell.contentLabel.text = likeTalk.content
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    return 125.0
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForFooterInSection section: Int
  ) -> CGFloat {
    return 10
  }
  
  func tableView(
    _ tableView: UITableView,
    viewForFooterInSection section: Int
  ) -> UIView? {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
    view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    return view
  }
}
