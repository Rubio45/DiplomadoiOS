//
//  DetailViewController.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 29/8/24.
//

import UIKit

final class DetailViewController: UIViewController {

    var place: PlacesProtocol
    private let favoriteButton = UIButton()
    private let backButton = UIButton()
    private var favorite: Bool = false
    
    init(place: PlacesProtocol) {
        self.place = place
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        setupView(place)
    }
    
    private func setupView(_ place: PlacesProtocol) {
        let title = BuildHelper.createTitleLabel(with: place.title)
        title.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        
        let description = UILabel()
        description.text = place.description
        description.numberOfLines = 10
        description.lineBreakMode = .byWordWrapping
        description.textAlignment = .justified
        description.textColor = UIColor.darkBlue
        description.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        description.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImageView()
        image.image = UIImage(named: place.image)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        //image.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
 
        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonAction), for: .touchUpInside)
        favoriteButton.tintColor = .white
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.backgroundColor = UIColor.darkBlue?.withAlphaComponent(0.7)
        favoriteButton.layer.cornerRadius = 15
        favoriteButton.addTarget(self, action: #selector(favoriteButtonAction), for: .touchUpInside)
        
        backButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        backButton.backgroundColor = UIColor.darkBlue?.withAlphaComponent(0.7)
        backButton.layer.cornerRadius = 15
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = .white
        
        let pinIcon = UIImageView()
        pinIcon.image = UIImage(systemName: "mappin")
        pinIcon.tintColor = .mainColor
        pinIcon.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(image)
        view.addSubview(title)
        view.addSubview(description)
        view.addSubview(favoriteButton)
        view.addSubview(backButton)
        view.addSubview(pinIcon)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: 400),
            
            pinIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            pinIcon.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
            pinIcon.heightAnchor.constraint(equalToConstant: 28),
            pinIcon.widthAnchor.constraint(equalToConstant: 28),
            
            title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: pinIcon.trailingAnchor, constant: 5),
            
            description.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            description.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            description.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            favoriteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -15),
            favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30),
            
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -15),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }

    @objc func favoriteButtonAction() {
        favorite.toggle()
        favoriteButton.setImage(UIImage(systemName: favorite ? "heart.fill" : "heart"), for: .normal)
        favoriteButton.tintColor = favorite ? .lightBlue : .white
        print("Favorite button pressed")
    }
    
    @objc func backButtonAction() {
        // eliminar la imagen.
        navigationController?.popViewController(animated: true)
        print("Back button pressed")
    }
    
}
