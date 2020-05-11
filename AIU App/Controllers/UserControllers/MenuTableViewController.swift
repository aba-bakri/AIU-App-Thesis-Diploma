//
//  MenuViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 1/31/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import Firebase

class MenuTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func signOutCellTapped() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        
        let storyBoard =  UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "Firstcontroller")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = UITableViewCell(style: .default, reuseIdentifier: "signOut")
        signOutCellTapped()
    }
}
