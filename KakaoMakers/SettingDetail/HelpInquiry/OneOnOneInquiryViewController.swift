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
  
  let informVC = BottomInformViewController(
    nibName: "BottomInformViewController",
    bundle: nil)
  
  let informDetailVC = BottomDetailViewController(
    nibName: "BottomDetailViewController",
    bundle: nil)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    informDetailVC.view.isHidden = true
    addKakaoInformView(vc: self)
    tabBarController?.tabBar.isHidden = true
    configureButton()
  }
  
  func addKakaoInformView(vc: UIViewController) {
    bottomView.addSubview(informVC.view)
    vc.addChild(informVC)
    
    bottomDetailView.addSubview(informDetailVC.view)
    vc.addChild(informDetailVC)
  }
  
  private func configureButton() {
    informVC.kakaoCommerceButton.addTarget(
      self,
      action: #selector(handleKakaoCommerceLogoButton),
      for: .touchUpInside)
  }
  
  @objc func handleKakaoCommerceLogoButton() {
    if informVC.kakaoCommerceButton.tag == 0 {
      informVC.kakaoCommerceButton.setImage(
        UIImage(named: "cashKaKaoCommerceLogo_up"),
        for: .normal)
      informVC.kakaoCommerceButton.tag = 1
      informDetailVC.view.isHidden = false
    } else {
      informVC.kakaoCommerceButton.setImage(
        UIImage(named: "cashKaKaoCommerceLogo_down"),
        for: .normal)
      informVC.kakaoCommerceButton.tag = 0
      informDetailVC.view.isHidden = true
    }
  }
  
}
