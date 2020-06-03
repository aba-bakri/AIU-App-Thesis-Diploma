//
//  NewsUpdateTableViewCell.swift
//  AIU App
//
//  Created by Aba-Bakri on 6/2/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class NewsUpdateTableViewCell: UITableViewCell {

    @IBOutlet weak var newsAdminTitle: UILabel!
    @IBOutlet weak var newsAdminLocation: UILabel!
    @IBOutlet weak var newsAdminTime: UILabel!
    @IBOutlet weak var newsAdminImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setAdminNews(news: News) {
        newsAdminTitle.text = news.title
        newsAdminLocation.text = news.location
        newsAdminTime.text = news.date
        newsAdminImage.image = UIImage(named: "news")
    }
}
