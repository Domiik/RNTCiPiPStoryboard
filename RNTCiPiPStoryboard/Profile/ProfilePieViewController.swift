//
//  ProfilePieViewController.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 18.02.2020.
//  Copyright © 2020 Domiik. All rights reserved.
//

import UIKit
import Charts

class ProfilePieViewController: UIViewController {

    @IBOutlet weak var pieChart: PieChartView!
    
    var humanHuman = PieChartDataEntry(value: 0)
    var humanNature = PieChartDataEntry(value: 0)
    var humanArtisticImage = PieChartDataEntry(value: 0)
    var humanTechnique = PieChartDataEntry(value: 0)
    var humanSignSystem = PieChartDataEntry(value: 0)
    
    
    var numberOfDownloadsDataEnries = [PieChartDataEntry]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieChart.chartDescription?.text = ""
        
        
        humanHuman.value = Double(Points.getPointHuman())
        humanHuman.label = "Человек человек"
        
        humanNature.value = Double(Points.getPointNature())
        humanNature.label = "Человек Природа"
        
        
        humanArtisticImage.value = Double(Points.getPointArtistic())
        humanArtisticImage.label = "Человек Художественный образ"
               
        humanTechnique.value = Double(Points.getPointTechnique())
        humanTechnique.label = "Человек Техника"
        
        humanSignSystem.value = Double(Points.getPointSignSystem())
        humanSignSystem.label = "Человек Знаковая система"
               
        
        numberOfDownloadsDataEnries = [humanHuman, humanNature, humanArtisticImage, humanTechnique, humanSignSystem]
        
        
        updateChartData()
        print("FViewload")
        // Do any additional setup after loading the view.
    }
    
    override  func awakeFromNib() {
        print("awake")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("willapear")
        
        pieChart.chartDescription?.text = ""
        
        
        humanHuman.value = Double(Points.getPointHuman())
        humanHuman.label = "ЧЧ"
        
        humanNature.value = Double(Points.getPointNature())
        humanNature.label = "ЧП"
        
        
        humanArtisticImage.value = Double(Points.getPointArtistic())
        humanArtisticImage.label = "ЧХ"
        
        humanTechnique.value = Double(Points.getPointTechnique())
        humanTechnique.label = "ЧТ"
        
        humanSignSystem.value = Double(Points.getPointSignSystem())
        humanSignSystem.label = "ЧЗ"
        
        
        numberOfDownloadsDataEnries = [humanHuman, humanNature, humanArtisticImage, humanTechnique, humanSignSystem]
        
        
               updateChartData()
    }
    
    
    
    func updateChartData() {
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadsDataEnries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
       
        let colors = [UIColor.blue, UIColor.black, UIColor.orange, UIColor.red, UIColor.purple]
        chartDataSet.colors = colors as! [NSUIColor]
        
        pieChart.data = chartData
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
