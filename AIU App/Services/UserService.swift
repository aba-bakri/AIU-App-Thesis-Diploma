//
//  UserService.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/21/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import Foundation
import Firebase

class UserService {
    
    static var currentUserProfile: User?
    
    static func observeUserProfile(_ uid:String, completion: @escaping ((_ userProfile: User?)->())) {
        let userRef = Database.database().reference().child("User/\(uid)")
        
        userRef.observe(.value, with: { snapshot in
            var userProfile: User?
            
            if let dict = snapshot.value as? [String:Any],
                let firstName = dict["firstName"] as? String,
                let lastName = dict["lastName"] as? String,
                let email = dict["email"] as? String,
                let studentId = dict["studentId"] as? String,
                let department = dict["department"] as? String,
                let phone = dict["phone"] as? String {
                
                userProfile = User(firstName: firstName, lastName: lastName, email: email, studentId: studentId, department: department, phone: phone)
            }
            
            completion(userProfile)
        })
    }
}
