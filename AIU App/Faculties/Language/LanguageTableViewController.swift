//
//  LanguageTableViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/16/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class LanguageTableViewController: UITableViewController {

    let departmentUrl = ["http://kg.iaau.edu.kg", "http://ru.iaau.edu.kg", "http://hazirlik.iaau.edu.kg", "http://preparatory.iaau.edu.kg"]
    let departmentTitle = ["Kyrgyz Language Teaching", "Russian Language Teaching", "Turkish Language Teaching", "English Language Teaching"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Institute of Languages"
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
