//
//  NewTechTableViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/16/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class NewTechTableViewController: UITableViewController {

    let departmentUrl = ["http://com.iaau.edu.kg", "http://electronic.iaau.edu.kg", "http://mat.iaau.edu.kg", "http://ie.iaau.edu.kg"]
    let departmentTitle = ["Computer Science", "Electronics and Nanoelectronics", "Applied Mathematics & Informatics", "Industrial Engineering"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Engineering and Informatics"
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
