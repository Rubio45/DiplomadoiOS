//
//  RecommendedTripsModel.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 29/8/24.
//
import Foundation

struct RecommendedTripsModel: PlacesProtocol {
    let title: String
    let image: String
    let modality: RecommendedTripsModality
    let description: String
}

enum RecommendedTripsModality: Int {
    case solo
    case family
}

let recommendedTrips: [RecommendedTripsModel] = [
    RecommendedTripsModel(
        title: "Adventure in the Mountains",
        image: "mountains",
        modality: .solo,
        description: "Embark on an exciting adventure in the majestic mountains, where each trail leads to breathtaking views and fresh air. Perfect for those who seek solitude and a deep connection with nature, this trip offers a chance to disconnect from the world and reconnect with yourself. From challenging hikes to nights under a starry sky, every moment is an unforgettable experience that will rejuvenate your spirit and bring inner peace."
    ),
    RecommendedTripsModel(
        title: "Family Fun at the Beach",
        image: "beach",
        modality: .family,
        description: "Enjoy an unforgettable vacation at the beach with the whole family. Picture sunny days building sandcastles, splashing in crystal-clear waters, and relaxing under a beach umbrella while the kids play nearby. This family-friendly destination offers activities for all ages, from water sports to delightful sunset dinners. It's the perfect place to create cherished memories together, filled with laughter and joy."
    ),
    RecommendedTripsModel(
        title: "Solo Hiking Experience",
        image: "hiking",
        modality: .solo,
        description: "Set out on a solo hiking experience that takes you through rugged trails and untouched wilderness. This trip is designed for the adventurous soul who craves solitude and the challenge of conquering nature's obstacles. With every step, you'll discover new sights and sounds that invigorate your senses and strengthen your connection with the great outdoors. This journey promises self-discovery and an unmatched sense of accomplishment."
    ),
    RecommendedTripsModel(
        title: "Family Road Trip",
        image: "road_trip",
        modality: .family,
        description: "Hit the open road with your family for an epic road trip that spans scenic landscapes and hidden gems. This journey is all about quality time spent together, exploring new places, and creating shared experiences that will last a lifetime. Whether you're driving through picturesque countryside or stopping at charming towns along the way, this road trip offers something for everyone. It's the perfect way to bond and discover the joys of travel together."
    ),
    RecommendedTripsModel(
        title: "Solo Island Exploration",
        image: "island",
        modality: .solo,
        description: "Embark on a solo island exploration where tranquility meets adventure. This trip is perfect for those who seek to escape the hustle and bustle of everyday life and immerse themselves in the serenity of an island paradise. Wander through secluded beaches, discover hidden coves, and enjoy the peaceful rhythm of island life at your own pace. It's a journey of self-reflection and pure relaxation, offering an idyllic retreat for the solo traveler."
    ),
    RecommendedTripsModel(
        title: "Family Safari Adventure",
        image: "safari",
        modality: .family,
        description: "Take your family on a thrilling safari adventure where the wonders of the wild await. This trip offers an unforgettable experience for all ages, with close encounters with majestic wildlife, guided tours through breathtaking landscapes, and educational opportunities that bring nature to life. It's an adventure that combines excitement with learning, making it the perfect family getaway where everyone can share in the awe and wonder of the natural world."
    )
]
