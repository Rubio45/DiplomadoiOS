//
//  SecondViewController.swift
//  Practice04
//
//  Created by Alex Diaz on 25/8/24.
//

import UIKit

// Each extension should have their own file, and in 1 protocol per extension. -- NORMAN. 

//conform UICollectionViewDataSource protocol
extension SecondViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        myCellModel.count
    }
}
// conform UICollectionViewDelegate protocol
extension SecondViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}
// conform UICollectionViewDelegate protocol
extension SecondViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCustomCollectionViewCell
        
        cell.config(model: myCellModel[indexPath.row])
        
        return cell
    }
    
}
