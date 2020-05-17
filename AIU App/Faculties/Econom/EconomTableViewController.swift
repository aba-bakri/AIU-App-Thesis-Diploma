//
//  EconomTableViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/16/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class EconomTableViewController: UITableViewController {

    let departmentUrl = ["http://economy.iaau.edu.kg", "http://fin.iaau.edu.kg", "http://ir.iaau.edu.kg", "http://management.iaau.edu.kg", "http://law.iaau.edu.kg"]
    let departmentTitle = ["Economics", "Finance & Banking", "International Relations", "Management", "Law"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Economics and Management"
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
