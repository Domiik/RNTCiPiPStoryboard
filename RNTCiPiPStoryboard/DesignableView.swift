//
//  DesignableView.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 16.02.2020.
//  Copyright © 2020 Domiik. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableView: UIView {
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    
    @IBInspectable var shadowRaduis: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRaduis
        }
    }
    
    
    @IBInspectable var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
}
