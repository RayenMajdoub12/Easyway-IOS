//
//  LoginPage.swift
//  Easyway
//
//  Created by Rayen Majdoub on 15/3/2023.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginData: LoginModel = LoginModel()
    @State private var showingDrawerView = false
    

    var body: some View {
 VStack{
            VStack{
                Text("Welcome \nback")
                    .font(.custom(Fonts.Font1, size: 55))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .frame(height: 220)
                    .padding(30)
                    
            }
     
     ScrollView(.vertical,showsIndicators: false)
     {
         VStack(spacing: 15)
         {
             Text("Login")
                 .font(.custom(Fonts.Font1, size: 22))
                 .frame(maxWidth:  .infinity )
                 .padding(.top,20.0)
             HStack{
                 
                 TextField(
                    "Enter your Email...",
                    text: $loginData.email
                 ).padding()
                     .background()
                     .cornerRadius(30)
                     .padding(.top,20)
             }
             HStack{
                 
                 SecureField(
                    "Enter your Password...",
                    text: $loginData.password
                 ).padding()
                     .background()
                     .cornerRadius(30)
                     .padding(.top,20)
                 
                 
             }
             HStack
             {
                 
                 NavigationLink(destination: ForgetPage())
                 {
                     Text("Forgot password?")
                         .font( .custom(Fonts.Font2, size: 14))
                         .foregroundColor(Color(Colors.ColorSecondary))
                     
                 }.padding(.top,8)
                     .frame(maxWidth: .infinity,alignment: .leading)
                 NavigationLink(destination: RegisterPage())
                 {
                     Text("Create an account")
                         .font( .custom(Fonts.Font2, size: 14))
                         .foregroundColor(Color(Colors.ColorSecondary))
                     
                 }.padding(.top,8)
                     .frame(maxWidth: .infinity,alignment: .trailing)
             }
             Button(
                action: {
                    loginData.login() { result in
                        switch result {
                        case .success(_):
                            showingDrawerView = true
                        case .failure(let error):
                            print("Error: \(error)")
                        }
                    }
                },label:
                 {
                     Text("Login")
                         .font(.custom(Fonts.Font1, size: 20))
                         .frame(maxWidth: .infinity)
                         .padding(.vertical, 18)
                         .foregroundColor(.white)
                         .background(Color(Colors.ColorPrimary))
                         .cornerRadius(20)
                         .padding()
                 } )
             
         }
         .fullScreenCover(isPresented: $showingDrawerView, content: {
                     DrawerView()
                 })

         .padding(20)
         
         
     }
     .frame(maxWidth: .infinity,maxHeight: .infinity)
     .background(Color(Colors.ColorLightGrey))
     .cornerRadius(30)
       
 }.frame(maxWidth: .infinity ,maxHeight: .infinity)
            .background(Color(Colors.ColorSecondary))
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
