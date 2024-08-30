//
//  CitySections.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 29/8/24.
//
import UIKit
import Foundation

class CitySections: UIView {
    
    init(frame: CGRect, city: CitySectionsModel) {
        super.init(frame: frame)
        setupView(city)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(_ city: CitySectionsModel) {
        backgroundColor = .white
    
        let container: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        let title: UILabel = BuildHelper.createTitleLabel(with: city.title)
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.textAlignment = .left
        let image: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: city.image)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.backgroundColor = .lightGray
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.cornerRadius = 10
            imageView.layer.shadowColor = UIColor.black.cgColor
            imageView.layer.shadowOpacity = 0.5
            imageView.layer.shadowRadius = 5
            imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
            return imageView
        }()
        let subtitle: UILabel = {
            let label = UILabel()
            label.textAlignment = .left
            label.text = city.subtitle
            label.font = UIFont.systemFont(ofSize: 14, weight: .light)
            label.textColor = .lightGray
            label.numberOfLines = 2
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        // add views
        addSubview(container)
        container.addSubview(title)
        container.addSubview(image)
        container.addSubview(subtitle)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            image.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 5),
            image.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            image.widthAnchor.constraint(equalToConstant: 100),
            image.heightAnchor.constraint(equalToConstant: 75),
            
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            title.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -5),
            
            subtitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            subtitle.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -5),
        
        ])
    }
}
