//
//  MainPlacesView.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 28/8/24.
//

import Foundation
import UIKit

class MainPlacesView: UIView {
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.darkBlue?.withAlphaComponent(0.7)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var isFavorite: Bool = false
    
    init(mainPlaces: MainPlacesModel) {
        super.init(frame: .zero)
        setupView(mainPlaces)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(_ mainPlaces: MainPlacesModel) {
        
        let mainContainer: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 20
            return view
        }()
        
        let titleContainer: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor.darkBlue?.withAlphaComponent(0.7)
            view.layer.cornerRadius = 20
            return view
        }()
        
        let image: UIImageView = {
            let imageView = UIImageView()
            imageView.layer.cornerRadius = 20
            imageView.backgroundColor = .lightGray
            imageView.contentMode = .scaleAspectFill
            imageView.image = UIImage(named: mainPlaces.image)
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let title: UILabel = {
            let label = BuildHelper.createTitleLabel(with: mainPlaces.title)
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            label.textAlignment = .left
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let localization: UILabel = {
            let label = UILabel()
            label.text = mainPlaces.localization
            label.font = UIFont.systemFont(ofSize: 14, weight: .light)
            label.textAlignment = .left
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let localizationIcon: UIImageView = {
            let icon = UIImageView()
            icon.image = UIImage(systemName: "pin")
            icon.tintColor = .white
            icon.translatesAutoresizingMaskIntoConstraints = false
            return icon
        }()
        
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        
        // Agregar subviews
        addSubview(mainContainer)
        mainContainer.addSubview(image)
        mainContainer.addSubview(favoriteButton)
        mainContainer.addSubview(titleContainer)
        titleContainer.addSubview(title)
        titleContainer.addSubview(localization)
        titleContainer.addSubview(localizationIcon)
        
        // Configuración de restricciones
        NSLayoutConstraint.activate([
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            image.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            image.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            image.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            
            titleContainer.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor, constant: -5),
            titleContainer.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 5),
            titleContainer.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -5),
            titleContainer.heightAnchor.constraint(equalToConstant: 60),
            
            title.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor, constant: 10),
            title.topAnchor.constraint(equalTo: titleContainer.topAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: titleContainer.trailingAnchor),
            
            localizationIcon.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor, constant: 10),
            localizationIcon.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            localizationIcon.widthAnchor.constraint(equalToConstant: 15),
            localizationIcon.heightAnchor.constraint(equalToConstant: 15),
            
            localization.leadingAnchor.constraint(equalTo: localizationIcon.trailingAnchor, constant: 2),
            localization.centerYAnchor.constraint(equalTo: localizationIcon.centerYAnchor),
            localization.trailingAnchor.constraint(equalTo: titleContainer.trailingAnchor),
            
            favoriteButton.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -5),
            favoriteButton.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: 5),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    @objc private func favoriteButtonTapped() {
        isFavorite = !isFavorite
        favoriteButton.tintColor = isFavorite ? .mainColor : .white
        favoriteButton.setImage(UIImage(systemName: isFavorite ? "heart.fill" : "heart"), for: .normal)
    }
}
