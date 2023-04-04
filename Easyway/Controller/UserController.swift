//
//  UserController.swift
//  Easyway
//
//  Created by Rayen Majdoub on 24/3/2023.
//

import Foundation
import Alamofire

class UserController {
    static let shared = UserController()
    
    private let baseUrl = "\(Shared.sharedBaseUrl)/auth" // Replace with your server URL
    
    private init() {}
    
    func login(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "\(baseUrl)/login"
        let parameters: [String: Any] = ["email": email,"password": password    ]
        print(parameters)

        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            print(response)
            switch response.result {
            case .success(let value):
                if let dict = value as? [String: Any], let token = dict["token"] as? String {
                    // Save the token to UserDefaults
                    print(parameters)
                    UserDefaults.standard.set(token, forKey: "jwtToken")
                    completion(.success(token))
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Response serialization failed"])
                    completion(.failure(error))

                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
    func signup(user: User, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "\(baseUrl)/register"
        let parameters: [String: Any] = ["username": user.username,"email": user.email,"password": user.password    ]
        print(parameters)
        AF.request(url, method: .post, parameters: parameters , encoding: JSONEncoding.default).responseJSON { response in
            print(response)
            switch response.result {
            case .success(let message):
                if let dict = message as? [String: Any], let message = dict["message"] as? String {
                    print ("im in success")
                    print(message)
                    completion(.success(message))
                } else {
                    print("im in error ")
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Response serialization failed"])
                    completion(.failure(error))


                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
       func resetPassword(email: String, password: String, onSuccess: @escaping (_ title: String, _ message: String) -> Void, onFailure: @escaping (_ title: String, _ message: String) -> Void) {
           let url = "\(baseUrl)/resetpassword"
           AF.request(url,
                      method: .post,
                      parameters: ["email": email , "password" : password],
                      encoding: JSONEncoding.default)
               .validate(statusCode: 200..<401)
               .validate(contentType: ["application/json"])
               .responseJSON { response in
                   switch response.result {
                   case .success(let data):
                       guard let jsonData = data as? [String: Any],
                             let statusCode = response.response?.statusCode else {
                           onFailure("Error", "something went wrong please try again")
                           return
                       }

                       switch statusCode {
                       case 200:
                           onSuccess("Done", "your password has been successfully changed")
                       case 400:
                           onSuccess("Error", "something went wrong please try again")
                       default:
                            onFailure("Error", "something went wrong please try again")
                                      
                                   }
                   case .failure(let error):
                       print(error)
                       onFailure("Error", "Network request failed")
                   }
               }
       }


}
