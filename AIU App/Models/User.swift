//
//  User.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/21/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import Foundation

class User {
    var firstName: String
    var lastName: String
    var email: String
    var studentId: String
    var department: String
    var phone: String
    
    init(firstName: String, lastName: String, email: String, studentId: String, department: String, phone: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.studentId = studentId
        self.department = department
        self.phone = phone
    }
}
