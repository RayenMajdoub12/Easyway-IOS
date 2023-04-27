//
//  PaymentModel.swift
//  Easyway
//
//  Created by Rayen Majdoub on 27/4/2023.
//

import Foundation
import StripePaymentSheet
import SwiftUI


class MyBackendModel: ObservableObject {
  @Published var paymentSheet: PaymentSheet?
  @Published var paymentResult: PaymentSheetResult?

  func preparePaymentSheet( amount :Int) {
      
      let backendCheckoutUrl = URL(string:"\(Shared.sharedBaseUrl)/payement/payment-sheet/\(amount)")!
    var request = URLRequest(url: backendCheckoutUrl)
    request.httpMethod = "POST"
    let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
      guard let data = data,
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any],
            let customerId = json["customer"] as? String,
            let customerEphemeralKeySecret = json["ephemeralKey"] as? String,
            let paymentIntentClientSecret = json["paymentIntent"] as? String,
            let publishableKey = json["publishableKey"] as? String,

            let self = self else {
        // Handle error
          print("im in error  \(error) ")
        return
      }
        
print ("im in error  data \(data) ")
        print("im in error  respose \(response) ")
      STPAPIClient.shared.publishableKey = publishableKey
      var configuration = PaymentSheet.Configuration()
      configuration.merchantDisplayName = "Tickets"
      configuration.customer = .init(id: customerId, ephemeralKeySecret: customerEphemeralKeySecret)
      configuration.allowsDelayedPaymentMethods = true
      DispatchQueue.main.async {
        self.paymentSheet = PaymentSheet(paymentIntentClientSecret: paymentIntentClientSecret, configuration: configuration)
      }
    })
    task.resume()
  }

  func onPaymentCompletion(result: PaymentSheetResult) {
    self.paymentResult = result
  }
}

