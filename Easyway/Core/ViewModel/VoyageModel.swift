//
//  VoyageModel.swift
//  Easyway
//
//  Created by Rayen Majdoub on 28/3/2023.
//

import SwiftUI

class VoyageModel: ObservableObject {

    @Published var vehicleType: VehicleType = VehicleType.ALL
    @Published var voyagesloaded = false
    
   
    func GetVoyages()
    {
        
    }

    
}
