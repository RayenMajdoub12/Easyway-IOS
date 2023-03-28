//
//  Reservation.swift
//  Easyway
//
//  Created by Rayen Majdoub on 28/3/2023.
//

import Foundation

struct Reservation: Codable {
    let id : String
    let user: User
    let seatNumbers: [Int]
    let voyage: Voyage
    let qr: String
    let totalPrice: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case user
        case seatNumbers = "Seatnumbers"
        case voyage
        case qr
        case totalPrice = "totaleprice"
    }
    

}
