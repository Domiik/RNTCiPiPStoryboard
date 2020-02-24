//
//  Points.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 20.02.2020.
//  Copyright © 2020 Domiik. All rights reserved.
//

import UIKit

public struct Points {
    
    fileprivate static let defaults = UserDefaults.standard
    
    
    //    enum pointValue: Int {
    //        case pointHuman
    //        case pointNature
    //        case pointArtisticImage
    //        case pointTechnique
    //        case pointSignSystem
    //    }
    
    //MARK: -Saving point human
    static func savePointHuman(_ point: Int) {
        let i = defaults.integer(forKey: "pointHuman")
        if i == nil {
            defaults.set(1, forKey: "pointHuman")
        } else {
            defaults.set(point + i, forKey: "pointHuman")
        }
        
    }
    
    //MARK: -Getting point human
    static func getPointHuman()-> Int {
        let point = defaults.integer(forKey: "pointHuman")
        if point == nil {
            return 0
        } else {
            return point
        }
    }
    
    //MARK: -Saving point nature
    static func savePointNature(_ point: Int) {
        let i = defaults.integer(forKey: "pointNature")
        if i == nil {
            defaults.set(1, forKey: "pointNature")
        } else {
            defaults.set(point + i, forKey: "pointNature")
        }
    }
    //MARK: -Getting point nature
    static func getPointNature()-> Int {
        let point = defaults.integer(forKey: "pointNature")
        if point == nil {
            return 0
        } else {
            return point
        }
    }
    //MARK: -Saving point artistic
    static func savePointArtistic(_ point: Int) {
        let i = defaults.integer(forKey: "pointArtisticImage")
        if i == nil {
            defaults.set(1, forKey: "pointArtisticImage")
        } else {
            defaults.set(point + i, forKey: "pointArtisticImage")
        }
    }
    //MARK: -Getting point artistic
    static func getPointArtistic()-> Int {
        let pointHuman = defaults.integer(forKey: "pointArtisticImage")
        if pointHuman == nil {
            return 0
        } else {
            return pointHuman
        }
    }
    //MARK: -Saving point technique
    static func savePointTechnique(_ point: Int) {
        let i = defaults.integer(forKey: "pointTechnique")
        if i == nil {
            defaults.set(1, forKey: "pointTechnique")
        } else {
            defaults.set(point + i, forKey: "pointTechnique")
        }
    }
    //MARK: -Getting point technique
    static func getPointTechnique()-> Int {
        let pointHuman = defaults.integer(forKey: "pointTechnique")
        if pointHuman == nil {
            return 0
        } else {
            return pointHuman
        }
    }
    
    //MARK: -Saving point sign system
    static func savePointSignSystem(_ point: Int) {
        let i = defaults.integer(forKey: "pointSignSystem")
        if i == nil {
            defaults.set(1, forKey: "pointSignSystem")
        } else {
            defaults.set(point + i, forKey: "pointSignSystem")
        }
    }
    //MARK: -Getting point sign system
    static func getPointSignSystem()-> Int {
        let pointHuman = defaults.integer(forKey: "pointSignSystem")
        if pointHuman == nil {
            return 0
        } else {
            return pointHuman
        }
    }
    
}
