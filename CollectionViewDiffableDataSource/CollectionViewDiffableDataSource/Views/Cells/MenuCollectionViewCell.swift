//
//  MenuCollectionViewCell.swift
//  CollectionViewDiffableDataSource
//
//  Created by Alex Diaz on 31/8/24.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(with model: MenuModel) {
        imageView.image = {
            let image = UIImage(named: model.image)
            return image
        }()
        nameLabel.text = model.name
        descriptionLabel.text = model.description
        priceLabel.text = String(format: "$%.2f", model.price)
    }
}
