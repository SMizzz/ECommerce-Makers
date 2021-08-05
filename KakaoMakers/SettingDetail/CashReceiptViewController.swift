//
//  CashReceiptViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/04.
//

import UIKit

class CashReceiptViewController: UIViewController {
  
  @IBOutlet weak var kakaoCommerceButton: UIButton!
  @IBOutlet weak var kakaoCommerceInformView: UIView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.barTintColor = .white
    tabBarController?.tabBar.isHidden = true
    kakaoCommerceInformView.isHidden = true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.navigationBar.isHidden = false
  }
  
  @IBAction func backBtnTap(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func homeBtnTap(_ sender: Any) {
    
  }
  
  @IBAction func registerBtnTap(_ sender: Any) {
    
  }
  
  @IBAction func customerInquiryBtnTap(_ sender: Any) {
    
  }
  
  
  @IBAction func termsAndConditionsBtnTap(_ sender: Any) {
    
  }
  
  
  @IBAction func personalInformationProcessingPolicyBtnTap(_ sender: Any) {
    
  }

  @IBAction func intellectualPropertyProtectionCenterBtnTap(_ sender: Any) {
    
  }
  
  
  @IBAction func kakaoCommerceBtnTap(_ sender: Any) {
    if kakaoCommerceButton.tag == 0 {
      kakaoCommerceButton.setImage(UIImage(named: "cashKaKaoCommerceLogo_up"), for: .normal)
      kakaoCommerceInformView.isHidden = false
      kakaoCommerceButton.tag = 1
    } else {
      kakaoCommerceButton.setImage(UIImage(named: "cashKaKaoCommerceLogo_down"), for: .normal)
      kakaoCommerceInformView.isHidden = true
      kakaoCommerceButton.tag = 0
    }
  }
}
