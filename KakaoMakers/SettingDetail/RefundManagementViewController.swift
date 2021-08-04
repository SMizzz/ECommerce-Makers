//
//  RefundManagementViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/04.
//

import UIKit

class RefundManagementViewController: UIViewController {
  
  @IBOutlet weak var changeButton: UIButton!
  @IBOutlet weak var deleteButton: UIButton!
  @IBOutlet weak var bottomView: UIView!
  
  let informVC = KaKaoInformViewController(
    nibName: "KaKaoInformTestViewController",
    bundle: nil)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addKakaoInformView(vc: self)
    configureButton()
    informVC.InformDetailView.isHidden = true
    tabBarController?.tabBar.isHidden = true
  }
  
  func addKakaoInformView(vc: UIViewController) {
    bottomView.addSubview(informVC.view)
    vc.addChild(informVC)
  }
  
  private func configureButton() {
    changeButton.layer.cornerRadius = 20
    deleteButton.layer.cornerRadius = 20
    
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
    }
  }
  
  

  @IBAction func backBtnTap(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func changeBtnTap(_ sender: Any) {
    
  }
}
