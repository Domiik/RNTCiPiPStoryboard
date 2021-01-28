//
//  ViewController.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 16.02.2020.
//  Copyright © 2020 Domiik. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var LoginTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    var activityIndicator:UIActivityIndicatorView!
    
    struct Login: Encodable {
        let username: String
        let password: String
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator =  UIActivityIndicatorView(style: .gray)
        activityIndicator.center = view.center
        activityIndicator.isHidden = true
        self.view.addSubview(activityIndicator)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        //        defaults.removeObject(forKey: "Token")
        //        defaults.removeObject(forKey: "pointHuman")
        //        defaults.removeObject(forKey: "pointNature")
        //        defaults.removeObject(forKey: "pointArtisticImage")
        //        defaults.removeObject(forKey: "pointTechnique")
        //        defaults.removeObject(forKey: "pointSignSystem")
        //
        //        defaults.removeObject(forKey: "firstAchievement")
        //        defaults.removeObject(forKey: "secondAchievement")
        //        defaults.removeObject(forKey: "thirdAchiement")
        //auto login if token true
        if(defaults.object(forKey: "Token") != nil) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier: "Back")
            vc.definesPresentationContext = true
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true, completion: nil);
        } else {
            
        }
    }
    
    @IBAction func LogIn(_ sender: Any) {
        //login
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        let login = Login(username: LoginTextField.text!, password: PasswordTextField.text!)
        // Do any additional setup after loading the view.
        AF.request("https://bromanla.ml/auth/login",
                   method: .post,
                   parameters: login,
                   encoder: JSONParameterEncoder.default,
                   headers: headers).responseJSON { response in
                //debugPrint(response)
                switch response.result {
                case .success:
                    //print("OKKKK")
                    if response.data != nil {
                        let json = try? JSON(data: response.data!)
                        let token = json?["jwt"].string
                        let tokenForLogout = json?["token"].string
                        self.defaults.set(tokenForLogout, forKey: "Logout")
                        self.defaults.set(token, forKey: "Token")
                        //print(self.defaults.object(forKey: "Token"))
                        self.activityIndicator.startAnimating()
                        let storyboard = UIStoryboard(name: "Main", bundle: nil);
                        let vc = storyboard.instantiateViewController(withIdentifier: "Back")
                        vc.definesPresentationContext = true
                        vc.modalPresentationStyle = .overCurrentContext
                        self.present(vc, animated: true, completion: nil);
                    }
                    break
                case .failure(let error):
                    print("neok")
                    let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    print(error)
                }
                
                    self.activityIndicator.stopAnimating()
        }
    }

    
    
}
