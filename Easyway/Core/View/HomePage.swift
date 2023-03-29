//
//  HomePage.swift
//  Easyway
//
//  Created by Rayen Majdoub on 15/3/2023.
//

import SwiftUI
import MapKit
import SwiftDrawer

struct HomePage: View {
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 13.086, longitude:80.2789),
                                           latitudinalMeters: 10000,longitudinalMeters: 10000)
    @State var offset:CGFloat = 0
    var body: some View {
        NavigationView{
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
                Map(coordinateRegion: $region)
                    .ignoresSafeArea(.all,edges: .all)
                GeometryReader{
                    reader in
                    VStack{
                        
                        BottomSheet()
                            .offset(y:reader.frame(in: .global).height-110)
                            .offset(y:offset)
                            .gesture(DragGesture().onChanged({
                                (value) in
                                withAnimation{
                                    if value.startLocation.y > reader.frame(in: .global).midX{
                                        offset = value.translation.height
                                    }
                                    if value.startLocation.y < reader.frame(in: .global).midX{
                                        offset = (-reader.frame(in: .global).height+110) + value.translation.height
                                    }
                                }
                            }).onEnded({(value) in
                                withAnimation{
                                    if value.startLocation.y > reader.frame(in: .global).midX{
                                        if -value.translation.height > reader.frame(in: .global).midX
                                        {
                                            offset = (-reader.frame(in: .global).height +  110)
                                            return
                                        }
                                        offset = 0
                                    }
                                    if value.startLocation.y < reader.frame(in: .global).midX{
                                        if value.translation.height < reader.frame(in: .global).midX
                                        {
                                            offset = (-reader.frame(in: .global).height +  110)
                                            return
                                        }
                                        offset = 0
                                    }
                                }
                            })
                            )
                        
                    }
                }
                .ignoresSafeArea(.all,edges: .bottom)
            })
            
        }
    }
    struct DefaultView: View {
        @State var text = ""
        @Binding var selectsheet:Int
        var body: some View {
            
            HStack(spacing: 15)
            {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 22))
                    .foregroundColor(.gray)
                    .padding(.leading)
                TextField("Search Place",text: $text)
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(BlurView(style: .systemMaterial))
                    .cornerRadius(15)
                    .padding()
            }
            HStack{
                Button(
                    action: {
                        self.selectsheet = 1
                    })
                {
                    VStack{
                        LottieView (name: LottieNames.navigate_points, loopMode:
                                .loop)
                        .frame(width: 80,height: 80)
                        .scaleEffect(0.3)
                        .offset(x:-20)
                        
                        Text("Get me \nsomwhere")
                            .font(.custom(Fonts.Font1, size: 20))
                            .padding(.vertical, 18)
                            .foregroundColor(.white)
                            .multilineTextAlignment( .leading)
                            .offset(x:-25)
                        
                    }
                    .frame(width: 200, height: 200)
                    .background(Color(Colors.ColorPrimary).opacity(0.9))
                    .cornerRadius(20)
                    .padding(5)
                    
                    
                    
                    
                }
                Button(
                    action: {
                        print("hello")
                    })
                {
                    VStack{
                        LottieView (name: LottieNames.home, loopMode:
                                .loop)
                        .frame(width: 80,height: 80)
                        .scaleEffect(0.25)
                        .offset(x:-20)
                        
                        
                        Text("Home")
                            .font(.custom(Fonts.Font1, size: 20))
                            .padding(.vertical, 18)
                            .foregroundColor(.white)
                            .multilineTextAlignment( .leading)
                            .offset(x:-10)
                        
                    }
                    .frame(width: 150, height: 200)
                    .background(Color(Colors.Blue).opacity(0.9))
                    .cornerRadius(20)
                    .padding(5)
                }
            }
            
            
            ScrollView(.vertical,showsIndicators: false,content: {
                LazyVStack(alignment: .leading, spacing: 15,content: {
                    ForEach(1...10, id:\.self){
                        count in
                        Text("Searched Place")
                        
                    }
                })
            }
                       
            ).padding()
            
                
            
        }
    }
    
    struct GetMeSomewhere: View {
        @State private var from = ""
        @State private var to = ""
        @State private var showingVoyageView = false

        var body: some View {
            
            Text("Where to go Today ?")
                .font(.custom(Fonts.Font1, size: 42))
                .frame(maxWidth: .infinity , alignment: .leading)
                .frame(height: 220)
                .padding(20)
            HStack(spacing: 15)
            {
                Text("From")
                    .font(.system(size: 22))
                    .foregroundColor(.gray)
                    .padding(.leading)
                TextField("Search Place",text: $from)
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(BlurView(style: .systemMaterial))
                    .cornerRadius(15)
                    .padding()
            }
            HStack(spacing: 15)
            {
                
               
                Text("To")
                    .font(.system(size: 22))
                    .foregroundColor(.gray)
                    .padding(.leading)
                TextField("Search Place",text: $to)
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(BlurView(style: .systemMaterial))
                    .cornerRadius(15)
                    .padding()
            }
            Button(
                action: {
                    showingVoyageView = true
 
                })
            {
                    Text("Go Now")
                        .font(.custom(Fonts.Font1, size: 20))
                        .padding(.vertical, 18)
                        .foregroundColor(.white)
                        .multilineTextAlignment( .leading)
                   
                    
                }
                .frame(maxWidth:.infinity)
                .background(Color(Colors.AccentDarkPink).opacity(0.9))
                .cornerRadius(20)
                .padding(5)
                .frame(height: 100)
                .fullScreenCover(isPresented: $showingVoyageView, content: {
                            VoyagesPage()
                        })
            Spacer()
        }
        
    }
    
    struct BottomSheet: View {
        @State private var selectsheet = 0
        var body: some View {
            VStack{
                Capsule( )
                    .fill(Color(Colors.ColorSecondary).opacity(0.5))
                    .frame(width: 50, height: 5)
                    .padding(.top)
                    .padding(.bottom,5)
                
                switch selectsheet
                {
                case 0:
                    DefaultView(selectsheet: $selectsheet)
                case 1:
                    GetMeSomewhere()
                    
                default:
                    DefaultView(selectsheet: $selectsheet)
                }
                
                
            }
            .background(BlurView(style: .systemMaterial))
            .cornerRadius(15)
        }
        
    }
}
struct BlurView: UIViewRepresentable {
    let style :UIBlurEffect.Style
    func makeUIView(context:Context)->UIVisualEffectView
    {
        let view = UIVisualEffectView(effect:UIBlurEffect(style: style))
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
