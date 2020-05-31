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
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        navigationController?.navigationBar.prefersLargeTitles = false
        errorLabel.isHidden = true
        
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let error = validateFields()
        if error != nil {
            //There's something wrong with the fields, show error message
            showError(error!)
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                self.errorLabel.isHidden = true
            }
        } else {
            signUp()
        }
    }
    
    func signUp() {
        
        //Create cleaned versions of the data
        let firstName = firstNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let studentId = studentIdField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let department = departmentField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = phoneField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Create the user
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let user = authResult?.user, error == nil else { return }
            
            //Check for errors
            if error != nil {
                // There was an error creating the user
                self.showError("Error creating user")
            } else {
                
                self.ref = Database.database().reference()
                
                let userObject = [
                    "firstName": firstName,
                    "lastName" : lastName,
                    "email" : email,
                    "studentId" : studentId,
                    "department" : department,
                    "phone" : phone,
                ]
                
                //User was created successfuly, now store the fields
                self.ref.child("User").child(user.uid).setValue(userObject)
                
                //Transition to the home screen
                self.transitionToHome()
            }
        }
    }
    
    
    func validateFields() -> String? {
        
        //Check that all fields are filled in
        if firstNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in your firstname"
        }
        if lastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in your lastname"
        }
        
        let cleanedEmail = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isEmailValid(cleanedEmail) == false {
            return "Please make sure email is @iaau.edu.kg"
        }
        
        if studentIdField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in your student id"
        }
        if departmentField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in your department"
        }
        if departmentField.text!.count < 6 || departmentField.text!.count > 6 {
            return "Please fill in department field correctly"
        }
        if phoneField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in your phone"
        }
        if phoneField.text!.count < 10 || phoneField.text!.count > 10 {
            return "Please fill in phone number field correctly"
        }
        
        //Check if the password is secure
        let cleanedPassword = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a special character and a number"
        }
        
        return nil
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
    func transitionToHome() {
        let storyBoard =  UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "Home")
        navigationController?.pushViewController(vc, animated: true)
    }
}
