//
//  HomeViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 5/17/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var news = [News]()
    var tableView: UITableView!
    private var searchedNews = [News]()
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isSearching: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by Title"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        setupBarButtons()
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        let cellNib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "newsCell")
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        view.addSubview(tableView)
        
        var layoutGuide: UILayoutGuide!
        
        if #available(iOS 11.0, *) {
            layoutGuide = view.safeAreaLayoutGuide
        } else {
            layoutGuide = view.layoutMarginsGuide
        }
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        observeNews()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return searchedNews.count
        }
        
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        
        var newss: News
        
        if isSearching {
            newss = searchedNews[indexPath.row]
        } else {
            newss = news[indexPath.row]
        }
        
        cell.setNews(news: newss)
        cell.selectionStyle = .default
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "NewsDetailViewController") as? NewsDetailViewController
        vc?.titleText = news[indexPath.row].title
        vc?.locationText = news[indexPath.row].location
        vc?.dateText = news[indexPath.row].date
        vc?.descriptionText = news[indexPath.row].description
        vc?.detailImageView = UIImage(named: "news")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func setupBarButtons() {
        title = "News"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_burger"), style: .plain, target: self, action: #selector(menuButtonTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "logout"), style: .plain, target: self, action: #selector(signOutButtonTapped))
    }
    
    @objc func menuButtonTapped() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "MenuTableViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func signOutButtonTapped() {
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true) {
                self.navigationController?.popToRootViewController(animated: true)
            }
        } catch {
            print(error)
        }
    }

    func observeNews() {
        let newsRef = Database.database().reference().child("News")
        
        newsRef.observe(.value) { (snapshot) in

            var tempNews = [News]()

            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String: Any],
                    let title = dict["title"] as? String,
                    let description = dict["description"] as? String,
                    let image = dict["image"] as? String,
                    let imageUrl = URL(string: image),
                    let location = dict["location"] as? String,
                    let date = dict["time"] as? String {

                        let news = News(title: title, description: description, imageUrl: imageUrl, location: location, date: date)
                        tempNews.append(news)
                    }
                }
            self.news = tempNews
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchedContextForSeachText(searchController.searchBar.text!)
    }
    
    private func searchedContextForSeachText(_ searchText: String) {
        searchedNews = news.filter({ (news: News) -> Bool in
            return news.title.lowercased().contains(searchText.lowercased()) || news.location.lowercased().contains(searchText.lowercased()) || news.date.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
}
