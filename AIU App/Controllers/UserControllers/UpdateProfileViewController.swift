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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        observeUserInformation()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        updateUserProfile()
    }
    
    func updateUserProfile() {
        //Data that stored in firebse
        let firstName = firstNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let department = departmentField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = phoneField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let userRef = Database.database().reference().child("User").child(Auth.auth().currentUser!.uid)
        
        let userObject = [
            "firstName": firstName,
            "lastName" : lastName,
            "department" : department,
            "phone" : phone,
        ]
        
        userRef.updateChildValues(userObject)
        transitionToStudentInformation()
    }
    
    
    func setupNavBar() {
        title = "Edit Profile"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backBarButtonItem?.title = "Back"
    }
    
    func transitionToStudentInformation() {
        navigationController?.popViewController(animated: true)
    }
    
    func observeUserInformation() {
        let ref = Database.database().reference()
    
        guard let uid = Auth.auth().currentUser?.uid else { return }
    
        ref.child("User").child(uid).observe(.value, with: { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                self.firstNameField.text = dict["firstName"] as? String
                self.lastNameField.text = dict["lastName"] as? String
                self.departmentField.text = dict["department"] as? String
                self.phoneField.text = dict["phone"] as? String
            }
        })
        
        UserService.observeUserProfile(uid) { (userProfile) in
            UserService.currentUserProfile = userProfile
        }
    }

}
