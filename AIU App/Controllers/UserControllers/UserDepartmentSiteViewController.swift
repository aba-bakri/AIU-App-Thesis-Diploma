//
//  FeedbackViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 6/4/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import WebKit
import Firebase
class UserDepartmentSiteViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    var departmentUrl = ""
    
    override func loadView() {
        super.loadView()
        navigationController?.navigationBar.prefersLargeTitles = false
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: departmentUrl)
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
    }
}
