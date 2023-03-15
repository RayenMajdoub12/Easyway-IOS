//
//  LoginModel.swift
//  Easyway
//
//  Created by Rayen Majdoub on 15/3/2023.
//

import SwiftUI

class LoginModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showpassword: Bool = false
    @Published var reEnterPassword :String = ""
    @Published var showRenterPassword : Bool = false
    
    func Login()
    {
        
    }
    func Register()
    {
        
    }
    func ForgotPassword()
    {
        
    }
    
}


