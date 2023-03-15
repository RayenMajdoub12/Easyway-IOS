//
//  RegisterPage.swift
//  Easyway
//
//  Created by Rayen Majdoub on 15/3/2023.
//

import SwiftUI

struct RegisterPage: View {
    @StateObject var registerData: RegisterModel = RegisterModel()

    var body: some View {
        VStack{
                   VStack{
                       Text("Create \nAccount")
                           .font(.custom(Fonts.Font1, size: 45))
                           .fontWeight(.bold)
                           .foregroundColor(.white)
                           .frame(maxWidth: .infinity , alignment: .leading)
                           .frame(height: 180)
                           .padding(30)
                           
                   }
            
            ScrollView(.vertical,showsIndicators: false)
            {
                VStack(spacing: 15)
                {
                    Text("Register")
                        .font(.custom(Fonts.Font1, size: 22))
                        .frame(maxWidth:  .infinity )
                        .padding(.top,20.0)
                    HStack{
              
                      TextField(
                        "Enter your Email...",
                        text: $registerData.email
                      ).padding()
                            .background()
                            .cornerRadius(30)
                            .padding(.top,20)
                    }
                    HStack{
              
                      SecureField(
                        "Enter your Password...",
                        text: $registerData.password
                      ).padding()
                            .background()
                            .cornerRadius(30)
                            .padding(.top,20)
                       
                        
                    }
                    HStack{
              
                      SecureField(
                        "Verify your Password...",
                        text: $registerData.password
                      ).padding()
                            .background()
                            .cornerRadius(30)
                            .padding(.top,20)
                       
                        
                    }
                 
                    Button{
                        registerData.Register()
                    }label:{
                        Text("Register")
                            .font(.custom(Fonts.Font1, size: 20))
                            .frame(maxWidth:  .infinity )
                            .padding(.vertical,18)
                            .foregroundColor(.white)
                            .background(Color(Colors.ColorPrimary))
                            .cornerRadius(20)
                            .padding()
                    }
                }
                .padding(20)
                
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color(Colors.ColorLightGrey))
            .cornerRadius(30)
              
        }.frame(maxWidth: .infinity ,maxHeight: .infinity)
                   .background(Color(Colors.ColorSecondary))
           }
    }


struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}
