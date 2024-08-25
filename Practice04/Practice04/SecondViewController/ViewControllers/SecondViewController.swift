//
//  SecondViewController.swift
//  Practice04
//
//  Created by Junior Escoto on 8/24/24.
//

import UIKit


class SecondViewController: UIViewController {
    
    // contenedores
    private let topContainerView = UIView()
    private let bottomContainerView = UIView()
    
    // Elementos de mi primer contenedor
    private let profilePhotoView = UIImageView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
  
    // elementos de mi stack view. Create these Variables with the principle DRY: Don't Repeat Yourself
    private let musicIcon = BuildHelper.createStatImageView(from: "music.note")
    private let musicNumber: UILabel = BuildHelper.createStatLabel(with: "127")
    
    private let peopleIcon = BuildHelper.createStatImageView(from: "person.2.fill")
    private let peopleNumber: UILabel = BuildHelper.createStatLabel(with: "2261")
    
    private let heartIcon = BuildHelper.createStatImageView(from: "heart.fill")
    private let heartNumber: UILabel = BuildHelper.createStatLabel(with: "5531")
    
    
    private var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // setting background to white.
        view.backgroundColor = .white
        
        setUI()
        
    }
    
    /// Update the UI when the view loads
    private func setUI() {
        setupTopContainerView()
        setupBottonContainerView()
        setupProfilePhotoView()
        setupStackView()
    }
    
    /// Setting up the top container view
    private func setupTopContainerView() {
        
        // changing main color to MainColor for UI, it doesn't have DarkMode.
        topContainerView.backgroundColor = UIColor.mainColor
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        // adding the topContrainer to the view
        view.addSubview(topContainerView)

        NSLayoutConstraint.activate([
            topContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            topContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
    
    /// Setting up the bottom container view
    private func setupBottonContainerView() {
        
        bottomContainerView.backgroundColor = .white
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        // adding the bottomContrainer to the view
        view.addSubview(bottomContainerView)
        // activating constraints
        NSLayoutConstraint.activate([
            bottomContainerView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor),
            bottomContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // create a layout for the collectionView
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        // disable the scroll indicator
        layout.collectionView?.showsVerticalScrollIndicator = false
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        
        // configuracion de mi collectionView
        myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCollectionView.backgroundColor = .white
        // conformando el protocolo DataSource y delegate.
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        myCollectionView.register(MyCustomCollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        // adding the collectionView to the bottom container
        bottomContainerView.addSubview(myCollectionView)
        
        // activating constraints
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: view.centerYAnchor),
            myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    /// Setting up the profilePhotoView
    private func setupProfilePhotoView() {
        
        // addding a photo profile to the top container
        profilePhotoView.image = UIImage(named: "profilePhoto")
        profilePhotoView.layer.cornerRadius = 75
        profilePhotoView.layer.masksToBounds = true
        profilePhotoView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.addSubview(profilePhotoView)
        
        // activate contraints for the nameLabel
        nameLabel.text = "Laura Kalbag"
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        topContainerView.addSubview(nameLabel)
        // activate contraints for the description
        descriptionLabel.text  = "Love the way music makes me feel"
        descriptionLabel.textColor = .white
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        
        topContainerView.addSubview(descriptionLabel)
        
        
        // activating constraints
        NSLayoutConstraint.activate([
            
            // activate contraints for the Profile photo
            profilePhotoView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),
            profilePhotoView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor, constant: -30),
            profilePhotoView.widthAnchor.constraint(equalToConstant: 150),
            profilePhotoView.heightAnchor.constraint(equalToConstant: 150),
            
            // activate contraints for the description
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            descriptionLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
            
            // activate contraints for the nameLabel
            nameLabel.topAnchor.constraint(equalTo: profilePhotoView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: profilePhotoView.centerXAnchor)
        ])
        
        
    }
    
    /// Setting up the stackView for the scrolling music
    private func setupStackView() {
        
        // create view para la UIView
        let musicStackView = BuildHelper.createHStatStackView(with: musicIcon, and: musicNumber)
        let peopleStackView = BuildHelper.createHStatStackView(with: peopleIcon, and: peopleNumber)
        let heartStackView = BuildHelper.createHStatStackView(with: heartIcon, and: heartNumber)
        
        
        let mainHStackView = UIStackView(arrangedSubviews: [
            musicStackView,
            peopleStackView,
            heartStackView,
        ])
        
        mainHStackView.axis = .horizontal
        mainHStackView.distribution = .equalSpacing
        mainHStackView.alignment = .center
        mainHStackView.spacing = 5
        
        topContainerView.addSubview(mainHStackView)
        
        mainHStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
           // stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            mainHStackView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 50),
            mainHStackView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -50),
            mainHStackView.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: -20)
        
        ])
        
    }
    
}
