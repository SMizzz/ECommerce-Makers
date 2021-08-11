//
//  CategoryViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/11.
//

import UIKit
import Tabman
import Pageboy

class CategoryViewController: TabmanViewController {
  private var viewControllers: Array<UIViewController> = []
  override func viewDidLoad() {
    super.viewDidLoad()
    viewSetup()
  }
  
  func viewSetup() {
    let appleVC = self.storyboard?.instantiateViewController(withIdentifier: "CategoryAppleVC")
    let samsungVC = self.storyboard?.instantiateViewController(withIdentifier: "CategorySamsungVC")
    let xiaomiVC = self.storyboard?.instantiateViewController(withIdentifier: "CategoryXiaomiVC")
    let huaweiVC = self.storyboard?.instantiateViewController(withIdentifier: "CategoryHuaweiVC")
    let vivoVC = self.storyboard?.instantiateViewController(withIdentifier: "CategoryVivoVC")
    viewControllers.append(appleVC!)
    viewControllers.append(samsungVC!)
    viewControllers.append(xiaomiVC!)
    viewControllers.append(huaweiVC!)
    viewControllers.append(vivoVC!)
    
    self.dataSource = self
    
    let bar = TMBar.TabBar()
    bar.backgroundColor = .white
    bar.backgroundView.style = .clear
//    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 55)
    bar.layout.transitionStyle = .snap
    bar.indicator.tintColor = .clear
    
    bar.buttons.customize { (button) in
      button.font = UIFont.systemFont(ofSize: 13)
      button.tintColor = .darkGray
      button.selectedTintColor = .blue
    }
    addBar(bar, dataSource: self, at: .top)
  }
}

extension CategoryViewController:
  PageboyViewControllerDataSource,
  TMBarDataSource {
  func numberOfViewControllers(
    in pageboyViewController: PageboyViewController
  ) -> Int {
    return viewControllers.count
  }
  
  func viewController(
    for pageboyViewController: PageboyViewController,
    at index: PageboyViewController.PageIndex
  ) -> UIViewController? {
    return viewControllers[index]
  }
  
  func defaultPage(
    for pageboyViewController: PageboyViewController
  ) -> PageboyViewController.Page? {
    return nil
  }
  func barItem(
    for bar: TMBar,
    at index: Int
  ) -> TMBarItemable {
    let item = TMBarItem(title: "")
    if (index == 0) {
      item.image = UIImage(named: "applelogo")
      item.title = "애플"
    } else if (index == 1) {
      item.image = UIImage(named: "samsunglogo")
      item.title = "삼성"
    } else if (index == 2) {
      item.image = UIImage(named: "xiaomi")
      item.title = "샤오미"
    } else if (index == 3) {
      item.image = UIImage(named: "huaweilogo")
      item.title = "화웨이"
    } else {
      item.image = UIImage(named: "vivologo-2")
      item.title = "비보"
    }
    return item
  }
}
