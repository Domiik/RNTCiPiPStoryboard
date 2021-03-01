//
//  ProfilePieViewController.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 18.02.2020.
//  Copyright © 2020 Domiik. All rights reserved.
//

import UIKit
import Charts
import Alamofire
import SwiftyJSON

class ProfilePieViewController: UIViewController {
    
    struct Logout: Encodable {
        let token: String
    }
    
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    @IBOutlet weak var pieChart: PieChartView!
    
    @IBOutlet weak var firstAchievement: UIImageView!
    @IBOutlet weak var secondAchievement: UIImageView!
    @IBOutlet weak var thirdAchiement: UIImageView!
    
    let defaults = UserDefaults.standard
    
    var humanHuman = PieChartDataEntry(value: 0)
    var humanNature = PieChartDataEntry(value: 0)
    var humanArtisticImage = PieChartDataEntry(value: 0)
    var humanTechnique = PieChartDataEntry(value: 0)
    var humanSignSystem = PieChartDataEntry(value: 0)
    
    
    var numberOfDownloadsDataEnries = [PieChartDataEntry]()
    
    
    func monoFilter(achievment: UIImageView, imageName: String) {
        let image = UIImage(named: imageName)
        let originalImage = CIImage(image: image!)
        
        let filter = CIFilter(name: "CIPhotoEffectMono")
        filter?.setDefaults()
        filter?.setValue(originalImage, forKey: kCIInputImageKey)
        
        if let outputImage = filter?.outputImage {
            let newImage = UIImage(ciImage: outputImage)
            achievment.image = newImage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spiner.startAnimating()
        postTest()
        
        
        print("FViewload")
        // Do any additional setup after loading the view.
    }
    
    
    
    func setup(pieChartView chartView: PieChartView) {
        
        chartView.drawSlicesUnderHoleEnabled = false
        chartView.holeRadiusPercent = 0.58
        chartView.transparentCircleRadiusPercent = 0.61
        chartView.chartDescription?.enabled = false
        chartView.setExtraOffsets(left: 5, top: 10, right: 5, bottom: 5)
        
        chartView.drawCenterTextEnabled = true
        
        let paragraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = .center
        
        let centerText = NSMutableAttributedString(string: "Компетентности")
        centerText.setAttributes([.font : UIFont(name: "HelveticaNeue-Light", size: 13)!,
                                  .paragraphStyle : paragraphStyle], range: NSRange(location: 0, length: centerText.length))
        
        chartView.centerAttributedText = centerText;
        
        chartView.drawHoleEnabled = true
        chartView.rotationAngle = 0
        chartView.rotationEnabled = true
        chartView.highlightPerTapEnabled = true
        
        let l = chartView.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .top
        l.orientation = .vertical
        l.drawInside = false
        l.xEntrySpace = 7
        l.yEntrySpace = 0
        l.yOffset = 0
    }
    
    
    
    
    
    
    func stopDownload() {
        setup(pieChartView: pieChart)
        
        if (defaults.bool(forKey: "firstAchievement") == true) {
            
        } else {
            monoFilter(achievment: firstAchievement, imageName: "first")
        }
        
        if (defaults.bool(forKey: "secondAchievement") == true) {
            
        } else {
            monoFilter(achievment: secondAchievement, imageName: "second")
        }
        
        if (defaults.bool(forKey: "thirdAchiement") == true) {
            
        } else {
            monoFilter(achievment: thirdAchiement, imageName: "third")
        }
        
        
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
        self.spiner.stopAnimating()
        self.spiner.hidesWhenStopped = true
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
    
    
    
    func postTest() {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(self.defaults.object(forKey: "Token")!)"
        ]
        
        AF.request("https://bromanla.ml/s/tests/",
                   method: .get,
                   headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    //print("succsesOKOKOK")
                    let json = JSON(value)
                    
                    if let testsArr = json["tests"].array {
                        for tests in testsArr {
                            if let ms = tests["ms"].int {
                                //self.humanSignSystem.value = Double(ms)
                                Points.savePointSignSystem(ms)
                            }
                            if let ma = tests["ma"].int {
                                //self.humanArtisticImage.value = Double(ma)
                                Points.savePointArtistic(ma)
                            }
                            if let mn = tests["mn"].int {
                                //self.humanNature.value = Double(mn)
                                Points.savePointNature(mn)
                            }
                            if let mm = tests["mm"].int {
                                // self.humanHuman.value = Double(mm)
                                Points.savePointHuman(mm)
                            }
                            if let mt = tests["mt"].int {
                                //self.humanTechnique.value = Double(mt)
                                Points.savePointTechnique(mt)
                            }
                            
                            if let name = tests["title"].string {
                                if name == "ЧГК" {
                                    self.defaults.set(true, forKey: "firstAchievement")
                                } else if name == "ДДО" {
                                    self.defaults.set(true, forKey: "secondAchievement")
                                } else if name == "ДРПН" {
                                    self.defaults.set(true, forKey: "thirdAchiement")
                                }
                            }
                        }
                        self.stopDownload()
                    }
                    
                case .failure(let error):
                    if let data = response.data {
                        print("Print Server Error: " + String(data: data, encoding: String.Encoding.utf8)!)
                    }
                    // print(error)
                }
        }
    }
    
    @IBAction func logoutAccount(_ sender: Any) {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        let data = Logout(token: defaults.string(forKey: "Logout")!)
        AF.request("https://bromanla.ml/auth/logout",
                   method: .post,
                   parameters: data,
                   encoder: JSONParameterEncoder.default,
                   headers: headers)
            .responseString{ response in
                //print(response.result)
                switch response.result {
                case .success:
                    self.defaults.removeObject(forKey: "Token")
                    self.defaults.removeObject(forKey: "Logout")
                    self.defaults.removeObject(forKey: "pointHuman")
                    self.defaults.removeObject(forKey: "pointNature")
                    self.defaults.removeObject(forKey: "pointArtisticImage")
                    self.defaults.removeObject(forKey: "pointTechnique")
                    self.defaults.removeObject(forKey: "pointSignSystem")
                    
                    self.defaults.removeObject(forKey: "firstAchievement")
                    self.defaults.removeObject(forKey: "secondAchievement")
                    self.defaults.removeObject(forKey: "thirdAchiement")
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil);
                    let vc = storyboard.instantiateViewController(withIdentifier: "Login")
                   
                    UIApplication.shared.windows.first?.rootViewController = vc
                case .failure(let error):
                    if let data = response.data {
                        print("Print Server Error: " + String(data: data, encoding: String.Encoding.utf8)!)
                    }
                    print(error)
                }
        }
    }
}




