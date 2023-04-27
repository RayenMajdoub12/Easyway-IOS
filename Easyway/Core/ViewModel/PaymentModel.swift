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

  func preparePaymentSheet( amount :Double) {
      
      let backendCheckoutUrl = URL(string:"\(Shared.sharedBaseUrl)/payment-sheet/\(amount)")!
    // MARK: Fetch the PaymentIntent and Customer information from the backend
    var request = URLRequest(url: backendCheckoutUrl)
    request.httpMethod = "POST"
    let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
      guard let data = data,
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any],
            let customerId = json["customer"] as? String,
            let customerEphemeralKeySecret = json["ephemeralKey"] as? String,
            let paymentIntentClientSecret = json["paymentIntent"] as? String,
            let self = self else {
        // Handle error
          print("im in error \(error) ")
        return
      }
print ("im in error \(data) ")
        print("im in error \(response) ")
      STPAPIClient.shared.publishableKey = "pk_test_51N1JhpF3oMm4gZ9s80g0o6utbKtZuN7hEa5oF8x72c7LxeJM8B3dMiqgMR1QT4huoUfazVFcsPlYUtZtnWTaRIVo004uC1BERl"
      // MARK: Create a PaymentSheet instance
      var configuration = PaymentSheet.Configuration()
      configuration.merchantDisplayName = "Tickets"
      configuration.customer = .init(id: customerId, ephemeralKeySecret: customerEphemeralKeySecret)
      // Set `allowsDelayedPaymentMethods` to true if your business can handle payment methods
      // that complete payment after a delay, like SEPA Debit and Sofort.
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

