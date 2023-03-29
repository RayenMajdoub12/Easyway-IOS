//
//  SeatFormationController.swift
//  Easyway
//
//  Created by Rayen Majdoub on 28/3/2023.
//

import Foundation
import Alamofire

class SeatFormationController {
    static let shared = SeatFormationController()
    
    private let baseUrl = "\(Shared.sharedBaseUrl)/seatformation" // Replace with your server URL
    
    private init() {}
}
