//
//  BookingPage.swift
//  Easyway
//
//  Created by Rayen Majdoub on 17/4/2023.
//

import SwiftUI

struct BookingPage: View {
    var gridformation :SeatFormation
    let seats :[Bool]
    let totalcolumns :Int
    @Environment(\.dismiss) var dismiss

    init(gridformation: SeatFormation) {
        self.gridformation = gridformation
        self.seats =   createMatriceViewItemTypes(seatFormation: gridformation)
        self.totalcolumns = gridformation.emptyRows.count+gridformation.fullRows
        print(self.totalcolumns)
        
    }
    var body: some View {
        VStack{
            HStack{
                Button(action:{
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(Colors.ColorSecondary)).frame(width: 30,height: 30,alignment: .leading)
                 
                }).padding(.leading,30)
                
                    
                
                Text ("Select Seats")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Spacer()
            }
       
            //Curv
                let columns = Array (repeating: GridItem(.fixed(35) , spacing: 10), count: totalcolumns)
            ScrollView(.vertical,showsIndicators: false){
                LazyVGrid(columns: columns, spacing: 13, content: {
                    ForEach(seats.indices,id: \.self) {index in
                    
                        SeatView(index:index,opacity: seats[index])
                   
                            
                    }
                }).padding()
                
            }
                .frame(height: 400)
                .background(.white)
                .cornerRadius(30)
                .padding()
        
       
            HStack
            {        Spacer()
                SeatView(index:10,opacity: true)
                    .padding(10)
                Text("Available")
                    .font(.custom("Futura-Medium", size: 10, relativeTo: .headline))
                Spacer()

                SeatView(index:10,opacity: true).padding(10)
                Text("Selected")
                    .font(.custom("Futura-Medium", size: 10, relativeTo: .headline))
                Spacer()
                SeatView(index:10,opacity: true)
                    .padding(10)
                Text("Booked")
                    .font(.custom("Futura-Medium", size: 10, relativeTo: .headline))
                Spacer()
            }
           Divider()
            HStack{
                Text("Total Price:")
                    .font(.custom("Futura-Medium", size: 12, relativeTo: .headline)).padding(10)
                Text("250 TND")
                    .font(.custom("Futura-Medium", size: 12, relativeTo: .headline)).padding(10)
                Text("Number of seats:")
                    .font(.custom("Futura-Medium", size: 12, relativeTo: .headline)).padding(10)
                Text("5")
                    .font(.custom("Futura-Medium", size: 12, relativeTo: .headline)).padding(10)
            }
            Spacer()
        }.background(.white)
        }
}



struct SeatView: View {
    var index: Int
    var opacity : Bool
    var body: some View{
        ZStack{
            RoundedRectangle (cornerRadius: 10)
                .stroke(Color (Colors.ColorSecondary), lineWidth: 2)
                .frame (height: opacity == true ? 35 : 10)
                .opacity(opacity == true ? 1 : 0	)
            Text(String(index))
                .opacity(opacity == true ? 1 : 0    )
                .foregroundColor(Color.secondary)
                .font(.custom(Fonts.Font1, size: 12))
        }
        
    }}

func createMatriceViewItemTypes(seatFormation: SeatFormation) -> [Bool] {
    // ALL COLLUMS AND ALL ROWS
    let cols = seatFormation.fullRows + seatFormation.emptyRows.count
    let rows = seatFormation.fullLines + seatFormation.emptyLines.count
    // CREATION D UNE MATRICE SELON LES BESOIN
    var matriceViewType = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
    for i in 0..<rows {
        var bools = [Bool]()
        for j in 0..<cols {
            let result = seatFormation.emptyLines.contains(i)
            let result1 = seatFormation.emptyRows.contains(j)
            if result || result1 {
                bools.append(false)
            } else {
                bools.append(true)
            }
        }
        matriceViewType[i] = bools
    }
    matriceViewType.removeFirst()
    let lastResult = matriceViewType.flatMap { $0 }
    print(lastResult.count)
    print(lastResult)
    return lastResult
    
}

struct BookingPage_Previews: PreviewProvider {
    static var previews: some View {
        let grid = SeatFormation()
        BookingPage(gridformation: grid )
    }
}
