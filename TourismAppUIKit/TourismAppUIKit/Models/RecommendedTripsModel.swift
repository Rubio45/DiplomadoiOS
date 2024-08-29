//
//  RecommendedTripsModel.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 29/8/24.
//

import Foundation

struct RecommendedTripsModel {
    
    let title: String
    let image: String
    let modality: RecommendedTripsModality
    
}

enum RecommendedTripsModality: Int {
    case solo
    case family
}

let recommendedTrips: [RecommendedTripsModel] = [
    RecommendedTripsModel(title: "Adventure in the Mountains", image: "mountains", modality: .solo),
    RecommendedTripsModel(title: "Family Fun at the Beach", image: "beach", modality: .family),
    RecommendedTripsModel(title: "Solo Hiking Experience", image: "hiking", modality: .solo),
    RecommendedTripsModel(title: "Family Road Trip", image: "road_trip", modality: .family),
    RecommendedTripsModel(title: "Solo Island Exploration", image: "island", modality: .solo),
    RecommendedTripsModel(title: "Family Safari Adventure", image: "safari", modality: .family)
]

