//
//  BuildHelper.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 25/8/24.
//

import Foundation
import UIKit

class BuildHelper {
    
    static func createTitleLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = UIColor.darkBlue
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func createMainButton(with text: String) -> UIButton {
        let button = UIButton(type: .system)
            button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.mainColor ?? .blue
            button.layer.cornerRadius = 10
            button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func createTextField(with placeholder: String, and secureEntry: Bool) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.isSecureTextEntry = secureEntry
        textField.autocapitalizationType = .none
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    static func createSystemButton(with text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text , for: .normal)
        button.setTitleColor(UIColor.mainColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func createImageView(from imageName: String) -> UIImageView {
        let uiImage = UIImage(named: imageName)
        let imageView = UIImageView(image: uiImage)
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    static func createScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }
    
    static func createStackViewHorizontal() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 25
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}
