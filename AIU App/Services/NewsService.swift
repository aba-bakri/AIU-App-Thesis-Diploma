//
//  NewsService.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/30/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import Foundation
import Firebase

class NewsService {
    
    static var currentNews: News?
    
    static func observeNews(_ uid:String, completion: @escaping ((_ newsModel: News?)->())) {
        let newsRef = Database.database().reference().child("News/\(uid)")
        
        newsRef.observe(.value, with: { snapshot in
            var newsModel: News?
            
            if let dict = snapshot.value as? [String:Any],
                let title = dict["title"] as? String,
                let location = dict["location"] as? String,
                let time = dict["time"] as? String,
                let description = dict["description"] as? String,
                let image = dict["image"] as? String {
                
                newsModel = News(title: title, description: description, imageUrl: URL(string: image)!, location: location, date: time)
            }
            
            completion(newsModel)
        })
    }
}
