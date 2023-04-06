//
//  Drawer.swift
//  Easyway
//
//  Created by Rayen Majdoub on 16/3/2023.
//

import SwiftUI
import SwiftDrawer
struct DrawerView: View {
    var body: some View {
        
        Color(Colors.ColorLightGrey)
                 .edgesIgnoringSafeArea(.all)
                 // Add the drawer menu as an overlay
                 .overlay(
                     Drawer()
                         .setSlider(view: SliderView(type: .leftRear))
                         .setMain(view: ProfilePage())
                 )

        
        
        
        
    }

}
struct SliderView : View, SliderProtocol {
    @EnvironmentObject public var drawerControl: DrawerControl

    let type: SliderType
    init(type: SliderType) {
        self.type = type 
    }
    var body: some View {
        VStack {
          Image("profilepic")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .padding(.top,40)
                .padding(.bottom,10)
          Text("Rayen.M")
                .font(.custom(Fonts.Font1, size: 22))
                .frame(maxWidth: .infinity ,alignment: .center)
                .foregroundColor(Color(Colors.ColorSecondary))
          
     
            VStack {
                SliderCell(imgName: "person.circle.fill", title: "Profile").onTapGesture {
                   self.drawerControl.setMain(view: ProfilePage())
                    self.drawerControl.show(type: .leftRear, isShow: true)
                }
                .onAppear {
                    
                }
                Divider()
                
                SliderCell(imgName: "gear", title: "Account").onTapGesture {
                    // self.drawerControl.setMain(view: LoginPage())
                    self.drawerControl.show(type: .leftRear, isShow: false)
                }
            }.padding(10)
            .background(.white)
            .cornerRadius(20)
        }
        .zIndex(2)
        .ignoresSafeArea()
        .background(Color(Colors.ColorLightGrey))
        
        
    }
}

struct SliderCell : View {
    private let img: String
    private let title: String
    var body: some View {
            HStack {
                Image(systemName: self.img)
                    .foregroundColor(Color(Colors.ColorSecondary)).frame(width: 35,height: 35,alignment: .leading)
                Text(self.title).foregroundColor(Color(Colors.ColorSecondary)).multilineTextAlignment( .leading)
               Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(Colors.ColorSecondary)).frame(width: 35,height: 35,alignment: .trailing)
                    .padding(.trailing)
            }.padding(3)
        
    }
    
    init(imgName: String, title: String) {
        self.img = imgName
        self.title = title
    }
}


struct DrawerView_Previews: PreviewProvider {
    static var previews: some View {
        DrawerView()
    }
}
