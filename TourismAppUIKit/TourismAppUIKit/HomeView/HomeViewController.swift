//
//  HomeViewController.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 25/8/24.
//

import UIKit

class HomeViewController: UIViewController {

    let homeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, Alex!"
        label.textColor = UIColor.darkBlue
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let homeSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Explore Nicaragua"
        label.textColor = UIColor.darkBlue
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search your next trip..."
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = .white
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    let profileImageRounded: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileImage")
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupUI()
        
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        setupHeader()
    }

    // agregando cosas al header.
    private func setupHeader(){
        view.addSubview(homeTitleLabel)
        view.addSubview(homeSubtitleLabel)
        view.addSubview(searchBar)
        view.addSubview(profileImageRounded)
        homeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            homeTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            homeSubtitleLabel.topAnchor.constraint(equalTo: homeTitleLabel.bottomAnchor, constant: 10),
            homeSubtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            searchBar.topAnchor.constraint(equalTo: homeSubtitleLabel.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            profileImageRounded.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileImageRounded.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            profileImageRounded.widthAnchor.constraint(equalToConstant: 60),
            profileImageRounded.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            
        ])
        
        
    }
}
