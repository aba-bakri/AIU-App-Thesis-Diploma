////
////  AllStudentsViewController.swift
////  AIU App
////
////  Created by Aba-Bakri on 5/23/20.
////  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
////
//
//import UIKit
//import Firebase
//
//class AllStudentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    var news = [News]()
//    var tableView: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        title = "All Students"
//        tableView = UITableView(frame: view.bounds, style: .plain)
//        let cellNib = UINib(nibName: "NewsTableViewCell", bundle: nil)
//        tableView.register(cellNib, forCellReuseIdentifier: "newsCell")
//        tableView.tableFooterView = UIView()
//        view.addSubview(tableView)
//
//        var layoutGuide: UILayoutGuide!
//
//        if #available(iOS 11.0, *) {
//            layoutGuide = view.safeAreaLayoutGuide
//        } else {
//            layoutGuide = view.layoutMarginsGuide
//        }
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
//        tableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
//        tableView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
//        
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.reloadData()
//        observeNews()
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return news.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
////        cell.setStudent(user: users[indexPath.row])
//        cell.setNews(news: news[indexPath.row])
//        return cell
//    }
//
//    func observeNews() {
//        let userRef = Database.database().reference().child("User")
//
//        userRef.observe(.value) { (snapshot) in
//
//            var tempUsers = [News]()
//
//            for child in snapshot.children {
//                if let childSnapshot = child as? DataSnapshot,
//                    let dict = childSnapshot.value as? [String: Any],
//                    let name = dict["name"] as? String,
//                    let surname = dict["surname"] as? String,
//                    let email = dict["email"] as? String,
//                    let studentId = dict["studentId"] as? String,
//                    let department = dict["department"] as? String,
//                    let phone = dict["phone"] as? String,
//                    let imageUrl = URL(string: email) {
//
//                    let users = News(title: name, description: surname, imageUrl: imageUrl, location: department, date: phone)
//                        tempUsers.append(users)
//                    }
//                }
//            self.news = tempUsers
//            self.tableView.reloadData()
//        }
//    }
//
//}


//
//  HomeAdminViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/18/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import Firebase

class AllStudentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var users = [User(firstName: "aba", lastName: "lastname", email: " s", studentId: " s", department: " sdf", phone: " s")]
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        observeNews()
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
    
    func observeNews() {
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
            self.tableView.reloadData()
        }
    }
}
