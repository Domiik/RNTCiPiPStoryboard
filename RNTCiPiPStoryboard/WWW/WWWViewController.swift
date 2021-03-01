//
//  WWWViewController.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 22.03.2020.
//  Copyright © 2020 Domiik. All rights reserved.
//
import UIKit

struct Item {
    var imageName: String
    //var nameStringW: String
}

class WWWViewController: UIViewController {
    
    var s: ModelWWW!
    
    
    enum Mode {
        case view
        case select
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var j: [String]!
    
    
    var items: [Item] = [Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur"),
                         Item(imageName: "blur")]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "ItemCollectionViewCell"
    
    var i = 0
    
    var mMode: Mode = .view {
        didSet {
            switch mMode {
            case .view:
                for (key, value) in dictionarySelectedIndecPath {
                    if value {
                        collectionView.deselectItem(at: key, animated: true)
                    }
                }
                
                dictionarySelectedIndecPath.removeAll()
                
                selectBarButton.title = "Выбрать"
                navigationItem.leftBarButtonItem = nil
                collectionView.allowsMultipleSelection = false
            case .select:
                selectBarButton.title = "Отмена"
                collectionView.allowsMultipleSelection = true
            }
        }
    }
    
    lazy var selectBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Выбрать", style: .plain, target: self, action: #selector(didSelectButtonClicked(_:)))
        return barButtonItem
    }()
    
    
    var dictionarySelectedIndecPath: [IndexPath: Bool] = [:]
    
    let lineSpacing: CGFloat = 5
    let interItemSpacing: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupBarButtonItems()
        setupCollectionView()
        setupCollectionViewItemSize()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let item = sender as! Item
        
        
        if segue.identifier == "WhatCard" {
            if let vc = segue.destination as? WhatViewController {
                
            }
        }
    }
    
    private func setupBarButtonItems() {
        navigationItem.rightBarButtonItem = selectBarButton
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self as! UICollectionViewDelegate
        collectionView.dataSource = self as! UICollectionViewDataSource
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize() {
        let customLayout = CustomLayout()
        customLayout.delegate = self as! CustomLayoutDelegate
        collectionView.collectionViewLayout = customLayout
    }
    
    @objc func didSelectButtonClicked(_ sender: UIBarButtonItem) {
        mMode = mMode == .view ? .select : .view
    }
    
    
    
}

extension WWWViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ModelWWW.instance.firstCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ItemCollectionViewCell
        cell.nameW.text = ModelWWW.instance.nameQualities[indexPath.item].description
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch mMode {
        case .view:
            collectionView.deselectItem(at: indexPath, animated: true)
        case .select:
            dictionarySelectedIndecPath[indexPath] = true
            var cell = collectionView.cellForItem(at: indexPath)
            if cell?.isSelected == true {
                let item = indexPath.item
                i += 1
                //record selected cell in array for calculation of results
                ModelWWW.instance.qualitiesArray.append(item + 1)
                if i == 9 {
                    let alert = UIAlertController(title: "Вы согласны с выбором", message: "Это окончательное решение", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Да", style: .default, handler: {
                        action in
                        self.performSegue(withIdentifier: "WhatCard", sender: self)
                        self.i = 0
                    }))
                    alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: {
                        action in
                        self.mMode = self.mMode == .select ? .view : .select
                        self.i = 0
                        
                        
                    }))
                    
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    
    //когда отжали cell обатно пропал индикатор и цвет
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if mMode == .select {
            dictionarySelectedIndecPath[indexPath] = false
            let cell = collectionView.cellForItem(at: indexPath)
            i -= 1
        }
    }
    
}

extension WWWViewController: CustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, sizeOfPhotoAtIndexPath indexPath: IndexPath) -> CGSize {
        return UIImage(named: items[indexPath.item].imageName)!.size
    }
}


