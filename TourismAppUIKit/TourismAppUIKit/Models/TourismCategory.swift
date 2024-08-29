//
//  TourismCategory.swift
//  TourismAppUIKit
//
//  Created by Alex Diaz on 27/8/24.
//

import Foundation

enum TourismCategory: String, Codable {
    case adventure = "Adventure"
    case nature = "Nature"
    case history = "History"
    case beach = "Beach"
    case health = "Health"
    
    var imageName: String {
        switch self {
        case .adventure:
            return "bicycle" // bycicle or bycicle + .fill
        case .nature:
            return "leaf"
        case .history:
            return "text.book.closed"
        case .beach:
            return "beach.umbrella"
        case .health:
            return "cross.case"
        }
    }
}
