//
//  ApplePayViewModel.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 19/08/2023.
//

import Foundation
import PassKit

typealias PaymentCompletionHandler = (Bool) -> Void

class ApplePayViewModel: NSObject {
    
    var paymentController: PKPaymentAuthorizationController?
    var paymentSummaryItems = [PKPaymentSummaryItem]()
    var paymentStatus = PKPaymentAuthorizationStatus.failure
    var completionHandler: PaymentCompletionHandler?
      
      static let supportedNetworks: [PKPaymentNetwork] = [
          .visa,
          .masterCard,
      ]
    
    class func applePayStatus() ->(canMakePayments: Bool, canSetupCards: Bool){
        return (PKPaymentAuthorizationController.canMakePayments(), PKPaymentAuthorizationController.canMakePayments(usingNetworks: supportedNetworks)
        )
    }
    
    func startPayment(products: [MunchModel], total: Int, completion: @escaping PaymentCompletionHandler){
        completionHandler = completion
        paymentSummaryItems = []
        
        products.forEach { product in
            let item = PKPaymentSummaryItem(label: product.placeName, amount: NSDecimalNumber(string: "\(product.newPrice)"), type: .final)
                paymentSummaryItems.append(item)
            }
        
        let total = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(string: "\(total)"), type: .final)
        paymentSummaryItems.append(total)
        
        let paymentRequest = PKPaymentRequest()
        paymentRequest.paymentSummaryItems = paymentSummaryItems
        paymentRequest.merchantIdentifier = "merchant.io.designcode.sweatershopapp"
        paymentRequest.merchantCapabilities = .threeDSecure
        paymentRequest.countryCode = "HU"
        paymentRequest.currencyCode = "HUF"
        paymentRequest.supportedNetworks = ApplePayViewModel.supportedNetworks
        
        paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
        paymentController?.delegate = self
        paymentController?.present(completion: { (presented: Bool) in
            if presented{
                debugPrint("Presented payment controller")
            } else {
                debugPrint("Failed to present payment controller")
            }
        })
    }
}

extension ApplePayViewModel: PKPaymentAuthorizationControllerDelegate{
    
    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {

           let errors = [Error]()
           let status = PKPaymentAuthorizationStatus.success

           self.paymentStatus = status
           completion(PKPaymentAuthorizationResult(status: status, errors: errors))
       }
    
    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        controller.dismiss()
        
        DispatchQueue.main.async {
            if self.paymentStatus == .success{
                if let completionHandler = self.completionHandler{
                    completionHandler(true)
                }
            } else {
                if let completionHandler = self.completionHandler{
                    completionHandler(false)
                }
            }
        }
    }
}
