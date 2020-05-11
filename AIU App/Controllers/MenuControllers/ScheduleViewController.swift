//
//  ScheduleViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 2/4/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import WebKit

class ScheduleViewController: UIViewController, WKNavigationDelegate {
    
    //@IBOutlet weak var webView: UIWebView!
    
    var webView: WKWebView!
    
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: "http://com.iaau.edu.kg/calendar/schedule-of-lectures.html")
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
    }
    
}
