//
//  StudentTableViewCell.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/23/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setStudent(user: User) {
        nameLabel.text = user.firstName
        surnameLabel.text = user.lastName
        departmentLabel.text = user.department
    }
    
}
