//
//  UniversityViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/16/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import WebKit

class UniversitySiteViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "University Site"
        // Do any additional setup after loading the view.
        
        let url = URL(string: "http://iaau.edu.kg")
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
    }

}
