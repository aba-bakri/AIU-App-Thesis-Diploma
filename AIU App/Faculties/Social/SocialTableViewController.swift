//
//  SocialTableViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/16/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class SocialTableViewController: UITableViewController {

    let departmentUrl = ["http://turkology.iaau.edu.kg", "http://journalism.iaau.edu.kg", "http://pcg.iaau.edu.kg"]
    let departmentTitle = ["Foreign Philology", "Journalism", "Pedagogy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Social Sciences"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard =  UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "DepartmentsViewController") as? DepartmentsViewController
        vc?.departmentUrl = departmentUrl[indexPath.row]
        vc?.departmentTitle = departmentTitle[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}
