//
//  AddNewsViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/23/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import Firebase

class AddNewsViewController: UIViewController {
    
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addImageButton: UIButton!
        
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//
//        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
//        imageView.isUserInteractionEnabled = true
//        imageView.addGestureRecognizer(imageTap)
//        imageView.layer.cornerRadius = imageView.bounds.height / 2
//        imageView.clipsToBounds = true
        
//        imagePicker = UIImagePickerController()
//        imagePicker.allowsEditing = true
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.delegate = self
    }

//    @objc func openImagePicker(_ sender:Any) {
//        // Open Image Picker
//        self.present(imagePicker, animated: true, completion: nil)
//    }
    
    
    @IBAction func addNewsButtonTapped(_ sender: Any) {
        
        let title = timeField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let location = locationField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let time = timeField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let description = descriptionTextView.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Create the news
        
        let newsRef = Database.database().reference().child("News").childByAutoId()
        
        let newsObject = [
            "title": title,
            "location" : location,
            "time" : time,
            "description" : description,
            "image" : ""
        ]
        
        newsRef.setValue(newsObject) { (error, ref) in
            if error == nil {
                self.navigationController?.popViewController(animated: true)
            } else {
                //Handle the error
            }
        }
    }
    
    
}

extension AddNewsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
