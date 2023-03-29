//
//  ReservationController.swift
//  Easyway
//
//  Created by Rayen Majdoub on 28/3/2023.
//

import Foundation
import Alamofire
class ReservationController {
    static let shared = ReservationController()
    
    private let baseUrl = "\(Shared.sharedBaseUrl)/reservation" // Replace with your server URL
    
    private init() {}
}
