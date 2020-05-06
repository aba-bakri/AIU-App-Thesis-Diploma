//
//  SignInViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 1/25/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignInViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        errorLabel.isHidden = true
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        checkIfFieldEmpty()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { [weak self] (authResult, error) in
            guard let strongSelf = self else {return }
            if let error = error {
                print(error.localizedDescription)
            }
            
            self?.checkUserInfo()
        }
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyBoard =  UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(identifier: "mainHome")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
    
    func checkIfFieldEmpty() {
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
        
        login()
    }
    
}
