//
//  CampusViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 6/2/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class AlaTooInformationViewController: UIViewController {
    
    @IBOutlet weak var alatooInfoImage: UIImageView!
    @IBOutlet weak var alatooInfoDecs: UITextView!
    var alatooInfoTitle = ""
    var alatooInfoDecss = ""
    var alatooInfoImagess = UIImage(named: "")
    
    override func loadView() {
        super.loadView()
        title = alatooInfoTitle
        alatooInfoDecs.text = alatooInfoDecss
        alatooInfoImage.image = alatooInfoImagess
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
