//
//  CartViewModel.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 10/07/2023.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject{
    @Published var items: [MunchModel] = []
    @Published var favouriteMunches: [MunchModel] = []
    @Published private(set) var total: Int = 0
    
    
    let applepaymentHandler = ApplePayViewModel()
    @Published var paymentSuccess = false
    
    func addToFavourite(selectedItem: MunchModel){
        DispatchQueue.main.async {
            self.favouriteMunches.append(selectedItem)
            print(self.favouriteMunches)
        }
 
    }
    
    
    func addToCart(selectedItem: MunchModel){
        DispatchQueue.main.async {
            self.items.append(selectedItem)
            self.total += selectedItem.newPrice
        }
    }
    
    func removeFromCart(selectedItem: MunchModel){
        //
    }
    
    func removeFromFavourite(selectedItem: MunchModel){
      //
    }
    
    func feesCalculate(price: MunchModel, amount: Int) -> Int{
         let price = price.newPrice * amount
         let fee = (27 * price) / 100
         
         return fee
    }
    
    func pay(){
        applepaymentHandler.startPayment(products: items, total: total) { success in
            self.paymentSuccess = success
            self.items = []
            self.total = 0
        }
    }
    
    
}
