//
//  MyCustomStructModel.swift
//  Practice04
//
//  Created by Alex Diaz on 25/8/24.
//

import Foundation
import UIKit

// Each model should have their own file
// MARK: - MyCustomStructModel
struct MyCustomStructModel {
    
    let imageView: UIImage
    let title: String
    let subititle: String
}

let myCellModel: [MyCustomStructModel] = [
    
    MyCustomStructModel(imageView: UIImage(named: "image1")!, title: "Listening to green grass of tunnel", subititle: "Mum - Finaly we are no one 2022"),
    
    MyCustomStructModel(imageView: UIImage(named: "image2")!, title: "Listening to count your blessings", subititle: "Johnson Oatman - evenings 2012"),
    
    MyCustomStructModel(imageView: UIImage(named: "image3")!, title: "Listening to Daydream", subititle: "chris lock - fir sure 2009"),
    
    MyCustomStructModel(imageView: UIImage(named: "image4")!, title: "Listening to green grass of tunnel", subititle: "Mum - Finaly we are no one 2022"),
    
    
    MyCustomStructModel(imageView: UIImage(named: "image1")!, title: "Listening to green grass of tunnel", subititle: "Mum - Finaly we are no one 2022"),
    
    MyCustomStructModel(imageView: UIImage(named: "image2")!, title: "Listening to count your blessings", subititle: "Johnson Oatman - evenings 2012"),
    
    MyCustomStructModel(imageView: UIImage(named: "image3")!, title: "Listening to Daydream", subititle: "chris lock - fir sure 2009"),
    
    MyCustomStructModel(imageView: UIImage(named: "image4")!, title: "Listening to green grass of tunnel", subititle: "Mum - Finaly we are no one 2022")


]
