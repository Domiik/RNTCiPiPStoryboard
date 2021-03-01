//
//  ApiCall.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 01.02.2021.
//  Copyright © 2021 Domiik. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        return self.sharedInstance.isReachable
    }
}

enum ApiError: Error {
    case noData
    case noConnection
}

protocol ApiCall {
    func loginClient(login: String, password: String,completion: @escaping (Result<String, Error>) -> Void)
}

struct Login: Encodable {
    let username: String
    let password: String
}

struct Data: Encodable {
    let title: String
    let mm: Int
    let mn: Int
    let mt: Int
    let ms: Int
    let ma: Int
}




class ApiClient: ApiCall {
    
    let defaults = UserDefaults.standard
    
    func loginClient(login: String, password: String,completion: @escaping (Result<String, Error>) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        let login = Login(username: login, password: password)
        if Connectivity.isConnectedToInternet {
            AF.request("https://bromanla.ml/auth/login",
                       method: .post,
                       parameters: login,
                       encoder: JSONParameterEncoder.default,
                       headers: headers).responseJSON { response in
                        switch response.result {
                        case .success:
                            if response.data != nil {
                                let json = try? JSON(data: response.data!)
                                let token = json?["jwt"].string
                                let tokenForLogout = json?["token"].string
                                self.defaults.set(tokenForLogout, forKey: "Logout")
                                self.defaults.set(token, forKey: "Token")
                                completion(.success(token!))
                            }
                            break
                        case .failure(let error):
                            completion(.failure(ApiError.noData))
                        }
                       }
        } else {
            completion(.failure(ApiError.noConnection))
        }
        
    }
    
    
    func postSecondTest(title: String, mm: Int, mn: Int, mt: Int, ms: Int, ma: Int, completion: @escaping (Result<String, Error>) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(self.defaults.object(forKey: "Token")!)"
        ]
        let data = Data(title: title, mm: mm, mn: mn, mt: mt, ms: ms, ma: ma)
        if Connectivity.isConnectedToInternet {
            AF.request("https://bromanla.ml/s/tests",
                       method: .post,
                       parameters: data,
                       encoder: JSONParameterEncoder.default,
                       headers: headers)
                .responseString{ response in
                    switch response.result {
                    case .success:
                        completion(.success("ok"))
                        break
                    case .failure(let error):
                        self.putSecondTest(title: title, mm: mm, mn: mn, mt: mt, ms: ms, ma: ma, completion: {
                            result in
                        })
                        completion(.failure(ApiError.noData))
                        break
                        
                    }
                }
        } else {
            completion(.failure(ApiError.noConnection))
        }
    }
    
    
    func putSecondTest(title: String, mm: Int, mn: Int, mt: Int, ms: Int, ma: Int, completion: @escaping (Result<String, Error>) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(self.defaults.object(forKey: "Token")!)"
        ]
        let data = Data(title: title, mm: mm, mn: mn, mt: mt, ms: ms, ma: ma)
        if Connectivity.isConnectedToInternet {
            AF.request("https://bromanla.ml/s/tests",
                       method: .put,
                       parameters: data,
                       encoder: JSONParameterEncoder.default,
                       headers: headers)
                .responseString{ response in
                    switch response.result {
                    case .success:
                        completion(.success("ok"))
                        break
                    case .failure(let error):
                        print(error)
                        completion(.failure(ApiError.noData))
                        break
                        
                    }
                }
        } else {
            completion(.failure(ApiError.noConnection))
        }
    }
    
    
    
    func  postCalculated(title: String, mm: Int, mn: Int, mt: Int, ms: Int, ma: Int, completion: @escaping (Result <String, Error>) -> Void) {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(self.defaults.object(forKey: "Token")!)"
        ]
        
        let data = Data(title: title, mm: mm, mn: mn, mt: mt, ms: ms, ma: ma)
        if Connectivity.isConnectedToInternet {
            AF.request("https://bromanla.ml/s/tests",
                       method: .post,
                       parameters: data,
                       encoder: JSONParameterEncoder.default,
                       headers: headers)
                .responseString{ response in
                    //print(response.result)
                    switch response.result {
                    case .success:
                        completion(.success("ok"))
                        break
                    case .failure(let error):
                        completion(.failure(ApiError.noData))
                        break
                    }
                }
            
        } else {
            completion(.failure(ApiError.noConnection))
        }
        
    }
    
    
}
