//
//  OneOnOneInquiryViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/05.
//

import UIKit

class OneOnOneInquiryViewController: UIViewController {
  @IBOutlet weak var bottomView: UIView!
  @IBOutlet weak var stackView: UIStackView!
  @IBOutlet weak var bottomDetailView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tabBarController?.tabBar.isHidden = true
  }
  
}
