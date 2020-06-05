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
import MessageUI

class MenuTableViewController: UITableViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    @IBOutlet weak var studentIdLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeUserInformation()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "UserDepartmentSiteViewController") as! UserDepartmentSiteViewController
            if (departmentLabel.text?.contains("COM"))! {
                vc.title = "Computer Science"
                vc.departmentUrl = "com.iaau.edu.kg"
            } else if ((departmentLabel.text?.contains("MAN"))!) {
                vc.title = "Management"
                vc.departmentUrl = "management.iaau.edu.kg"
            }
            navigationController?.pushViewController(vc, animated: true)
        }
        
        if indexPath.row == 10 {
            let mail = showMailComposer()
            
            if MFMailComposeViewController.canSendMail() {
                self.present(mail, animated: true, completion: nil)
            }
        }
    }
    
    func showMailComposer() -> MFMailComposeViewController{
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["info@iaau.edu.kg"])
        composer.setSubject("")
        composer.setMessageBody("", isHTML: false)
        return composer
    }
    
    func observeUserInformation() {
        let ref = Database.database().reference()
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        ref.child("User").child(uid).observe(.value, with: { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                self.nameLabel.text = dict["firstName"] as? String
                self.surnameLabel.text = dict["lastName"] as? String
                self.studentIdLabel.text = dict["studentId"] as? String
                self.departmentLabel.text = dict["department"] as? String
            }
        })

    }
}

extension MenuTableViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            //Show error alert
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("Email Sent")
        @unknown default:
            break
        }
        
        controller.dismiss(animated: true)
    }
}
