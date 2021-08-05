//
//  HelpInquiryViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/05.
//

import UIKit
import Tabman
import Pageboy

class HelpInquiryViewController: TabmanViewController {
  private var viewControllers: Array<UIViewController> = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewSetup()
  }
  
  func viewSetup() {
    let helpVC = self.storyboard?.instantiateViewController(withIdentifier: "HelpVC")
    let oneOnOneInquiryVC = self.storyboard?.instantiateViewController(withIdentifier: "OneOnOneInquiryVC")
    let productInquiryVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductInquiryVC")
    
    viewControllers.append(helpVC!)
    viewControllers.append(oneOnOneInquiryVC!)
    viewControllers.append(productInquiryVC!)
    self.dataSource = self
    
    let bar = TMBar.ButtonBar()
    bar.backgroundView.style = .blur(style: .light)
    bar.backgroundColor = .white
    bar.layout.contentMode = .fit
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    bar.layout.interButtonSpacing = 50
    bar.layout.transitionStyle = .snap
    bar.indicator.weight = .light
    bar.indicator.tintColor = .black
    bar.buttons.customize { (button) in
      button.tintColor = .black
      button.selectedTintColor = .black
      button.font = UIFont.systemFont(ofSize: 16)
    }
    addBar(bar, dataSource: self, at: .top)
  }
  
  @IBAction func backBtnTap(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
}

extension HelpInquiryViewController: PageboyViewControllerDataSource, TMBarDataSource {
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
      item.title = "도움말"
    } else if (index == 1) {
      item.title = "1:1 문의"
    } else if (index == 2) {
      item.title = "제품 문의"
    }
    return item
  }
}
