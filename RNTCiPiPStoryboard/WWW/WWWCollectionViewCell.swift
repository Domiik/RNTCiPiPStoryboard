//
//  WWWCollectionViewCell.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 22.03.2020.
//  Copyright © 2020 Domiik. All rights reserved.
//

import UIKit

class WWWCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameCards: UILabel!
    @IBOutlet weak var highlightIndicator: UIView!
    @IBOutlet weak var selectIndicator: UIImageView!
    
    
    override var isHidden: Bool {
        didSet {
            highlightIndicator.isHidden = !isHighlighted
        }
    }
    
    override var isSelected: Bool {
        didSet {
            highlightIndicator.isHidden = !isSelected
            selectIndicator.isHidden = !isSelected
        }
    }
}
