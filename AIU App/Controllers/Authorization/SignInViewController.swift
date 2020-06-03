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
        
        navigationController?.navigationBar.prefersLargeTitles = true
        errorLabel.isHidden = true
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        login()
    }
    
    func login() {
        
        //Create cleaned versions of the text fields
        let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
            
            if error != nil {
                //Couldn't sign in
                self?.errorLabel.text = error!.localizedDescription
                self?.errorLabel.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    self?.errorLabel.isHidden = true
                }
            } else {
                
                if Auth.auth().currentUser?.email == "pmsaiuapp@gmail.com" {
                    self?.transitionAdminToHome()
                } else {
                    
                    if Auth.auth().currentUser?.isEmailVerified == true {
                        if Auth.auth().currentUser != nil {
                            self?.transitionToHome()
                        }
                    } else {
                        let alertController = UIAlertController(title: nil, message: "Verify your email", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self!.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    func transitionToHome() {
        let storyBoard =  UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "Home")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func transitionAdminToHome() {
        let storyBoard =  UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "adminHome") as! HomeAdminViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
