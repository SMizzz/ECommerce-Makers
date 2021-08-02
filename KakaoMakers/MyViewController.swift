//
//  SettingViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/02.
//

import UIKit

class MyViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    setupNavBar()
    // Do any additional setup after loading the view.
  }
  func setupNavBar() {
  let rightButton = UIButton()
  rightButton.setTitle("Leave", for: .normal)
//  rightButton.addTarget(self, action: #selector(rightButtonTapped(button:)), for: .touchUpInside)
  navigationController?.navigationBar.addSubview(rightButton)
  rightButton.tag = 97
  rightButton.frame = CGRect(x: self.view.frame.width, y: 0, width: 120, height: 20)

  let targetView = self.navigationController?.navigationBar
  let trailingConstraint = NSLayoutConstraint(item: rightButton, attribute:
      .trailingMargin, relatedBy: .equal, toItem: targetView,
                       attribute: .trailingMargin, multiplier: 1.0, constant: -16)
  let bottomConstraint = NSLayoutConstraint(item: rightButton, attribute: .bottom, relatedBy: .equal,
                                            toItem: targetView, attribute: .bottom, multiplier: 1.0, constant: -6)
  rightButton.translatesAutoresizingMaskIntoConstraints = false
  NSLayoutConstraint.activate([trailingConstraint, bottomConstraint])
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
