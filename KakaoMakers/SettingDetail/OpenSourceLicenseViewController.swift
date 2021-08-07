//
//  OpenSourceLicenseViewController.swift
//  KakaoMakers
//
//  Created by 신미지 on 2021/08/04.
//

import UIKit
import WebKit

class OpenSourceLicenseViewController:
  UIViewController,
  WKNavigationDelegate,
  WKUIDelegate {
  
  @IBOutlet weak var webView: WKWebView!
  
  override func loadView() {
    super.loadView()
    webView = WKWebView(frame: self.view.frame)
    self.view = self.webView!
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    tabBarController?.tabBar.isHidden = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad() 
    let sURL = "https://m.naver.com"
    let request = URLRequest(url: URL(string: sURL)!)
    webView.load(request)
  }

  @IBAction func backBtnTap(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
}
