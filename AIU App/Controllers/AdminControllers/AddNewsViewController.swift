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
        title = "Add News"
        navigationController?.navigationBar.prefersLargeTitles = false
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
    
    @IBAction func addImageButtonTapped(_ sender: Any) {
        showImagePickerControllerActionSheet()
    }
    
    func uploadImage(currentUserId: String, image: UIImage, completion: @escaping(Result<URL, Error>) -> Void) {
        let ref = Storage.storage().reference().child("News").child(currentUserId)
        guard let imageData = imageView.image?.jpegData(compressionQuality: 0.4) else {return}
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        ref.putData(imageData, metadata: metaData) { (metadata, error) in
            guard let metadata = metadata else {
                completion(.failure(error!))
                return
            }
        }
        ref.downloadURL { (url, error) in
            guard let url = url else {
                completion(.failure(error!))
                return
            }
            completion(.success(url))
        }
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
            "description" : description
        ]
        
        newsRef.setValue(newsObject) { (error, ref) in
            if error == nil {
                self.navigationController?.popViewController(animated: true)
            } else {
                //Handle the error
//                uploadImage(currentUserId: uid, image: imageView.image!) { (result) in
//                    <#code#>
//                }
            }
        }
    }
    
    
}

extension AddNewsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePickerControllerActionSheet() {
        let alertContoller = UIAlertController(title: "Choose your image", message: nil, preferredStyle: .actionSheet)
        alertContoller.addAction(UIAlertAction(title: "Choose from Library", style: .default, handler: { (action) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }))
        alertContoller.addAction(UIAlertAction(title: "Take from Camera", style: .default, handler: { (action) in
            self.showImagePickerController(sourceType: .camera)
        }))
        alertContoller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertContoller, animated: true, completion: nil)
    }
    
    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageView.image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = originalImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}
