//
//  AllStudentsViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/23/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.

import UIKit
import Firebase

class AllStudentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var users = [User]()
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        observeUsers()
    }
    
    func configureTableView() {
        title = "All Students"
        tableView = UITableView(frame: view.bounds, style: .plain)
        let cellNib = UINib(nibName: "StudentTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "studentCell")
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        view.addSubview(tableView)
        
        var layoutGuide: UILayoutGuide!
        
        if #available(iOS 11.0, *) {
            layoutGuide = view.safeAreaLayoutGuide
        } else {
            layoutGuide = view.layoutMarginsGuide
        }
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! StudentTableViewCell
        cell.setStudent(user: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "AdminStudentsInformationViewController") as? AdminStudentInformationViewController
//        vc.firstNameLabel!.text = users[indexPath.row].firstName
        vc?.firstNameText = users[indexPath.row].firstName
        vc?.lastNameText = users[indexPath.row].lastName
        vc?.emailText = users[indexPath.row].email
        vc?.studentIdText = users[indexPath.row].studentId
        vc?.departmentText = users[indexPath.row].department
        vc?.phoneText = users[indexPath.row].phone
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func observeUsers() {
        let userRef = Database.database().reference().child("User")

        userRef.observe(.value) { (snapshot) in

            var tempUsers = [User]()

            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String: Any],
                    let name = dict["firstName"] as? String,
                    let surname = dict["lastName"] as? String,
                    let email = dict["email"] as? String,
                    let studentId = dict["studentId"] as? String,
                    let department = dict["department"] as? String,
                    let phone = dict["phone"] as? String {

                    let users = User(firstName: name, lastName: surname, email: email, studentId: studentId, department: department, phone: phone)
                        tempUsers.append(users)
                    }
                }
            self.users = tempUsers
//            self.users.sort { (first, second) -> Bool in
//                return first.firstName < second.firstName
//            }
            self.tableView.reloadData()
        }
    }
}