//
//  RegistrationViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/5/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var studentIdField: UITextField!
    @IBOutlet weak var departmentField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Sign Up"
        navigationController?.navigationBar.prefersLargeTitles = false
        errorLabel.isHidden = true
        
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        checkIfFieldEmpty()
        signUp()
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else { return }
            
            let storyBoard =  UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(identifier: "mainHome")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
    
    
    func checkIfFieldEmpty() {
        errorLabel.isHidden = false
        
        if firstNameField.text!.isEmpty {
            errorLabel.text = "Firstname can't be empty"
            errorLabel.isHidden = false
            return
        }
        
        if lastNameField.text!.isEmpty {
            errorLabel.text = "Lastname can't be empty"
            errorLabel.isHidden = false
            return
        }
        
        if studentIdField.text!.isEmpty {
            errorLabel.text = "Student Id can't be empty"
            errorLabel.isHidden = false
            return
        }
        
        if departmentField.text!.isEmpty {
            errorLabel.text = "Department field can't be empty"
            errorLabel.isHidden = false
            return
        }
        
        if phoneField.text!.isEmpty {
            errorLabel.text = "Phone field can't be empty"
            errorLabel.isHidden = false
            return
        }
        
        if emailField.text!.isEmpty == true {
            errorLabel.text = "Email address can't be empty"
            errorLabel.isHidden = false
            return
        }
        if passwordField.text!.isEmpty == true {
            errorLabel.text = "Password can't be empty"
            errorLabel.isHidden = false
            return
        }
    }
}
