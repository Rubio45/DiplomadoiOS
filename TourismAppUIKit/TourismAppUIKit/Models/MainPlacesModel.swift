//
//  MainPlacesCard.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 28/8/24.
//

import Foundation

struct MainPlacesModel: PlacesProtocol {
    let title: String
    let description: String
    let localization: String
    let image: String
}

let mainPlaces = [
    MainPlacesModel(title: "Masaya Volcano", description: "Masaya Volcano is a remarkable and active volcano located in the Masaya National Park. It features a constantly active lava lake, which provides a mesmerizing and fiery spectacle. Visitors can experience breathtaking views of the volcanic crater and surrounding landscape. The area is also known for its diverse flora and fauna, adding to the natural beauty and ecological significance of the region.", localization: "Masaya", image: "MasayaVulcano"),
    
    MainPlacesModel(title: "Granada City", description: "Granada is a historic colonial city renowned for its well-preserved Spanish architecture, vibrant culture, and rich historical background. Established in 1524, it is one of the oldest cities in the Americas. The city boasts charming cobblestone streets, colorful buildings, and significant landmarks such as the Granada Cathedral and the Convento de San Francisco. Granada also offers a lively cultural scene, with local markets, festivals, and a picturesque waterfront along Lake Cocibolca.", localization: "Granada", image: "GranadaCity"),
    
    MainPlacesModel(title: "Ometepe Island", description: "Ometepe Island is a unique and picturesque island located in Lake Cocibolca, formed by two majestic volcanoes: Concepción and Maderas. The island is known for its stunning natural landscapes, including lush rainforests, waterfalls, and ancient petroglyphs. Visitors can explore various hiking trails, enjoy the scenic beauty of volcanic landscapes, and experience the island's cultural heritage. Ometepe offers a tranquil retreat with opportunities for adventure and relaxation amidst its natural splendor.", localization: "Rivas", image: "OmetepeIsland"),
    
    MainPlacesModel(title: "Corn Islands", description: "The Corn Islands, located in the Caribbean Sea off the eastern coast of Nicaragua, are renowned for their pristine beaches, crystal-clear waters, and vibrant marine life. The islands, Big Corn Island and Little Corn Island, offer a tranquil paradise for visitors seeking relaxation and adventure. With their picturesque sandy shores, turquoise waters, and opportunities for snorkeling, diving, and exploring the local culture, the Corn Islands provide a perfect getaway for beach lovers and nature enthusiasts alike.", localization: "Caribbean Coast", image: "CornIslands"),
    
    MainPlacesModel(title: "Mombacho Volcano", description: "Mombacho Volcano is a majestic and dormant volcano situated near the city of Granada. It is renowned for its verdant cloud forest, which harbors a diverse array of plant and animal species. The volcano features several hiking trails that offer panoramic views of the surrounding landscape, including Lake Cocibolca and the city of Granada. Visitors can explore the rich biodiversity of the cloud forest, observe exotic wildlife, and enjoy the natural beauty and tranquility of this volcanic wonder.", localization: "Granada", image: "MombachoVolcano")
]
