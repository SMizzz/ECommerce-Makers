//
//  HomeViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/07/26.
//

import UIKit
import Tabman
import Pageboy

class HomeViewController: TabmanViewController {
  private var viewControllers: Array<UIViewController> = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewSetup()
    setLogo()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    tabBarController?.tabBar.isHidden = false
  }
  
  func setLogo() {
    navigationController?.navigationBar.barTintColor = .white
    let kakaoMakersLogoImage = UIImage(named: "kakaomakerslogo")
    let logoImageView = UIImageView(image: kakaoMakersLogoImage)
    logoImageView.contentMode = .scaleAspectFit
    navigationItem.titleView = logoImageView
  }
  
  func viewSetup() {
    let recentVC = self.storyboard?.instantiateViewController(withIdentifier: "RecentReadTabVC")
    let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeTabVC")
    let openVC = self.storyboard?.instantiateViewController(withIdentifier: "OpenTabVC")
    let likeVC = self.storyboard?.instantiateViewController(withIdentifier: "LikeTabVC")
    
    viewControllers.append(recentVC!)
    viewControllers.append(homeVC!)
    viewControllers.append(openVC!)
    viewControllers.append(likeVC!)
    self.dataSource = self
    
    let bar = TMBar.ButtonBar()
    bar.backgroundView.style = .blur(style: .light)
    bar.backgroundColor = .white
    bar.layout.contentMode = .intrinsic
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 63, bottom: 0, right: 55)
    bar.layout.interButtonSpacing = 40
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
  
}

extension HomeViewController:
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
  
  func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
    let item = TMBarItem(title: "")
    if (index == 0) {
      item.title = "최근 본"
    } else if (index == 1) {
      item.title = "홈"
    } else if (index == 2) {
      item.title = "오픈예정"
    } else {
      item.title = "좋아요"
    }
    return item
  }
}
