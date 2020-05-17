//
//  NewsTableViewCell.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/17/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setNews(news: News) {
        //ImageService.getImage(withURL: news.imageUrl) { image in
          //  self.newsImage.image = image
        //}
        titleLabel.text = news.title
        locationLabel.text = news.location
        timeLabel.text = news.date
    }
    
}
