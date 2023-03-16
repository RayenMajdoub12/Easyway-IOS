//
//  ForgetPage.swift
//  Easyway
//
//  Created by Rayen Majdoub on 16/3/2023.
//

import SwiftUI

struct ForgetPage: View {
    @StateObject var forgetData: ForgetPasswordModel = ForgetPasswordModel()

    var body: some View {
        VStack{
                   VStack{
                       Text("Forget \nPassword")
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
                    Text("Send Code")
                        .font(.custom(Fonts.Font1, size: 22))
                        .frame(maxWidth:  .infinity )
                        .padding(.top,20.0)
                    HStack{
              
                      TextField(
                        "Enter your Email...",
                        text: $forgetData.email
                      ).padding()
                            .background()
                            .cornerRadius(30)
                            .padding(.top,20)
                    }
                   
                    NavigationLink(destination:CodeVerifPage())
                    {
                        Text("Send")
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


struct ForgetPage_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPage()
    }
}
