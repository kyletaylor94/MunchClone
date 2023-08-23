//
//  ApplePayButton.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 20/08/2023.
//

import PassKit
import SwiftUI

struct ApplePayButton: UIViewRepresentable{
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> some UIView {
        return PKPaymentButton(paymentButtonType: .plain, paymentButtonStyle: .black)
    }
}

struct ApplePayButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        return ApplePayButton()
    }
}
