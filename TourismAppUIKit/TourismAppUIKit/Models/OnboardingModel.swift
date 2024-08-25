//
//  OnboardingModel.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 25/8/24.
//

import Foundation

struct OnboardingViewModel {
    let title: String
    let description: String
    let image: String
    let buttonTitle: String
}

let onboardingPages = [
    OnboardingViewModel(title: "Plan Your Trip", description: "Save places and book your perfect trip with Nicaragua App", image: "OnboardingImage1", buttonTitle: "Next"),
    OnboardingViewModel(title: "Begin The Adventure", description: "Begin your Experience with Nicaragua APP alone or your family & friends", image: "OnboardingImage2", buttonTitle: "Next"),
    OnboardingViewModel(title: "Enjoy Your Trip", description: "Enjoy the Nicaragua App packages and stay relax", image: "OnboardingImage3", buttonTitle: "Get Started")
]
