//
//  MailViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 3/2/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import WebKit

class MailViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://gmail.com")
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
    }

}
