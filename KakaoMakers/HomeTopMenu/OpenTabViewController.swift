//
//  OpenTabViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/07/26.
//

import UIKit

class OpenTabViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  var openItemData = [
    OpenItem(
      imageName: "openImage",
      title: "세계 최초 퀀텀 미니 LED 모니터",
      content: "퀀텀 미니 LED로 현실감을 높인 게이밍 모니터, 삼성 오디세이 네오 G9를 메이커스에서 단독 공개합니다. 백만 대 일의 명암비와 4,096단계로 밝기를 세밀하게 조절하는 퀀텀 매트릭스 기술을 적용, 게임 화면에 맞게 최적화하죠. 모니터 2대를 연결한 듯 넓은 듀얼 QHD 해상도로 광활한 게임 속 세계를 탐험하세요.",
      waiter: 91)
  ]
  
  var talkAlertData = [
    TalkAlert(
      imageName: "Choc-Chip-Cookie",
      title: "촉촉한 초코칩 미니 16p",
      waiter: 1342)
  ]
  
  var secondItemData = [
    OpenItem(
      imageName: "openImage",
      title: "세계 최초 퀀텀 미니 LED 모니터",
      content: "퀀텀 미니 LED로 현실감을 높인 게이밍 모니터, 삼성 오디세이 네오 G9를 메이커스에서 단독 공개합니다. 백만 대 일의 명암비와 4,096단계로 밝기를 세밀하게 조절하는 퀀텀 매트릭스 기술을 적용, 게임 화면에 맞게 최적화하죠. 모니터 2대를 연결한 듯 넓은 듀얼 QHD 해상도로 광활한 게임 속 세계를 탐험하세요.",
      waiter: 91)
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
  }
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(
      UINib(
        nibName: "OpenItemTableViewCell",
        bundle: nil),
      forCellReuseIdentifier: "OpenItemTableViewCell")
  }
}

extension OpenTabViewController:
  UITableViewDelegate,
  UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 5
  }
  
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    if section == 0 {
      return 1
    } else if section == 1 {
      return openItemData.count
    } else if section == 2 {
      return 1
    } else if section == 3 {
      return 1
    } else if section == 4 {
      return secondItemData.count
    }
    return 0
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    if indexPath.section == 0 {
      let headerCell = tableView.dequeueReusableCell(
        withIdentifier: "OpenItemTitleCell",
        for: indexPath) as! OpenItemTitleCell
      headerCell.titleLabel.text = "곧 오픈합니다"
      headerCell.contentLabel.text = "기다려지는 제품을 찾으셨나요? 주문이 시작되면 알려드릴게요."
      return headerCell
    } else if indexPath.section == 1{
      let cell = tableView.dequeueReusableCell(
        withIdentifier: "OpenItemTableViewCell",
        for: indexPath) as! OpenItemTableViewCell
      let open = openItemData[indexPath.row]
      cell.openItemImageView.image = UIImage(named: open.imageName)
      cell.titleLabel.text = open.title
      cell.contentLabel.text = open.content
      cell.watingCountLabel.text = "\(open.waiter)명이 기다려요"
      
      let fontSize = UIFont.boldSystemFont(ofSize: 13)
      let attributedStr = NSMutableAttributedString(string: cell.watingCountLabel.text!)
      attributedStr.addAttribute(
        .font,
        value: fontSize,
        range: (cell.watingCountLabel.text! as NSString).range(of: "\(open.waiter)"))
      cell.watingCountLabel.attributedText = attributedStr
      return cell
    }  else if indexPath.section == 2 {
      let cell = tableView.dequeueReusableCell(
        withIdentifier: "TalkAlertTitleTableViewCell",
        for: indexPath) as! TalkAlertTitleTableViewCell
      return cell
    } else if indexPath.section == 3 {
      let cell = tableView.dequeueReusableCell(
        withIdentifier: "TalkAlertTableViewCell",
        for: indexPath) as! TalkAlertTableViewCell
      cell.config(with: talkAlertData)
      return cell
    } else if indexPath.section == 4 {
      let cell = tableView.dequeueReusableCell(
        withIdentifier: "OpenItemTableViewCell",
        for: indexPath) as! OpenItemTableViewCell
      let open = secondItemData[indexPath.row]
      cell.openItemImageView.image = UIImage(named: open.imageName)
      cell.titleLabel.text = open.title
      cell.contentLabel.text = open.content
      cell.watingCountLabel.text = "\(open.waiter)명이 기다려요"
      
      let fontSize = UIFont.boldSystemFont(ofSize: 13)
      let attributedStr = NSMutableAttributedString(string: cell.watingCountLabel.text!)
      attributedStr.addAttribute(
        .font,
        value: fontSize,
        range: (cell.watingCountLabel.text! as NSString).range(of: "\(open.waiter)"))
      cell.watingCountLabel.attributedText = attributedStr
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    if indexPath.section == 0 {
      return 130.0
    } else if indexPath.section == 1 {
      return 585.0
    } else if indexPath.section == 2 {
      return 130.0
    } else if indexPath.section == 3 {
      return 190.0
    } else if indexPath.section == 4 {
      return 585.0
    }
    return 0
  }
}
