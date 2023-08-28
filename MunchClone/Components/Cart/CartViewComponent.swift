//
//  CartViewComponent.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 10/07/2023.
//

import SwiftUI
import Kingfisher

struct CartViewComponent: View {
    
    @State private var amount: Int = 1
    @EnvironmentObject var viewModel: CartViewModel
    var munch: [MunchModel]
    @State private var isTapped: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ForEach(munch){ munch in
                    CartViewComponentCell(munch: munch)
                
                  
                }
                .padding(.horizontal)
                .padding(.vertical)
                
            }
            .padding(.horizontal)
            .padding(.vertical)
            .padding()
            .navigationTitle("Kosár")
            
            ZStack{
                VStack(alignment: .center){
                    HStack{
                        Text("Összesen:")
                            .bold()
                            .font(.title)
                        Spacer()
                        
                        Text("\(viewModel.total * amount) Ft")
                            .bold()
                            .font(.title2)
                    }
                    .padding(.horizontal, 20)
                    
                    Button {
                        isTapped = true
                    } label: {
                        Text("Pénztár")
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .frame(width: 350, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.orange)
                    )
                    .fullScreenCover(isPresented: $isTapped) {
                        PayView()
                    }
                    
                    
                }
                .padding()
                
            }
            .padding()
        }
        .padding(.trailing, 20)
        
    }
}

#Preview {
    CartViewComponent(munch: munchExample).environmentObject(CartViewModel())
}


/*
 DEBUG: Picker amount doesnt work correctly
 when user add plus 1 for food it does add on the all of them what inside the cart
 */
