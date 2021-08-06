//
//  ProductInquiryViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/05.
//

import UIKit

class ProductInquiryViewController: UIViewController {
  
  @IBOutlet weak var bottomView: UIView!
  
  @IBOutlet weak var stackView: UIStackView!
  let informVC = KaKaoInformViewController(
    nibName: "KaKaoInformTestViewController",
    bundle: nil)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addKakaoInformView(vc: self)
    informVC.InformDetailView.isHidden = true
    tabBarController?.tabBar.isHidden = true
    configureButton()
  }
  
  func addKakaoInformView(vc: UIViewController) {
    bottomView.addSubview(informVC.view)
    vc.addChild(informVC)
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
      informVC.InformDetailView.isHidden = false
      informVC.kakaoCommerceButton.tag = 1
    } else {
      informVC.kakaoCommerceButton.setImage(
        UIImage(named: "cashKaKaoCommerceLogo_down"),
        for: .normal)
      informVC.InformDetailView.isHidden = true
      informVC.kakaoCommerceButton.tag = 0
      stackView.frame.size.height += 265
    }
  }
  
  
}
