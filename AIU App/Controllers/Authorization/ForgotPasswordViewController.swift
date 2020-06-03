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
    @IBOutlet weak var errorLibel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Forgot Password"
        errorLibel.isHidden = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func resetPasswordButtonTapped(_ sender: Any) {
        
        let error = validatePasswordField()
        if error != nil {
            showError(error!)
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                self.errorLibel.isHidden = true
            }
        } else {
            guard let email = emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines), email != "" else {
                return
            }
            Auth.auth().sendPasswordReset(withEmail: email, completion: nil)
            navigationController?.popViewController(animated: true)
        }
    }
    
    func validatePasswordField() -> String? {
        let cleanedEmail = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isEmailValid(cleanedEmail) == false {
            return "Please make sure email is @iaau.edu.kg"
        }
        
        return nil
    }
    
    func showError(_ message: String) {
        errorLibel.text = message
        errorLibel.isHidden = false
    }

}
