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
    
    private var datePicker: UIDatePicker?
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePickerCreating()
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
    
    func datePickerCreating() {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker: )), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        timeField.inputView = datePicker
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        timeField.text = dateFormatter.string(from: datePicker.date)
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
            "image" : "https://firebasestorage.googleapis.com/v0/b/pmsaiu-1b655.appspot.com/o/news%2FSCIENTIFIC%20WEBINAR%20ON%20EMERGING%20VIRAL%20INFECTIONS%3A?alt=media&token=d26621d1-7efb-430e-96c2-bf478bf058cf"
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
