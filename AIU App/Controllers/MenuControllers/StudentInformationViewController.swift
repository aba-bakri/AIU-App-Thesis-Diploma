    //
//  StudentInformationViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 1/25/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class StudentInformationViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var studentIdLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        
        observeUserInformation()
    }
    
    func observeUserInformation() {
        let ref = Database.database().reference()
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        ref.child("User").child(uid).observe(.value, with: { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                self.nameLabel.text = dict["firstName"] as? String
                self.surnameLabel.text = dict["lastName"] as? String
                self.emailLabel.text = dict["email"] as? String
                self.studentIdLabel.text = dict["studentId"] as? String
                self.departmentLabel.text = dict["department"] as? String
                self.phoneLabel.text = dict["phone"] as? String
            }
        })

    }

}
