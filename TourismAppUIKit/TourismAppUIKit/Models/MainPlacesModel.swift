//
//  MainPlacesCard.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 28/8/24.
//

import Foundation

struct MainPlacesModel {
    let title: String
    let description: String
    let localization: String
    let rating: Double
    let image: String
}

let mainPlaces = [
    MainPlacesModel(title: "Masaya Volcano", description: "Muy bonito", localization: "Masaya", rating: 4.8, image: "MasayaVulcano"),
    MainPlacesModel(title: "Granada City", description: "Colonial city with rich history", localization: "Granada", rating: 4.6, image: "GranadaCity"),
    MainPlacesModel(title: "Ometepe Island", description: "Island formed by two volcanoes", localization: "Rivas", rating: 4.9, image: "OmetepeIsland"),
    MainPlacesModel(title: "Corn Islands", description: "Beautiful Caribbean beaches", localization: "Caribbean Coast", rating: 4.7, image: "CornIslands"),
    MainPlacesModel(title: "Mombacho Volcano", description: "Volcano with cloud forest", localization: "Granada", rating: 4.5, image: "MombachoVolcano")
]
