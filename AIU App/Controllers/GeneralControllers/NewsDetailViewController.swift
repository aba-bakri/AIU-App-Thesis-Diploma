//
//  NewsDetailViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/29/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import Firebase

class NewsDetailViewController: UIViewController {

    
    @IBOutlet weak var titileLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionView: UITextView!
    
    var titleText: String? = nil
    var locationText: String? = nil
    var detailImageView: UIImage?
    var descriptionText: String? = nil
    var dateText: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = dateText
        setNewsDetailInformation()
        checkAdmin()
    }
    
    func setNewsDetailInformation() {
        titileLabel.text = titleText
        locationLabel.text = locationText
        descriptionView.text = descriptionText
        imageView.image = detailImageView
    }
    
    func checkAdmin() {
        if Auth.auth().currentUser?.email == "pmsaiuapp@gmail.com" {
            setupNavBar()
        }
    }
    
    func setupNavBar() {
        navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteNews)), UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(updateNews))]
    }
    
    @objc func updateNews() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "NewsUpdateViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func deleteNews() {
//        let alertController = UIAlertController(title: "Are you sure ?", message: nil, preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
//        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (_) in
//            let ref = Database.database().reference().child("News").childByAutoId()
//            ref.removeValue { _,_  in
//                self.navigationController?.popViewController(animated: true)
//            }
//
//            print("Yes or Yes")
//        }))
//        present(alertController, animated: true, completion: nil)
    }

}
