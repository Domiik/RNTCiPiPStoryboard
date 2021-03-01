//
//  ItemCollectionViewCell.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 21.03.2020.
//  Copyright © 2020 Domiik. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    //@IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var highlightIndicator: UIView!
    @IBOutlet weak var selectIndicator: UIImageView!
    @IBOutlet weak var nameW: UILabel!
    
   
    
    override var isSelected: Bool {
        didSet {
            highlightIndicator.isHidden = !isSelected
            selectIndicator.isHidden = !isSelected
            //highlightIndicator.backgroundColor = UIColor.systemBackground
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
