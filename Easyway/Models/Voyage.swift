//
//  Voyage.swift
//  Easyway
//
//  Created by Rayen Majdoub on 28/3/2023.
//

import Foundation

struct Voyage:  Codable {
    let id :String
    let vehicle: Vehicle
    let departurePoint: String
    let arrivalPoint: String
    let departureDate: Date
    let arrivalDate: String
    let distance: Double
    let firstClassSeatPrice: Double
    let economySeatPrice: Double
    let businessSeatPrice: Double
    let available: [Bool]
    
    enum CodingKeys: String, CodingKey {
        case id
        case vehicle
        case departurePoint = "DeparturePoint"
        case arrivalPoint = "ArrivalPoint"
        case departureDate = "DepartureDate"
        case arrivalDate = "ArrivalDate"
        case distance = "Distance"
        case firstClassSeatPrice = "firstclassseatprice"
        case economySeatPrice = "economyseatprice"
        case businessSeatPrice = "businessseatprice"
        case available
    }
    

    init(id: String, vehicle: Vehicle, departurePoint: String, arrivalPoint: String, departureDate: Date, arrivalDate: String, distance: Double, firstClassSeatPrice: Double, economySeatPrice: Double, businessSeatPrice: Double, available: [Bool]) {
           self.id = id
           self.vehicle = vehicle
           self.departurePoint = departurePoint
           self.arrivalPoint = arrivalPoint
           self.departureDate = departureDate
           self.arrivalDate = arrivalDate
           self.distance = distance
           self.firstClassSeatPrice = firstClassSeatPrice
           self.economySeatPrice = economySeatPrice
           self.businessSeatPrice = businessSeatPrice
           self.available = available
       }

}
