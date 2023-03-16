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
         Drawer()
        .setSlider(view: SliderView(type: .leftRear))
        .setMain(view: HomePage())
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
        
            SliderCell(imgName: "pencil", title: "Home").onTapGesture {
              //  self.drawerControl.setMain(view: HomePage())
                self.drawerControl.show(type: .leftRear, isShow: false)
            }.onAppear {
                    
            }
            
            SliderCell(imgName: "gear", title: "Account").onTapGesture {
               // self.drawerControl.setMain(view: LoginPage())
                self.drawerControl.show(type: .leftRear, isShow: false)
            }
        }
        
        
    }
}

struct SliderCell : View {
    private let img: String
    private let title: String
    var body: some View {
            HStack {
                Image(systemName: self.img)
                    .foregroundColor(Color(Colors.ColorSecondary)).frame(width: 35,height: 35,alignment: .center)
                Text(self.title).foregroundColor(Color(Colors.ColorSecondary)).multilineTextAlignment( .leading)
                Spacer()
            }.padding()
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
