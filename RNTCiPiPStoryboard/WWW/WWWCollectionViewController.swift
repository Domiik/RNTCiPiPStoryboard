//
//  WWWCollectionViewController.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 22.03.2020.
//  Copyright © 2020 Domiik. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CellCards"

class WWWCollectionViewController: UICollectionViewController {
    
    
    enum Mode {
        case view
        case select
    }
    
    var firstCollection: [([String],[Int])] =
        [(["K1.Специальные знания - хорошая ориентировка в конкртеной области, в своем деле"],[1,3,4,5,6,7,8,13,19,23,24,27]),
        (["K2.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K3.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K4.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K5.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K6.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K7.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K8.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K9.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K10.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K11.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K12.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K13.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K14.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K15.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K16.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K17.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K18.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K19.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K20.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K21.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K22.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K23.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K24.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K25.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K26.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        (["K27.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания"],[1,3,4,5,9,10,12,21]),
        ]
    var nameCards = ["K1.Специальные знания - хорошая ориентировка в конкртеной области, в своем деле",
    "K2.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K3.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K4.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K5.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K6.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K7.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K8.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K9.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K10.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K11.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K12.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K13.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K14.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K15.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K16.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K17.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K18.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K19.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K20.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K21.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K22.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K23.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K24.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K25.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K26.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    "K27.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания",
    ]
    
    var i = 0
    var mMode: Mode = .view {
        didSet {
            switch mMode {
            case .view:
                selectBarButton.title = "Выбор"
                navigationItem.leftBarButtonItem = nil
                collectionView.allowsMultipleSelection = false
            case .select:
                selectBarButton.title = "Отмена"
                navigationItem.leftBarButtonItem = nextBarButton
                collectionView.allowsMultipleSelection = true
            }
        }
    }
    
    lazy var selectBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Выбор", style: .plain, target: self, action: #selector(didSelectButtonClicked(_:)))
        return barButtonItem
    }()
    
    lazy var nextBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Дальше", style: .plain, target: self, action: #selector(nextSelectButtonClicked(_:)))
        return barButtonItem
    }()
    
    
    var dictionarySelectedIndexPath: [IndexPath: Bool] = [:]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupBarButtonsItems()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
      
        // Register cell classes
       // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
    
    private func setupBarButtonsItems(){
        navigationItem.rightBarButtonItem = selectBarButton
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return nameCards.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WWWCollectionViewCell
        cell.nameCards.text = nameCards[indexPath.row]
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
     //Uncomment this method to specify if the specified item should be selected
//    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//
//        return true
//    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch mMode {
        case .view:
            let item = nameCards[indexPath.item]
            performSegue(withIdentifier: "Cards", sender: self)
        case .select:
            dictionarySelectedIndexPath[indexPath] = true
        }
//        var cell = collectionView.cellForItem(at: indexPath)
//        if cell?.isSelected == true {
//            i += 1
//            cell?.backgroundColor = UIColor.green
//            if i == 3 {
//                self.performSegue(withIdentifier: "Cards", sender: self)
//            }
//        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
       if mMode == .select {
         dictionarySelectedIndexPath[indexPath] = false
       }
     }
    
    @objc func didSelectButtonClicked(_ sender: UIBarButtonItem) {
        mMode = mMode == .view ? .select : .view
    }
    
    @objc func nextSelectButtonClicked(_ sender: UIBarButtonItem) {
        
    }

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
