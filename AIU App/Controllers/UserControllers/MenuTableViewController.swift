//
//  MenuViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 1/31/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class MenuTableViewController: UITableViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    @IBOutlet weak var studentIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        observeUserInformation()
    }
    
    func observeUserInformation() {
        let ref = Database.database().reference()
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        ref.child("User").child(uid).observe(.value, with: { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                self.nameLabel.text = dict["firstName"] as? String
                self.surnameLabel.text = dict["lastName"] as? String
                self.studentIdLabel.text = dict["studentId"] as? String
            }
        })

    }
    
//    func signOutCellTapped() {
//        do {
//            try Auth.auth().signOut()
//        } catch {
//            print(error)
//        }
//
//        let storyBoard =  UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyBoard.instantiateViewController(identifier: "Firstcontroller")
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        _ = UITableViewCell(style: .default, reuseIdentifier: "signOut")
//        signOutCellTapped()
//    }
}
