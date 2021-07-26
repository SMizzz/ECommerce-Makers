//
//  AlarmViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/07/26.
//

import UIKit
import Tabman
import Pageboy

class AlarmViewController: TabmanViewController {
  private var viewControllers: Array<UIViewController> = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewSetup()
  }
  
  func viewSetup() {
    let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "AlarmDetailTabVC")
    let notiVC = self.storyboard?.instantiateViewController(withIdentifier: "NotiTabVC")
    
    viewControllers.append(detailVC!)
    viewControllers.append(notiVC!)
    self.dataSource = self
    let bar = TMBar.ButtonBar()
    bar.backgroundView.style = .blur(style: .light)
    bar.backgroundColor = .white
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    bar.layout.interButtonSpacing = 10
    bar.layout.transitionStyle = .snap
    bar.layout.contentMode = .intrinsic
    bar.indicator.weight = .light
    bar.indicator.tintColor = .black
    bar.buttons.customize { (button) in
      button.tintColor = .black
      button.selectedTintColor = .black
      button.font = UIFont.systemFont(ofSize: 14)
    }
    addBar(bar, dataSource: self, at: .top)
  }
}

extension AlarmViewController: PageboyViewControllerDataSource, TMBarDataSource {
  func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
    return viewControllers.count
  }
  
  func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
    return viewControllers[index]
  }
  
  func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
    return nil
  }
  
  func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
    let item = TMBarItem(title: "")
    switch index {
    case 0:
      item.title = "알림내역"
    default:
      item.title = "공지사항"
    }
    return item
  }
}
