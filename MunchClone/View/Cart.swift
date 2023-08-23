//
//  Chart.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import SwiftUI

struct Cart: View {
    @EnvironmentObject var viewModel: CartViewModel
    
    var body: some View {
        if viewModel.items.isEmpty{
           EmptyCartComponent()
                .task {
                    print(viewModel.items)
                }
        } else {
            CartViewComponent(munch: viewModel.items)
        }
    }
}

#Preview {
    Cart().environmentObject(CartViewModel())
}
