//
//  OpenSourceLicenseViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/04.
//

import UIKit
import WebKit

class OpenSourceLicenseViewController: UIViewController {
  
  @IBOutlet weak var webView: WKWebView!
  override func viewDidLoad() {
    super.viewDidLoad()
    tabBarController?.tabBar.isHidden = true
    loadWebPage("https://www.google.com")
  }
  
  private func loadWebPage(_ url: String) {
    guard let myUrl = URL(string: url) else { return }
    let request = URLRequest(url: myUrl)
    webView.load(request)
  }
  
  @IBAction func backBtnTap(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
}
