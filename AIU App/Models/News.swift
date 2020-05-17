//
//  News.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/17/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import Foundation

class News {
    var title: String
    var description: String
    var image: String
    var location: String
    var date: String
    
    init(title: String, description: String, image: String, location: String, date: String) {
        self.title = title
        self.description = description
        self.image = image
        self.location = location
        self.date = date
    }
}
