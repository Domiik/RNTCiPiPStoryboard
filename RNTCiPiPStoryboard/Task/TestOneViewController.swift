//
//  TestOneViewController.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 17.02.2020.
//  Copyright © 2020 Domiik. All rights reserved.
//

import UIKit

class TestOneViewController: UIViewController {

    @IBOutlet weak var imageViewOne: UIButton!
    @IBOutlet weak var imageViewTwo: UIButton!
    
    @IBOutlet weak var endTest: UIButton!
    
    
    var array1a = ["1а1", "1а2", "1а3", "1а4", "1а5"]
    var array1b = ["1б1", "1б2", "1б3", "1б4", "1б5"]
    var array2a = ["2а1", "2а2", "2а3", "2а4", "2а5"]
    var array2b = ["2б1", "2б2", "2б3", "2б4", "2б5"]
    var array3a = ["3а1", "3а2", "3а3", "3а4", "3а5"]
    var array3b = ["3б1", "3б2", "3б3", "3б4", "3б5"]
    var array4a = ["4а1", "4а2", "4а3", "4а4", "4а5"]
    var array4b = ["4б1", "4б2", "4б4", "4б5"]
    var array5a = ["5а1", "5а2", "5а3", "5а4", "5а5"]
    var array5b = ["5б1", "5б2", "5б3", "5б4", "5б5"]
    var array6a = ["6а1", "6а2", "6а3", "6а4", "6а5"]
    var array6b = ["6б1", "6б2", "6б3", "6б4", "6б5"]
    var array7a = ["7а1", "7а2", "7а4", "7а5"]
    var array7b = ["7б1", "7б2", "7б3", "7б4", "7б5"]
    var array8a = ["8а1", "8а2", "8а3", "8а4", "8а5"]
    var array8b = ["8б1", "8б2", "8б3", "8б4", "8б5"]
    var array9a = ["9а1", "9а2", "9а3", "9а4", "9а5"]
    var array9b = ["9б1", "9б2", "9б3", "9б4", "9б5"]
    var array10a = ["10а1", "10а2", "10а3", "10а4"]
    var array10b = ["10б1", "10б2", "10б3", "10б4", "10б5"]
    var array11a = ["11а1", "11а2", "11а3", "11а4", "11а5"]
    var array11b = ["11б1", "11б2", "11б3", "11б4", "11б5"]
    var array12a = ["12а1", "12а2", "12а3", "12а4", "12а5"]
    var array12b = ["12б1", "12б2", "12б3", "12б4", "12б5"]
    var array13a = ["13а1", "13а2", "13а3", "13а4", "13а5"]
    var array13b = ["13б1", "13б2", "13б3", "13б4", "13б5"]
    var array14a = ["14а1", "14а2", "14а3", "14а4", "14а5"]
    var array14b = ["14б1", "14б2", "14б3", "14б4", "14б5"]
    var array15a = ["15а1", "15а2", "15а3", "15а4", "15а5"]
    var array15b = ["15б1", "15б2", "15б3", "15б4", "15б5"]
    var array16a = ["16а1", "16а2", "16а3", "16а4", "16а5"]
    var array16b = ["16б1", "16б2", "16б3", "16б4", "16б5"]
    var array17a = ["17а1", "17а2", "17а3", "17а4", "17а5"]
    var array17b = ["17б1", "17б2", "17б3", "17б4", "17б5"]
    var array18a = ["18а1", "18а2", "18а3", "18а4", "18а5"]
    var array18b = ["18б1", "18б3", "18б4", "18б5", "18б6"]
    var array19a = ["19а1", "19а2", "19а3", "19а4", "19а5"]
    var array19b = ["19б1", "19б2", "19б3", "19б4", "19б5"]
    var array20a = ["20а1", "20а2", "20а3", "20а4", "20а5"]
    var array20b = ["20б1", "20б2", "20б3", "20б4", "20б5"]
    
    var count: Int = 1
    var countFirstButton = 0
    var countSecondButton = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        endTest.isHidden = true
        randomImage()
        //imageViewOne.setImage(UIImage(named: array1a.randomElement()!.description), for: .normal)
        //imageViewTwo.setImage(UIImage(named: array1b.randomElement()!.description), for: .normal)
        //print(count)
      
        // Do any additional setup after loading the view.

    }
    
    func randomImage() {
        switch count {
        case 1:
            imageViewTwo.setImage(UIImage(named: array1a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array1b.randomElement()!.description), for: .normal)
            break
        case 2:
            imageViewTwo.setImage(UIImage(named: array2a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array2b.randomElement()!.description), for: .normal)
            break
        case 3:
            imageViewTwo.setImage(UIImage(named: array3a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array3b.randomElement()!.description), for: .normal)
            break
        case 4:
            imageViewTwo.setImage(UIImage(named: array4a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array4b.randomElement()!.description), for: .normal)
            break
        case 5:
            imageViewTwo.setImage(UIImage(named: array5a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array5b.randomElement()!.description), for: .normal)
            break
        case 6:
            imageViewTwo.setImage(UIImage(named: array6a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array6b.randomElement()!.description), for: .normal)
            break
        case 7:
            imageViewTwo.setImage(UIImage(named: array7a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array7b.randomElement()!.description), for: .normal)
            break
        case 8:
            imageViewTwo.setImage(UIImage(named: array8a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array8b.randomElement()!.description), for: .normal)
            break
        case 9:
            imageViewTwo.setImage(UIImage(named: array9a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array9b.randomElement()!.description), for: .normal)
            break
        case 10:
            imageViewTwo.setImage(UIImage(named: array10a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array10b.randomElement()!.description), for: .normal)
            break
        case 11:
            imageViewTwo.setImage(UIImage(named: array11a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array11b.randomElement()!.description), for: .normal)
            break
        case 12:
            imageViewTwo.setImage(UIImage(named: array12a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array12b.randomElement()!.description), for: .normal)
            break
        case 13:
            imageViewTwo.setImage(UIImage(named: array13a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array13b.randomElement()!.description), for: .normal)
            break
        case 14:
            imageViewTwo.setImage(UIImage(named: array14a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array14b.randomElement()!.description), for: .normal)
            break
        case 15:
            imageViewTwo.setImage(UIImage(named: array15a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array15b.randomElement()!.description), for: .normal)
            break
        case 16:
            imageViewTwo.setImage(UIImage(named: array16a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array16b.randomElement()!.description), for: .normal)
            break
        case 17:
            imageViewTwo.setImage(UIImage(named: array17a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array17b.randomElement()!.description), for: .normal)
            break
        case 18:
            imageViewTwo.setImage(UIImage(named: array18a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array18b.randomElement()!.description), for: .normal)
            break
        case 19:
            imageViewTwo.setImage(UIImage(named: array19a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array19b.randomElement()!.description), for: .normal)
            break
        case 20:
            imageViewTwo.setImage(UIImage(named: array20a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array20b.randomElement()!.description), for: .normal)
            break
        default:
            imageViewTwo.setImage(UIImage(named: array1a.randomElement()!.description), for: .normal)
            imageViewOne.setImage(UIImage(named: array1b.randomElement()!.description), for: .normal)
            break
        }
        
    }
         
    @IBAction func firstClickTest(_ sender: Any) {
        
        countFirstButton += 1
        print(countFirstButton)
        
        switch countFirstButton {
        case 1:
            Points.savePointNature(1)
            break
        case 2:
            Points.savePointHuman(1)
            break
        case 3:
            Points.savePointArtistic(1)
            break
        case 4:
            Points.savePointTechnique(1)
            break
        case 5:
            Points.savePointSignSystem(1)
            break
        case 6:
            Points.savePointNature(1)
            break
        case 7:
            Points.savePointArtistic(1)
            break
        case 8:
            Points.savePointHuman(1)
            break
        case 9:
            Points.savePointTechnique(1)
            break
        case 10:
            Points.savePointNature(1)
            break
        case 11:
            Points.savePointNature(1)
            break
        case 12:
            Points.savePointHuman(1)
            break
        case 13:
            Points.savePointArtistic(1)
            break
        case 14:
            Points.savePointTechnique(1)
            break
        case 15:
            Points.savePointSignSystem(1)
            break
        case 16:
            Points.savePointNature(1)
            break
        case 17:
            Points.savePointArtistic(1)
            break
        case 18:
            Points.savePointHuman(1)
            break
        case 19:
            Points.savePointTechnique(1)
            break
        case 20:
            Points.savePointNature(1)
            break
        default:
            print("error")
        }
        count += 1
        if count == 21 {
            endTest.isHidden = false
        }
        
          randomImage()
    }
    
    @IBAction func secondClickTest(_ sender: Any) {
        
        countSecondButton += 1
        print(countSecondButton)
        
        switch countSecondButton {
        case 1:
            Points.savePointTechnique(1)
            break
        case 2:
            Points.savePointSignSystem(1)
            break
        case 3:
            Points.savePointNature(1)
            break
        case 4:
            Points.savePointHuman(1)
            break
        case 5:
            Points.savePointArtistic(1)
            break
        case 6:
            Points.savePointHuman(1)
            break
        case 7:
            Points.savePointTechnique(1)
            break
        case 8:
            Points.savePointArtistic(1)
            break
        case 9:
            Points.savePointSignSystem(1)
            break
        case 10:
            Points.savePointSignSystem(1)
            break
        case 11:
            Points.savePointTechnique(1)
            break
        case 12:
            Points.savePointSignSystem(1)
            break
        case 13:
            Points.savePointNature(1)
            break
        case 14:
            Points.savePointHuman(1)
            break
        case 15:
            Points.savePointArtistic(1)
            break
        case 16:
            Points.savePointHuman(1)
            break
        case 17:
            Points.savePointTechnique(1)
            break
        case 18:
            Points.savePointArtistic(1)
            break
        case 19:
            Points.savePointSignSystem(1)
            break
        case 20:
            Points.savePointSignSystem(1)
            break
        default:
            print("error")
        }
        
        count += 1
        if count == 21 {
            endTest.isHidden = false
        }
        
         randomImage()
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
