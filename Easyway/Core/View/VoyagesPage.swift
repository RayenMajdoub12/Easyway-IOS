//
//  VoyagesPage.swift
//  Easyway
//
//  Created by Rayen Majdoub on 28/3/2023.
//

import SwiftUI

struct VoyagesPage: View {
    @StateObject var voyageData: VoyageModel = VoyageModel()

    var body: some View {
        Button(
            action: {
                voyageData.GetVoyages() { result in
                    print(result)
                    print(voyageData)
                    switch result {
                    case .success(_):
                      print("done success voys")
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }
            },label:{
            Text("getVoyages")
                .font(.custom(Fonts.Font1, size: 20))
                .frame(maxWidth:  .infinity )
                .padding(.vertical,18)
                .foregroundColor(.white)
                .background(Color(Colors.ColorPrimary))
                .cornerRadius(20)
                .padding()
        }
    )}
    }


struct VoyagesPage_Previews: PreviewProvider {
    static var previews: some View {
        VoyagesPage()
    }
}
