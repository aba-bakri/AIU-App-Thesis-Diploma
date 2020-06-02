//
//  ActivitiesViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 6/2/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    
    @IBOutlet weak var activitiesImage: UIImageView!
    @IBOutlet weak var activitiesDesc: UITextView!
    var activitiesTitle = ""
    var activitiesDescc = ""
    var activitiesImagess = UIImage(named: "")
    
    override func loadView() {
        super.loadView()
        title = activitiesTitle
        activitiesDesc.text = activitiesDescc
        activitiesImage.image = activitiesImagess
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
    }
}
