//
//  UpdateProfileViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/21/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class UpdateProfileViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var departmentField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let error = validateFields()
        if error != nil {
            //There's something wrong with the fields, show error message
            showError(error!)
            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                self.errorLabel.isHidden = true
            }
        } else {
            updateUserProfile()
        }
    }
    
    func updateUserProfile() {
        
        //Create cleaned versions of the data
        let firstName = firstNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let department = departmentField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = phoneField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard let userID = Auth.auth().currentUser?.uid else { return }
//        let userObject = [
//            "firstName": firstName,
//            "lastName" : lastName,
//            "department" : department,
//            "phone" : phone,
//        ]
//
//        //User was created successfuly, now store the fields
//        self.ref.child(key).setValue(userObject)
//        navigationController?.popViewController(animated: true)
        
        let userObject = [
            "firstName": firstName,
            "lastName" : lastName,
            "department" : department,
            "phone" : phone,
        ]
        
        ref.child(userID).setValue(userObject) { (error, ref) in
            if error != nil {
                print(error?.localizedDescription)
            }
        }
    }
    
    
    func setupNavBar() {
        title = "Update Profile"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backBarButtonItem?.title = "Back"
        errorLabel.isHidden = true
    }
    
    func validateFields() -> String? {
        
        //Check that all fields are filled in
        if firstNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in your firstname"
        }
        if lastNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in your lastname"
        }
        if departmentField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in your department"
        }
        if phoneField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in your phone"
        }
        
        return nil
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
    func transitionToMenu() {
        //
        print("Something")
    }

}
