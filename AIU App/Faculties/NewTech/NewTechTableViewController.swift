//
//  NewTechTableViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/16/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class NewTechTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Engineering and Informatics"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let storyBoard =  UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(identifier: "MenuTableViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}
