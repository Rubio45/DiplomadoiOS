//
//  MyCustomCollectionCell.swift
//  Practice04
//
//  Created by Alex Diaz on 25/8/24.
//

import UIKit

// Each class should have their own file
class MyCustomCollectionViewCell: UICollectionViewCell {
    
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // setting up the iconImageView
        iconImageView.contentMode = .scaleAspectFill
        // iconImageView.clipsToBounds = true no need this
        iconImageView.layer.masksToBounds = true
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.layer.cornerRadius = 25
        contentView.addSubview(iconImageView)
        
        // setting up the title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        // setting up the subtitle
        subtitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textColor = .gray
        contentView.addSubview(subtitleLabel)
        
        
        // activating constraints
        NSLayoutConstraint.activate([
            
            // setting constraints for iconImageView
            iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            // setting constraints for titleLabel
            titleLabel.trailingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            // setting constraints for subtitleLabel
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.trailingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16)
        
        ])
        
    }
    
    
    func config(model: MyCustomStructModel) {
        iconImageView.image = model.imageView
        titleLabel.text = model.title
        subtitleLabel.text = model.subititle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
