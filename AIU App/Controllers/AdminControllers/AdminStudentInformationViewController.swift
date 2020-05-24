//
//  AdminStudentInformationViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/24/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class AdminStudentInformationViewController: UIViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var studentIdLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var firstNameText: String? = nil
    var lastNameText: String? = nil
    var emailText: String? = nil
    var departmentText: String? = nil
    var studentIdText: String? = nil
    var phoneText: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Student Information"
        navigationItem.backBarButtonItem?.title = "Back"
        setStudentInformation()
        
    }

    func setStudentInformation() {
        firstNameLabel.text = firstNameText
        lastNameLabel.text = lastNameText
        emailLabel.text = emailText
        studentIdLabel.text = studentIdText
        departmentLabel.text = departmentText
        phoneLabel.text = phoneText
    }
}
