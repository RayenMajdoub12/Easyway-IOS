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
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            Map(coordinateRegion: $region)
                .ignoresSafeArea(.all,edges: .all)
            GeometryReader{
                reader in
                VStack{
                   
                    BottomSheet()
                        .offset(y:reader.frame(in: .global).height-120)
                        .offset(y:offset)
                        .gesture(DragGesture().onChanged({
                            (value) in
                            withAnimation{
                                if value.startLocation.y > reader.frame(in: .global).midX{
                                    offset = value.translation.height
                                }
                                if value.startLocation.y < reader.frame(in: .global).midX{
                                    offset = (-reader.frame(in: .global).height+120) + value.translation.height
                                }
                            }
                        }).onEnded({(value) in
                            withAnimation{
                                if value.startLocation.y > reader.frame(in: .global).midX{
                                    if -value.translation.height > reader.frame(in: .global).midX
                                    {
                                        offset = (-reader.frame(in: .global).height +  120)
                                        return
                                    }
                                    offset = 0
                                }
                                if value.startLocation.y < reader.frame(in: .global).midX{
                                    if value.translation.height < reader.frame(in: .global).midX
                                    {
                                        offset = (-reader.frame(in: .global).height +  120)
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

struct BottomSheet: View {
    @State var text = ""
    var body: some View {
        VStack{
            Capsule( )
                .fill(Color(Colors.ColorSecondary).opacity(0.5))
                .frame(width: 50, height: 5)
                .padding(.top)
                .padding(.bottom,5)
               
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
            ScrollView(.vertical,showsIndicators: false,content: {
                LazyVStack(alignment: .leading, spacing: 15,content: {
                    ForEach(1...10, id:\.self){
                        count in
                        Text("Searched Place")
                        
                    }
                })
            }
            
            ).padding()
            
        }.background(BlurView(style: .systemMaterial))
            .cornerRadius(15)
            
        
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
