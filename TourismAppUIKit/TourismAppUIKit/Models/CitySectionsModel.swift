//
//  CitySectionsModel.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 29/8/24.
//

import Foundation

struct CitySectionsModel {
    let title: String
    let image: String
    let subtitle: String
    let description: String
}

let citySections: [CitySectionsModel] = [
    CitySectionsModel(
        title: "Granada",
        image: "granadaImage",
        subtitle: "Colonial Charm",
        description: "Granada is known for its well-preserved colonial architecture, colorful buildings, and vibrant history."
    ),
    CitySectionsModel(
        title: "León",
        image: "leonImage",
        subtitle: "Cultural Capital",
        description: "León is a city rich in history, art, and culture, with numerous churches, museums, and vibrant street art."
    ),
    CitySectionsModel(
        title: "Managua",
        image: "managuaImage",
        subtitle: "Capital City",
        description: "Managua, the capital of Nicaragua, offers a mix of modernity and tradition, with bustling markets and historic sites."
    ),
    CitySectionsModel(
        title: "San Juan del Sur",
        image: "sanJuanImage",
        subtitle: "Beach Paradise",
        description: "San Juan del Sur is a popular beach destination, known for its beautiful coastline and surf-friendly waves."
    ),
    CitySectionsModel(
        title: "Ometepe",
        image: "ometepeImage",
        subtitle: "Island Adventure",
        description: "Ometepe, an island formed by two volcanoes, offers stunning landscapes and opportunities for hiking and exploration."
    )
]
