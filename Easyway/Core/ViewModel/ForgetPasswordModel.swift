//
//  ForgetPasswordModel.swift
//  Easyway
//
//  Created by Rayen Majdoub on 16/3/2023.
//

import SwiftUI

class ForgetPasswordModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var verifpassword: String = ""
    @Published var showpassword: Bool = false
    @Published var reEnterPassword :String = ""
    @Published var showRenterPassword : Bool = false
    @Published var verifCode :String = ""
    
    func sendCode()
    {
        
    }
    func verifyCode()
    {
        
    }
    func changePassword()
    {
        
    }
  
    
}

