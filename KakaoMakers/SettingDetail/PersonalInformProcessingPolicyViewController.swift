//
//  PersonalInformProcessingPolicyViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/04.
//

import UIKit
import WebKit

class PersonalInformProcessingPolicyViewController: UIViewController {
  
  @IBOutlet weak var webView: WKWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.isHidden = true
    tabBarController?.tabBar.isHidden = true
    loadWebPage("https://buy.kakao.com/shopping-front/user/privacy-policy?channel=MAKERS")
  }
  
  private func loadWebPage(_ url: String) {
    guard let myUrl = URL(string: url) else { return }
    let request = URLRequest(url: myUrl)
    webView.load(request)
  }
  
  @IBAction func deleteBtnTap(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
}
