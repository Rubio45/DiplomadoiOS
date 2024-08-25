//
//  OnboardingViewController.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 25/8/24.
//
import UIKit

class OnboardingViewController: UIViewController {
    
    private var currentPage: Int = 0
    private let pages: [OnboardingViewModel] = onboardingPages
    
    private let imageView = BuildHelper.createImageView(from: "OnboardingImage1")
    private let titleLabel = BuildHelper.createTitleLabel(with: "Plan Your Trip")
    private let descriptionLabel = UILabel()
    private let nextButton = BuildHelper.createMainButton(with: "Next")
    private let skipButton = BuildHelper.createSystemButton(with: "Skip")
    private let pageControl = UIStackView()
    private let backButton = BuildHelper.createSystemButton(with: "Back")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateContent()
        setupGestureRecognizers()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Setup navigation buttons
        skipButton.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
        view.addSubview(skipButton)
        
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        // Placeholder image

        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: skipButton.bottomAnchor, constant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        // Title label
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Description label
        descriptionLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = UIColor.grayAppColor
        descriptionLabel.numberOfLines = 3
        view.addSubview(descriptionLabel)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Next button
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        view.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
   
        setupPageControl()
    }
    
    private func setupPageControl() {
        
        // My own pageControl view
        pageControl.axis = .horizontal
        pageControl.alignment = .center
        pageControl.distribution = .fillEqually
        pageControl.spacing = 5
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -30),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        for _ in 0..<pages.count {
            
            let dot = UIView()
            dot.layer.cornerRadius = 5
            dot.backgroundColor = .lightGray
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.widthAnchor.constraint(equalToConstant: 10).isActive = true
            dot.heightAnchor.constraint(equalToConstant: 10).isActive = true
            pageControl.addArrangedSubview(dot)
        }
    }
    
    private func updateContent() {
        let page = pages[currentPage]
        
        // Update the content with current page
        imageView.image = UIImage(named: page.image)
        titleLabel.text = page.title
        descriptionLabel.text = page.description
        nextButton.setTitle(page.buttonTitle, for: .normal)
        
        // Update page control dots
        for (index, view) in pageControl.arrangedSubviews.enumerated() {
            view.backgroundColor = (index == currentPage) ? UIColor.mainColor : .lightGray
        }
    }
    
    @objc private func nextTapped() {
        if currentPage < pages.count - 1 {
            currentPage += 1
            updateContent()
        } else {
            // go to Login
            print("Navigate to Login")
            navigationController?.pushViewController(LoginViewController(), animated: true)
        }
    }
    
    @objc private func skipTapped() {
        // Go to Login
        print("Skip to Login")
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    // MARK: - Gestures
    private func setupGestureRecognizers() {
        // adding gestures to the app
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        // asign the direction to left
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
    }
    
    @objc private func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        // if the swipe is left or right + or - 1 checking that it is not 0 or the last page.
        if gesture.direction == .left {
            if currentPage < pages.count - 1 {
                currentPage += 1
                updateContent()
            }
        } else if gesture.direction == .right {
            if currentPage > 0 {
                currentPage -= 1
                updateContent()
            }
        }
    }
}
