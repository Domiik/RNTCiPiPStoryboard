//
//  ProfileViewController.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 17.02.2020.
//  Copyright © 2020 Domiik. All rights reserved.
//

import UIKit
import TKRadarChart


class ProfileViewController: UIViewController, TKRadarChartDataSource, TKRadarChartDelegate, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let w = view.bounds.width
        let chart = TKRadarChart(frame: CGRect(x: 0, y: 0, width: w, height: w))
        chart.configuration.radius = w/3
        //chart.configuration.minValue = 50
        //chart.configuration.maxValue = 100
        chart.dataSource = self
        chart.delegate = self
        chart.center = view.center
        chart.reloadData()
        view.addSubview(chart)
        
        
    }
    
    func numberOfStepForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 3
    }
    func numberOfRowForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 5
    }
    func numberOfSectionForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 1
    }
    
    func titleOfRowForRadarChart(_ radarChart: TKRadarChart, row: Int) -> String {
        switch row {
        case 0:
            return "ЧЧ"
        case 1:
            return "ЧП"
        case 2:
            return "ЧТ"
        case 3:
            return "ЧМ"
        case 4:
            return "ЧК"
        default:
            "ok"
        }
        return "NO.\(row + 1)"
    }
    
    func valueOfSectionForRadarChart(withRow row: Int, section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat(max(row, 3))
        } else {
            return 3
        }
    }
    
    
    func colorOfLineForRadarChart(_ radarChart: TKRadarChart) -> UIColor {
        return UIColor(red:0.337,  green:0.847,  blue:0.976, alpha:1)
    }
    
    func colorOfFillStepForRadarChart(_ radarChart: TKRadarChart, step: Int) -> UIColor {
        switch step {
        case 1:
            return UIColor(red:0.545,  green:0.906,  blue:0.996, alpha:1)
        case 2:
            return UIColor(red:0.706,  green:0.929,  blue:0.988, alpha:1)
        case 3:
            return UIColor(red:0.831,  green:0.949,  blue:0.984, alpha:1)
        case 4:
            return UIColor(red:0.922,  green:0.976,  blue:0.988, alpha:1)
        default:
            return UIColor.white
        }
    }
    
    func colorOfSectionFillForRadarChart(_ radarChart: TKRadarChart, section: Int) -> UIColor {
        if section == 0 {
            return UIColor(red:1,  green:0.867,  blue:0.012, alpha:0.4)
        } else {
            return UIColor(red:0,  green:0.788,  blue:0.543, alpha:0.4)
        }
    }
    
    func colorOfSectionBorderForRadarChart(_ radarChart: TKRadarChart, section: Int) -> UIColor {
        if section == 0 {
            return UIColor(red:1,  green:0.867,  blue:0.012, alpha:1)
        } else {
            return UIColor(red:0,  green:0.788,  blue:0.543, alpha:1)
        }
    }
    
    func fontOfTitleForRadarChart(_ radarChart: TKRadarChart) -> UIFont {
        return UIFont.systemFont(ofSize: 10)
    }
    
    
    
}
