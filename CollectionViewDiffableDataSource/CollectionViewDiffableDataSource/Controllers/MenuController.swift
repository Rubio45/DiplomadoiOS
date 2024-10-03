//
//  MenuController.swift
//  CollectionViewDiffableDataSource
//
//  Created by Alex Diaz on 31/8/24.
//

import Foundation

class MenuController {
    let dataSource: MenuDataSourceRepresentable
    
    init(dataSource: MenuDataSourceRepresentable) {
        self.dataSource = dataSource
    }
    
    func getMenuItems(query: String? = "") -> [MenuModel] {
        return dataSource.getMenuItems(query: query ?? "")
    }
}
