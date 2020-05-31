//
//  Utilities.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/10/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import Foundation

class Utilities {
    
    static func isEmailValid(_ email: String) -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailRegEx = "[A-Z0-9a-z._%+-]+@iaau.edu.kg"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func isPasswordValid(_ password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
}
