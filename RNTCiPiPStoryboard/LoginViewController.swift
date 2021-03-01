//
//  LoginViewController.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 01.02.2021.
//  Copyright © 2021 Domiik. All rights reserved.
//

import UIKit
import MessageUI

class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let apiClient = ApiClient()
    
    var activityIndicator:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        
        activityIndicator =  UIActivityIndicatorView(style: .gray)
        activityIndicator.center = view.center
        activityIndicator.isHidden = true
        self.view.addSubview(activityIndicator)
        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        guard
            let info = notification.userInfo as NSDictionary?,
            let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size
        else {
            return
        }
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        scrollView?.contentInset = insets
        scrollView?.scrollIndicatorInsets = insets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func hideKeyboard() {
        scrollView?.endEditing(true)
    }
    
    
    
    @IBAction func LogIn(_ sender: Any) {
        self.activityIndicator.startAnimating()
        apiClient.loginClient(login: loginTextField.text!, password: passwordTextField.text!, completion: {
            result in
            DispatchQueue.main.async {
                switch result {
                case .success(let value) :
                    let storyboard = UIStoryboard(name: "Main", bundle: nil);
                    let vc = storyboard.instantiateViewController(withIdentifier: "Menu")
                    vc.definesPresentationContext = true
                    vc.modalPresentationStyle = .overCurrentContext
                    self.present(vc, animated: true, completion: nil);
                    self.activityIndicator.stopAnimating()
                    break
                case .failure(let error) :
                    if error as! ApiError == ApiError.noData {
                        let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        self.activityIndicator.stopAnimating()
                        break
                    } else if error as! ApiError == ApiError.noConnection {
                        let alert = UIAlertController(title: "Ошибка", message: "Нет интеренет соединения", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        self.activityIndicator.stopAnimating()
                        break
                    }
                }
            }
        })
    }
    
    
    @IBAction func emailMessageButton(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
            //mail.setToRecipients(<#T##toRecipients: [String]?##[String]?#>)
        }
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
