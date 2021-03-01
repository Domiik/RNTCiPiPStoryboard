//
//  CalculationOfResultsWWW.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 29.06.2020.
//  Copyright © 2020 Domiik. All rights reserved.
//

import UIKit
import Alamofire

class CalculationOfResultsWWW: UIViewController {
    
    var arrayyForQuality_What: [Int] = []
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var textOutputForWWW: UILabel!
    let apiClient = ApiClient()
    
    var a1: Int!
    var a2: Int!
    var a3: Int!
    var a4: Int!
    var a5: Int!
    var a6: Int!
    var a7: Int!
    var a8: Int!
    var a9: Int!
    
    
    var a1b1: Int!
    var a2b2: Int!
    var a3b3: Int!
    var a4b4: Int!
    var a5b5: Int!
    var a6b6: Int!
    var a7b7: Int!
    var a8b8: Int!
    var a9b9: Int!
    
    var b1: Int!
    var b2: Int!
    var b3: Int!
    var b4: Int!
    var b5: Int!
    
    
    var c1: Int!
    var c2: Int!
    var c3: Int!
    var c4: Int!
    var c5: Int!
    
    
    struct Data: Encodable {
        let title: String
        let mm: Int
        let mn: Int
        let mt: Int
        let ms: Int
        let ma: Int
    }
    
    var mm: Int!
    var mn: Int!
    var mt: Int!
    var ms: Int!
    var ma: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        print(ModelWWW.instance.qualitiesArray)
        //        print(ModelWWW.instance.whatArray)
        //        print(ModelWWW.instance.whereArray)
        
        a1 = ModelWWW.instance.qualitiesArray[0]
        a2 = ModelWWW.instance.qualitiesArray[1]
        a3 = ModelWWW.instance.qualitiesArray[2]
        a4 = ModelWWW.instance.qualitiesArray[3]
        a5 = ModelWWW.instance.qualitiesArray[4]
        a6 = ModelWWW.instance.qualitiesArray[5]
        a7 = ModelWWW.instance.qualitiesArray[6]
        a8 = ModelWWW.instance.qualitiesArray[7]
        a9 = ModelWWW.instance.qualitiesArray[8]
        
        arrayyForQuality_What = ModelWWW.instance.whatArrayCollection[a1-1]
        //print(arrayyForQuality_What)
        findElement()
        arrayyForQuality_What = ModelWWW.instance.whereArrayCollection[a1-1]
        findElementWhere()
        a1b1 = ModelWWW.instance.i
        //print("a1b1\(a1b1)")
        ModelWWW.instance.i = 0
        
        arrayyForQuality_What = ModelWWW.instance.whatArrayCollection[a2-1]
        //print(arrayyForQuality_What)
        findElement()
        arrayyForQuality_What = ModelWWW.instance.whereArrayCollection[a2-1]
        findElementWhere()
        a2b2 = ModelWWW.instance.i
        //print("a1b1\(a2b2)")
        ModelWWW.instance.i = 0
        
        arrayyForQuality_What = ModelWWW.instance.whatArrayCollection[a3-1]
        //print(arrayyForQuality_What)
        findElement()
        arrayyForQuality_What = ModelWWW.instance.whereArrayCollection[a3-1]
        findElementWhere()
        a3b3 = ModelWWW.instance.i
        //print("a1b1\(a3b3)")
        ModelWWW.instance.i = 0
        
        arrayyForQuality_What = ModelWWW.instance.whatArrayCollection[a4-1]
        //print(arrayyForQuality_What)
        findElement()
        arrayyForQuality_What = ModelWWW.instance.whereArrayCollection[a4-1]
        findElementWhere()
        a4b4 = ModelWWW.instance.i
        //print("a1b1\(a4b4)")
        ModelWWW.instance.i = 0
        
        arrayyForQuality_What = ModelWWW.instance.whatArrayCollection[a5-1]
        //print(arrayyForQuality_What)
        findElement()
        arrayyForQuality_What = ModelWWW.instance.whereArrayCollection[a5-1]
        findElementWhere()
        a5b5 = ModelWWW.instance.i
        //print("a1b1\(a5b5)")
        ModelWWW.instance.i = 0
        
        arrayyForQuality_What = ModelWWW.instance.whatArrayCollection[a6-1]
        //print(arrayyForQuality_What)
        findElement()
        arrayyForQuality_What = ModelWWW.instance.whereArrayCollection[a6-1]
        findElementWhere()
        a6b6 = ModelWWW.instance.i
        //print("a1b1\(a6b6)")
        ModelWWW.instance.i = 0
        
        arrayyForQuality_What = ModelWWW.instance.whatArrayCollection[a7-1]
        //print(arrayyForQuality_What)
        findElement()
        arrayyForQuality_What = ModelWWW.instance.whereArrayCollection[a7-1]
        findElementWhere()
        a7b7 = ModelWWW.instance.i
        //print("a1b1\(a7b7)")
        ModelWWW.instance.i = 0
        
        arrayyForQuality_What = ModelWWW.instance.whatArrayCollection[a8-1]
        //print(arrayyForQuality_What)
        findElement()
        arrayyForQuality_What = ModelWWW.instance.whereArrayCollection[a8-1]
        findElementWhere()
        a8b8 = ModelWWW.instance.i
        //print("a1b1\(a8b8)")
        ModelWWW.instance.i = 0
        
        arrayyForQuality_What = ModelWWW.instance.whatArrayCollection[a9-1]
        //print(arrayyForQuality_What)
        findElement()
        arrayyForQuality_What = ModelWWW.instance.whereArrayCollection[a9-1]
        findElementWhere()
        a9b9 = ModelWWW.instance.i
        //print("a1b1\(a9b9)")
        ModelWWW.instance.i = 0
        
        let latgest = max(a1b1, a2b2, a3b3, a4b4, a5b5, a6b6, a7b7, a8b8, a9b9)
        var maximum: Int!
        let a = max(a1b1, a2b2)
        
        if(a1b1 >= a2b2 && a1b1 >= a3b3 && a1b1 >= a4b4 && a1b1 >= a5b5 && a1b1 >= a6b6 && a1b1 >= a7b7 && a1b1 >= a8b8 && a1b1 >= a9b9) {
            print(ModelWWW.instance.nameQualities[a1-1])
            showProfession(s:ModelWWW.instance.nameQualities[a1-1])
        }
        if(a2b2 >= a1b1 && a2b2 >= a3b3 && a2b2 >= a4b4 && a2b2 >= a5b5 && a2b2 >= a6b6 && a2b2 >= a7b7 && a2b2 >= a8b8 && a2b2 >= a9b9) {
            print(ModelWWW.instance.nameQualities[a2-1])
            showProfession(s: ModelWWW.instance.nameQualities[a2-1])
        }
        if(a3b3 >= a2b2 && a3b3 >= a1b1 && a3b3 >= a4b4 && a3b3 >= a5b5 && a3b3 >= a6b6 && a3b3 >= a7b7 && a3b3 >= a8b8 && a3b3 >= a9b9) {
            print(ModelWWW.instance.nameQualities[a3-1])
            showProfession(s: ModelWWW.instance.nameQualities[a3-1])
        }
        if(a4b4 >= a2b2 && a4b4 >= a3b3 && a4b4 >= a1b1 && a4b4 >= a5b5 && a4b4 >= a6b6 && a4b4 >= a7b7 && a4b4 >= a8b8 && a4b4 >= a9b9) {
            print(ModelWWW.instance.nameQualities[a4-1])
            showProfession(s: ModelWWW.instance.nameQualities[a4-1])
        }
        if(a5b5 >= a2b2 && a5b5 >= a3b3 && a5b5 >= a4b4 && a5b5 >= a1b1 && a5b5 >= a6b6 && a5b5 >= a7b7 && a5b5 >= a8b8 && a5b5 >= a9b9) {
            print(ModelWWW.instance.nameQualities[a5-1])
            showProfession(s: ModelWWW.instance.nameQualities[a5-1])
        }
        if(a6b6 >= a2b2 && a6b6 >= a3b3 && a6b6 >= a4b4 && a6b6 >= a5b5 && a6b6 >= a1b1 && a6b6 >= a7b7 && a6b6 >= a8b8 && a6b6 >= a9b9) {
            print(ModelWWW.instance.nameQualities[a6-1])
            showProfession(s: ModelWWW.instance.nameQualities[a6-1])
        }
        if(a7b7 >= a2b2 && a7b7 >= a3b3 && a7b7 >= a4b4 && a7b7 >= a5b5 && a7b7 >= a6b6 && a7b7 >= a1b1 && a7b7 >= a8b8 && a7b7 >= a9b9) {
            print(ModelWWW.instance.nameQualities[a7-1])
            showProfession(s: ModelWWW.instance.nameQualities[a7-1])
        }
        if(a8b8 >= a2b2 && a8b8 >= a3b3 && a8b8 >= a4b4 && a8b8 >= a5b5 && a8b8 >= a6b6 && a8b8 >= a7b7 && a8b8 >= a1b1 && a8b8 >= a9b9) {
            print(ModelWWW.instance.nameQualities[a8-1])
            showProfession(s: ModelWWW.instance.nameQualities[a8-1])
        }
        if(a9b9 >= a2b2 && a9b9 >= a3b3 && a9b9 >= a4b4 && a9b9 >= a5b5 && a9b9 >= a6b6 && a9b9 >= a7b7 && a9b9 >= a8b8 && a9b9 >= a1b1) {
            print(ModelWWW.instance.nameQualities[a9-1])
            showProfession(s: ModelWWW.instance.nameQualities[a9-1])
        }
        
        print("max\(latgest)")
        //showProfession(s: latgest)
        
    }
    
    func findElement() {
        for i in ModelWWW.instance.whatArray {
            ModelWWW.instance.findNumberForWhat(a: arrayyForQuality_What, b: i)
        }
    }
    
    func findElementWhere() {
        for i in ModelWWW.instance.whereArray {
            ModelWWW.instance.findNumberForWhat(a: arrayyForQuality_What, b: i)
        }
    }
    
    //show cinclusions by profession
    func showProfession(s: String) {
        if (s == "К-5.Умение общаться: обаяние, воспитанность, находчивость " || s == "К-11.Уравновешенность – способность сдерживать себя и не впадать в отчаяние " || s == "К-6.Гуманность, доброта, бескорыстность " || s == "К-12.Оптимизм, чувство юмора " || s == "K-2.Общая эрудиция - умение ориентироваться в различных вопросах и областях знания" || s == "К-4.Жизненный опыт, мудрость " || s == "К-10.Достоинство и честь, порядочность, репутация " || s == "К-8.Воля, смелость, принципиальность " || s == "К-9.Самокритичность – умение признаваться в собственных ошибках" ) {
            textOutputForWWW.text = ModelWWW.instance.textForOutput[0]
            self.mm = 1
            self.mt = 0
            self.mn = 0
            self.ms = 0
            self.ma = 0
        } else if(s == "К-16.Хорошая память " || s == "К-14.Умение сосредоточиваться на конкретном деле " || s == "К-17.Умение оперативно искать информацию – через Интернет, пользоваться записными книжками, картотеками, каталогами, справочниками " || s ==  "K-1.Специальные знания - хорошая ориентировка в конкртеной области, в своем деле" || s ==  "К-13.Логичность, строгость мышления ") {
            textOutputForWWW.text = ModelWWW.instance.textForOutput[1]
            self.mm = 0
            self.mt = 0
            self.mn = 0
            self.ms = 1
            self.ma = 0
        } else if(s == "К-15.Умение переключать внимание, быстро улавливать изменения в ситуации " || s == "К-24.Выносливость и работоспособность – умение работать с постоянными нагрузками, надолго мобилизовывать свои силы " || s == "К-25.Быстродействие, хорошая реакция " || s == "К-20. «Золотые руки» - отличная координация кистей и пальцев рук, умение работать все быстро и качественно") {
            textOutputForWWW.text = ModelWWW.instance.textForOutput[2]
            self.mm = 0
            self.mt = 1
            self.mn = 0
            self.ms = 0
            self.ma = 0
        } else if(s == "К-21.Физическая сила " || s == "К-23.Здоровье – отличная работа различных систем организма " || s == "К-27.Развитые органы чувств: зрение, слух, обоняние, вкус, кожномышечная чувствительность, вестибулярный аппарат, чувство времени " || s == "К-19.Владение телом – ловкость, координация движений " || s == "К-7.Активность, инициативность, предприимчивость ") {
            textOutputForWWW.text = ModelWWW.instance.textForOutput[3]
            self.mm = 0
            self.mt = 0
            self.mn = 1
            self.ms = 0
            self.ma = 0
        } else if(s == "К-3.Творческое воображение, интуиция " || s == "К-26.Владение голосом: интонациями, тембром, высотой, силой " || s == "К-18.Владение мимикой, позами, жестами – умение выглядеть изящно, привлекательно и убедительно " || s == "К-22.Внешние достоинства, красота ") {
            textOutputForWWW.text = ModelWWW.instance.textForOutput[4]
            self.mm = 0
            self.mt = 0
            self.mn = 0
            self.ms = 0
            self.ma = 1
        }
    }
    
    @IBAction func endTest(_ sender: Any) {
        apiClient.postCalculated(title: "ЧГК", mm: self.mm, mn: self.mn, mt: self.mt, ms: self.ms, ma: self.ma, completion: {
            result in
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    self.defaults.set(true, forKey:"secondAchievement")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil);
                    let vc = storyboard.instantiateViewController(withIdentifier: "Back")
                    vc.definesPresentationContext = true
                    vc.modalPresentationStyle = .overCurrentContext
                    self.present(vc, animated: true, completion: nil);
                    break
                case .failure(let error):
                    if error as! ApiError == ApiError.noData {
                        let alert = UIAlertController(title: "Ошибка", message: "Сервер не отвечает", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        break
                    } else if error as! ApiError == ApiError.noConnection {
                        let alert = UIAlertController(title: "Ошибка", message: "Нет интеренет соединения", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        break
                    }
                }
            }
        })
    }
    
    
    
    
    let dynamicFontLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40)
        label.textAlignment = .center
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    
    func postTest() {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(self.defaults.object(forKey: "Token")!)"
        ]
        
        let data = Data(title: "ЧГК", mm: self.mm, mn: self.mn, mt: self.mt, ms: self.ms, ma: self.ma)
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
        defaults.set(true, forKey:"secondAchievement")
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "Back")
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil);
    }
    
}
