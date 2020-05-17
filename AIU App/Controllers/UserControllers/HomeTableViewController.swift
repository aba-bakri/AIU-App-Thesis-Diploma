//
//  HomeViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 1/31/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_burger"), style: .plain, target: self, action: #selector(menuButtonTapped))
    }
    
    @objc func menuButtonTapped() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "MenuTableViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
