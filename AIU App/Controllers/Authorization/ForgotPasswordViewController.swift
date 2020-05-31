//
//  ForgotPasswordViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 6/1/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Forgot Password"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func resetPasswordButtonTapped(_ sender: Any) {
        guard let email = emailField.text, email != "" else {
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email, completion: nil)
        navigationController?.popViewController(animated: true)
    }

}
