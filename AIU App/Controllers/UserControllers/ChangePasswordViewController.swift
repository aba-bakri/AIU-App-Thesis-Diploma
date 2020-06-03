//
//  ChangePasswordViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 6/3/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import Firebase

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var passwordChangeField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Change Password"
        navigationController?.navigationBar.prefersLargeTitles = true
        errorLabel.isHidden = true
    }
    
    
    @IBAction func changePasswordButtonTapped(_ sender: Any) {
        
        let error = validatePasswordField()
        if error != nil {
            showError(error!)
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                self.errorLabel.isHidden = true
            }
        } else {
            let newPassword = passwordChangeField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().currentUser?.updatePassword(to: newPassword, completion: { (error) in
                if error != nil {
                    self.showError("Error while changing password")
                }
                
                let alertController = UIAlertController(title: nil, message: "Password changed successfully", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action) in
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(alertController, animated: true, completion: nil)
            })
        }
    }
    
    func validatePasswordField() -> String? {
        let cleanedPassword = passwordChangeField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a special character and a number"
        }
        
        return nil
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
}
