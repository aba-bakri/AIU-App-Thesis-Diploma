//
//  ScheduleViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 2/4/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: "http://electronic.iaau.edu.kg")
        
        webView.loadRequest(URLRequest(url: url!))
    }
    
}
