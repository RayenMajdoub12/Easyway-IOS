//
//  VoyagesPage.swift
//  Easyway
//
//  Created by Rayen Majdoub on 28/3/2023.
//

import SwiftUI

struct VoyagesPage: View {
    @StateObject var voyageData: VoyageModel = VoyageModel()

    ScrollView {
                VStack(spacing: .zero) {
                    TicketDetailTopView(ticketInfo: ticketInfo)
                    ZStack {
                        LREdgeCutShapeView()
                            .fill(Color(UIColor.tertiarySystemBackground), style: FillStyle(eoFill: false, antialiased: false))
                            .frame(maxWidth: .infinity)
                            .frame(height: 24.0)
                        LineShape()
                            .stroke(Color(uiColor: .lightGray), style: StrokeStyle(lineWidth: 1.0, dash: [5]))
                            .frame(height: 1.0)
                            .padding(.horizontal, 20.0)
                    }
                    TicketDetailMainView(ticketInfo: ticketInfo)
                }
                .padding(.all, 20.0)
            }
            .background(Color(UIColor.systemGroupedBackground))
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Ticket Info")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowModal.toggle()
                    } label: {
                        VStack(spacing: .zero) {
                            Image(systemName: "qrcode")
                                .resizable()
                                .scaledToFit()
                            Text("PASS")
                                .font(.system(size: 10.0))
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.primary)
                    }
                }
            }
            .fullScreenCover(isPresented: $isShowModal) {
                BoardingPassView(ticketInfo: ticketInfo)
            }
        }

struct VoyagesPage_Previews: PreviewProvider {
    static var previews: some View {
        VoyagesPage()
    }
}
