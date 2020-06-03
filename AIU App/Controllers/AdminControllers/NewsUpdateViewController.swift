//
//  NewsUpdateViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/30/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import Firebase

class NewsUpdateViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        observeNewsInformation()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        updateNews()
    }
    
    func setupNavBar() {
        title = "Edit News"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.backBarButtonItem?.title = "Back"
    }
    
    func updateNews() {
        //Data that stored in firebse
        let title = titleField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let location = locationField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let time = timeField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let description = descriptionTextView.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let newsRef = Database.database().reference()
        
        guard let key = newsRef.child("News").childByAutoId().key else { return }
            
        let news = [
            "title": title,
            "location" : location,
            "time" : time,
            "description" : description
        ]
        
        let childUpdates = ["/News/\(key)": news]
        
        newsRef.updateChildValues(childUpdates)
        navigationController?.popViewController(animated: true)
    }
    
    func observeNewsInformation() {
        
//        let ref = Database.database().reference().child("News/\(key)").observe(.value) { (snapshot) in
//            print(snapshot.value)
//        }
        
//        ref.child("News").childByAutoId().observe(.value, with: { (snapshot) in
//            if let dict = snapshot.value as? [String: Any] {
//                self.titleField.text = dict["title"] as? String
//                self.locationField.text = dict["location"] as? String
//                self.timeField.text = dict["time"] as? String
//                self.descriptionTextView.text = dict["description"] as? String
//            }
//        })
    }

}
