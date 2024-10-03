//
//  ViewController.swift
//  CollectionViewDiffableDataSource
//
//  Created by Alex Diaz on 31/8/24.
//

import UIKit

class ViewController: UIViewController {

    typealias DataSource = UICollectionViewDiffableDataSource<MenuType, MenuModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<MenuType, MenuModel>
    
    @IBOutlet weak var collectionMenu: UICollectionView!
    
    private lazy var dataSource = makeDataSource()
    
    private var menuItems = [MenuModel]()
    
    let controller = MenuController(dataSource: MockMenuDataSource())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistration()
        loadData()
        configureLayout()
    }

    func makeDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: collectionMenu) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as? MenuCollectionViewCell
            
            cell?.setupCell(with: itemIdentifier)
            return cell
        }
        return dataSource
    }
    
    private func cellRegistration() {
        collectionMenu.register(UINib(nibName: "MenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MenuCollectionViewCell")
    }
    
    private func loadData() {
        menuItems = controller.getMenuItems()
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = Snapshot()
        
        snapshot.appendSections(MenuType.allCases) // TODO: IMplement this
        
        MenuType.allCases.forEach { menuType in
            snapshot.appendItems(menuItems.filter({ $0.type == menuType }), toSection: menuType)
        }
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private func configureLayout() {
        collectionMenu.collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            section.interGroupSpacing = 20
            return section
        })
        
    }
}

