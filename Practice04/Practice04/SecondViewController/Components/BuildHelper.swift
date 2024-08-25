//
//  BuildHelper.swift
//  Practice04
//
//  Created by Alex Diaz on 25/8/24.
//

import Foundation
import UIKit

// DRY: Don't Repeat Yourself

/// The `BuildHelper` class provides a set of utility methods to create common UI elements such as labels, image views, and horizontal stack views.
/// These elements are particularly useful for building a consistent UI in a StatsView or similar components where multiple icons and labels are arranged together.
///
/// Usage Example:
/// ```
/// let musicIcon = BuildHelper.createStatImageView(from: "music.note")
/// let musicNumber = BuildHelper.createStatLabel(with: "127")
/// let myStackView = BuildHelper.createHStatStackView(with: musicIcon, and: musicNumber)
/// ```
///
/// This utility class allows for rapid development by reusing common UI patterns with minimal code.
class BuildHelper {

    /// Creates a UILabel configured for displaying statistics.
    ///
    /// - Parameter text: The text to be displayed in the label.
    /// - Returns: A UILabel instance with the specified text, bold font, white color, and automatic constraints enabled.
    ///
    /// Example:
    /// ```
    /// let musicNumber = BuildHelper.createStatLabel(with: "127")
    /// ```
    static func createStatLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    /// Creates a UIImageView configured to display an icon using SF Symbols.
    ///
    /// - Parameter image: The name of the SF Symbol to be displayed in the image view.
    /// - Returns: A UIImageView instance with the specified image, white tint color, and automatic constraints enabled.
    ///
    /// Example:
    /// ```
    /// let musicIcon = BuildHelper.createStatImageView(from: "music.note")
    /// ```
    static func createStatImageView(from image: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: image)
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

    /// Creates a horizontal UIStackView containing an image view and a label, commonly used for displaying a statistic with an icon and text.
    ///
    /// - Parameters:
    ///   - image: The UIImageView instance to be added to the stack view.
    ///   - label: The UILabel instance to be added to the stack view.
    /// - Returns: A UIStackView instance configured with horizontal axis, centered alignment, minimal spacing, and transparent background.
    ///
    /// Example:
    /// ```
    /// let myStackView = BuildHelper.createHStatStackView(with: musicIcon, and: musicNumber)
    /// ```
    static func createHStatStackView(with image: UIImageView, and label: UILabel) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [image, label])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.backgroundColor = .white.withAlphaComponent(0)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}
