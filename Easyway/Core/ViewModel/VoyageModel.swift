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
    @Published var type: String = VehicleType.ALL.stringValue
    @Published var departurePoint: String = "Ariana"
    @Published var arrivalPoint: String = "Tunis"
    @Published var errorMessage: String?

    
    func GetVoyages(completion: @escaping (Result<[Voyage], Error>) -> Void)
    {
        
        VoyageController.shared.getVoyages(type:type, departurePoint: departurePoint, arrivalPoint:arrivalPoint ){ [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let message):
                    print(message)
                    self?.voyagesloaded = true
                    completion(.success(message))
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    completion(.failure(error))
                }
            }
        }
        
        
    }
}
