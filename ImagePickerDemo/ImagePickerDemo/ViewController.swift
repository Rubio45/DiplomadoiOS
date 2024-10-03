//
//  ViewController.swift
//  ImagePickerDemo
//
//  Created by Alex Diaz on 21/9/24.
//

import UIKit

class ViewController: UIViewController {

    typealias DataSource = UICollectionViewDiffableDataSource<MediaType, MediaModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<MediaType, MediaModel>
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    private lazy var dataSource = makeDataSource()
    
    private var medias = [MediaModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Library"
        configButton()
        cellRegistration()
        layoutConfiguration()
        applySnapshot()
    }

    // MARK: - Setting Buttons. 
    func configButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(handlePlusButtonTapped))
    }
    
    private func cellRegistration() {
        myCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
    }
    
    private func makeDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: myCollectionView) { collectionView, indexPath, itemIdentifier in
            
            // collectionView se le saca una celda para reutilizarla, en la posicion indexPath, y para eso se usa un nuevo model para cargar que se llame itemIdentifier.
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell
            
            cell?.imageView.image = itemIdentifier.image
            
            return cell
        }
        return dataSource
    }
    
    private func layoutConfiguration() {
        myCollectionView.collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: { IndexPath, environment in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(150))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            return section
        })
    }
    
    @objc func handlePlusButtonTapped() {
        let newPhoto = MediaModel(type: .photo, image: UIImage(named: "zorro")!)
        medias.append(newPhoto)
        applySnapshot()
    }
    
    private func applySnapshot() {
        var snapshot = Snapshot()
        
        snapshot.appendSections([MediaType.photo])
        
        snapshot.appendItems(medias)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
}
