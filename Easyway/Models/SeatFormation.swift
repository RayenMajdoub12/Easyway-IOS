//
//  SeatFormation.swift
//  Easyway
//
//  Created by Rayen Majdoub on 28/3/2023.
//

import Foundation

struct SeatFormation:Codable {
    let id: String
    let businessClassSeats: Int
    let firstClassSeats: Int
    let economyClassSeats: Int
    let fullRows: Int
    let fullLines: Int
    let emptyRows: [Int]
    let emptyLines: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case businessClassSeats = "BusinessClassSeats"
        case firstClassSeats = "FirstClassSeats"
        case economyClassSeats = "EconomyClassSeats"
        case fullRows = "fullrows"
        case fullLines = "FullLines"
        case emptyRows = "EmptyRows"
        case emptyLines = "EmptyLines"
    }
    

    init(id: String, businessClassSeats: Int, firstClassSeats: Int, economyClassSeats: Int, fullRows: Int, fullLines: Int, emptyRows: [Int], emptyLines: [Int]) {
         self.id = id
         self.businessClassSeats = businessClassSeats
         self.firstClassSeats = firstClassSeats
         self.economyClassSeats = economyClassSeats
         self.fullRows = fullRows
         self.fullLines = fullLines
         self.emptyRows = emptyRows
         self.emptyLines = emptyLines
     }

}
