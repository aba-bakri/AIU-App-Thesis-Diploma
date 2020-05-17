//
//  DepartmentsViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/17/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import WebKit

class DepartmentsViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    var departmentUrl = ""
    var departmentTitle = ""
    
    override func loadView() {
        title = departmentTitle
        navigationController?.navigationBar.prefersLargeTitles = false
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: departmentUrl)
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
    }

}
