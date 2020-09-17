//
//  TackCollectionViewController.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 17.02.2020.
//  Copyright © 2020 Domiik. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TackCollectionViewController: UICollectionViewController {
    
    let photos = ["Lion", "Lion", "Lion"]
    let name = ["Test 1", "Test 2", "Test 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TaskCollectionViewCell
        cell.imageName.image = UIImage(named: photos[indexPath.row])
        cell.nameTest.text = name[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let detailViewController = segue.destination as? TestOneViewController {
//            if let cell = sender as? TaskCollectionViewCell {
//                if let indexPath = collectionView?.indexPath(for: cell) {
//
//                }
//            }
//        }
    }

}
