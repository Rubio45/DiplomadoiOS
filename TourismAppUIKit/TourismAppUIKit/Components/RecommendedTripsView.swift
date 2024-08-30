//
//  RecommendedTripsView.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 29/8/24.
//

import Foundation
import UIKit

class RecommendedTripsView: UIView {
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.darkBlue?.withAlphaComponent(0.7)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var isFavorite: Bool = false
    
    init(recommendedTrips: RecommendedTripsModel) {
        super.init(frame: .zero)
        setupView(recommendedTrips)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(_ recommendedTrips: RecommendedTripsModel) {
        
        let recommendedTripsContainer = UIView()
        recommendedTripsContainer.backgroundColor = .white
        recommendedTripsContainer.layer.cornerRadius = 10
        recommendedTripsContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let recommendedTripsImageView = UIImageView()
        recommendedTripsImageView.image = UIImage(named: recommendedTrips.image)
        recommendedTripsImageView.contentMode = .scaleAspectFill
        recommendedTripsImageView.backgroundColor = .lightGray
        recommendedTripsImageView.layer.cornerRadius = 10
        recommendedTripsImageView.clipsToBounds = true
        recommendedTripsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let recommendedTripsTitle = BuildHelper.createTitleLabel(with: recommendedTrips.title)
        recommendedTripsTitle.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        recommendedTripsTitle.textColor = .white
        recommendedTripsTitle.numberOfLines = 2
        
        addSubview(recommendedTripsContainer)
        recommendedTripsContainer.addSubview(recommendedTripsImageView)
        recommendedTripsContainer.addSubview(recommendedTripsTitle)
        recommendedTripsContainer.addSubview(favoriteButton)
        
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            recommendedTripsContainer.topAnchor.constraint(equalTo: topAnchor),
            recommendedTripsContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            recommendedTripsContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            recommendedTripsContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            recommendedTripsImageView.topAnchor.constraint(equalTo: recommendedTripsContainer.topAnchor),
            recommendedTripsImageView.leadingAnchor.constraint(equalTo: recommendedTripsContainer.leadingAnchor),
            recommendedTripsImageView.trailingAnchor.constraint(equalTo: recommendedTripsContainer.trailingAnchor),
            recommendedTripsImageView.bottomAnchor.constraint(equalTo: recommendedTripsContainer.bottomAnchor),
            
            recommendedTripsTitle.bottomAnchor.constraint(equalTo: recommendedTripsContainer.bottomAnchor, constant: -10),
            recommendedTripsTitle.leadingAnchor.constraint(equalTo: recommendedTripsContainer.leadingAnchor, constant: 20),
            recommendedTripsTitle.trailingAnchor.constraint(equalTo: recommendedTripsContainer.trailingAnchor, constant: -20),
            
            favoriteButton.topAnchor.constraint(equalTo: recommendedTripsContainer.topAnchor, constant: 5),
            favoriteButton.trailingAnchor.constraint(equalTo: recommendedTripsContainer.trailingAnchor, constant: -5),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30)
        
        ])
        
    }
    
    @objc private func favoriteButtonTapped() {
        isFavorite = !isFavorite
        favoriteButton.tintColor = isFavorite ? .mainColor : .white
        favoriteButton.setImage(UIImage(systemName: isFavorite ? "heart.fill" : "heart"), for: .normal)
    }
}
