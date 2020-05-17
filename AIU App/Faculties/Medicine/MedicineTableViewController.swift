//
//  MedicineTableViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/16/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class MedicineTableViewController: UITableViewController {

    let departmentUrl = ["http://med.alatoo.edu.kg"]
    let departmentTitle = ["Medicine"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Medicine"
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
