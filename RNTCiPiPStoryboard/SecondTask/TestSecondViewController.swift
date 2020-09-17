//
//  TestSecondViewController.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 19.08.2020.
//  Copyright © 2020 Domiik. All rights reserved.
//

import UIKit
import Alamofire

class TestSecondViewController: UIViewController {
    
    @IBOutlet weak var imageProfession: UIImageView!
    @IBOutlet weak var endTest: UIButton!
    
    var count: Int = 1
    var countFirstButton = 0
    var countSecondButton = 0
    var countThirdButton = 0
    
    let defaults = UserDefaults.standard
    
    struct Data: Encodable {
           let title: String
           let mm: Int
           let mn: Int
           let mt: Int
           let ms: Int
           let ma: Int
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        endTest.isHidden = true
        
        randomImage()
    }
    
    var arrayA = ["a1", "a2", "a3", "a4", "a5", "a6", "a7", "a8", "a9", "a10","a11", "a12", "a13", "a14", "a15", "a16", "a17", "a18", "a19", "a20"]
    var arrayB = ["b1", "b2", "b3", "b4", "b5", "b6", "b7", "b8", "b9", "b10", "b11", "b12", "b13", "b14", "b15", "b16", "b17", "b18", "b19", "b20"]
    var arrayC = ["c1", "c2", "c3", "c4", "c5", "c6", "c7", "c8", "c9", "c10", "c11", "c12", "c13", "c14", "c15", "c16", "c17", "c18", "c19", "c20"]
    var arrayD = ["d1", "d2", "d3", "d4", "d5", "d6", "d7", "d8", "d9", "d10", "d11", "d12", "d13", "d14", "d15", "d16", "d17", "d18", "d19", "d20"]
    var arrayE = ["e1", "e2", "e3", "e4", "e5", "e6", "e7", "e8", "e9", "e10", "e11", "e12", "e13", "e14", "e15", "e16", "e17", "e18", "e19", "e20"]
    
    
    func randomAImage() -> UIImage {
        let unsignedArrayCount = UInt32(arrayA.count)
        let unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        let randomNumber = Int(unsignedRandomNumber)
        return UIImage(named: arrayA[randomNumber])!
    }
    
    func randomBImage() -> UIImage {
        let unsignedArrayCount = UInt32(arrayB.count)
        let unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        let randomNumber = Int(unsignedRandomNumber)
        return UIImage(named: arrayB[randomNumber])!
    }
    
    func randomCImage() -> UIImage {
        let unsignedArrayCount = UInt32(arrayC.count)
        let unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        let randomNumber = Int(unsignedRandomNumber)
        return UIImage(named: arrayC[randomNumber])!
    }
    
    func randomDImage() -> UIImage {
        let unsignedArrayCount = UInt32(arrayD.count)
        let unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        let randomNumber = Int(unsignedRandomNumber)
        return UIImage(named: arrayD[randomNumber])!
    }
    
    func randomEImage() -> UIImage {
        let unsignedArrayCount = UInt32(arrayE.count)
        let unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        let randomNumber = Int(unsignedRandomNumber)
        return UIImage(named: arrayE[randomNumber])!
    }
    
    func randomImage() {
        switch count {
        case 1:
            imageProfession.image = randomAImage()
            break
        case 2:
            imageProfession.image = randomBImage()
            break
        case 3:
            imageProfession.image = randomCImage()
            break
        case 4:
            imageProfession.image = randomDImage()
            break
        case 5:
            imageProfession.image = randomEImage()
            break
        case 6:
            imageProfession.image = randomAImage()
            break
        case 7:
            imageProfession.image = randomBImage()
            break
        case 8:
            imageProfession.image = randomCImage()
            break
        case 9:
            imageProfession.image = randomDImage()
            break
        case 10:
            imageProfession.image = randomEImage()
            break
        case 11:
            imageProfession.image = randomAImage()
            break
        case 12:
            imageProfession.image = randomBImage()
            break
        case 13:
            imageProfession.image = randomCImage()
            break
        case 14:
            imageProfession.image = randomDImage()
            break
        case 15:
            imageProfession.image = randomEImage()
            break
        case 16:
            imageProfession.image = randomAImage()
            break
        case 17:
            imageProfession.image = randomBImage()
            break
        case 18:
            imageProfession.image = randomCImage()
            break
        case 19:
            imageProfession.image = randomDImage()
            break
        case 20:
            imageProfession.image = randomEImage()
            break
        default:
            imageProfession.image = randomAImage()
        }
    }
    
    @IBAction func smileButton(_ sender: Any) {
        countFirstButton += 1
        
        switch countFirstButton {
        case 1:
            Points.savePointNature(2)
            print("2 balls")
            break
        case 2:
            Points.savePointSignSystem(2)
            print("2 balls")
            break
        case 3:
            Points.savePointTechnique(2)
            print("2 balls")
            break
        case 4:
            Points.savePointHuman(2)
            print("2 balls")
            break
        case 5:
            Points.savePointArtistic(2)
            print("2 balls")
            break
        case 6:
            Points.savePointNature(2)
            print("2 balls")
            break
        case 7:
            Points.savePointSignSystem(2)
            print("2 balls")
            break
        case 8:
            Points.savePointTechnique(2)
            break
        case 9:
            Points.savePointHuman(2)
            break
        case 10:
            Points.savePointArtistic(2)
            break
        case 11:
            Points.savePointNature(2)
            break
        case 12:
            Points.savePointSignSystem(2)
            break
        case 13:
            Points.savePointTechnique(2)
            break
        case 14:
            Points.savePointHuman(2)
            break
        case 15:
            Points.savePointArtistic(2)
            break
        case 16:
            Points.savePointNature(2)
            break
        case 17:
            Points.savePointSignSystem(2)
            break
        case 18:
            Points.savePointTechnique(2)
            break
        case 19:
            Points.savePointHuman(2)
            break
        case 20:
            Points.savePointArtistic(2)
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
    @IBAction func neutralButton(_ sender: Any) {
        countSecondButton += 1
        
        switch countSecondButton {
        case 1:
            Points.savePointNature(1)
            break
        case 2:
            Points.savePointSignSystem(1)
            break
        case 3:
            Points.savePointTechnique(1)
            break
        case 4:
            Points.savePointHuman(1)
            break
        case 5:
            Points.savePointArtistic(1)
            break
        case 6:
            Points.savePointNature(1)
            break
        case 7:
            Points.savePointSignSystem(1)
            break
        case 8:
            Points.savePointTechnique(1)
            break
        case 9:
            Points.savePointHuman(1)
            break
        case 10:
            Points.savePointArtistic(1)
            break
        case 11:
            Points.savePointNature(1)
            break
        case 12:
            Points.savePointSignSystem(1)
            break
        case 13:
            Points.savePointTechnique(1)
            break
        case 14:
            Points.savePointHuman(1)
            break
        case 15:
            Points.savePointArtistic(1)
            break
        case 16:
            Points.savePointNature(1)
            break
        case 17:
            Points.savePointSignSystem(1)
            break
        case 18:
            Points.savePointTechnique(1)
            break
        case 19:
            Points.savePointHuman(1)
            break
        case 20:
            Points.savePointArtistic(1)
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
    
    @IBAction func sadButton(_ sender: Any) {
        
        count += 1
        if count == 21 {
            endTest.isHidden = false
        }
        randomImage()
    }
    
    
    @IBAction func EndTest(_ sender: Any) {
        defaults.set(true, forKey: "thirdAchiement")
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "Back")
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil);
    }
    
    
    func postTest() {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(self.defaults.object(forKey: "Token")!)"
        ]
        
        let data = Data(title: "ДРПН", mm: Points.getPointHuman(), mn: Points.getPointNature(), mt: Points.getPointTechnique(), ms: Points.getPointSignSystem(), ma: Points.getPointArtistic())
        AF.request("https://bromanla.ml/s/tests",
        method: .post,
        parameters: data,
        encoder: JSONParameterEncoder.default,
        headers: headers)
        .responseString{ response in
            //print(response.result)
            switch response.result {
                case .success:
                    print("succsesOKOKOK")
                case .failure(let error):
                    if let data = response.data {
                        print("Print Server Error: " + String(data: data, encoding: String.Encoding.utf8)!)
                    }
                        print(error)
                }
        }
    }
    
}
