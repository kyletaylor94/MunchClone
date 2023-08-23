//
//  CartViewComponent.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 10/07/2023.
//

import SwiftUI
import Kingfisher

struct CartViewComponent: View {
    
    @State private var amount = 1
    @EnvironmentObject var viewModel: CartViewModel
    var munch: [MunchModel]
    @State private var isTapped: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ForEach(munch){ munch in
                    HStack{
                        KFImage(URL(string: munch.image))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 130, height: 130)
                            .cornerRadius(12)
                        VStack(alignment: .leading, spacing: 20){
                            Text("\(munch.placeName) Munch")
                                .font(.title)
                            HStack(spacing: 10){
                                Text("\(munch.newPrice) Ft")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Text("\(amount)")
                                    .font(.title3)
                                    .padding(.leading, 40)
                                Stepper("db", value: $amount, in: 1...20)
                            }
                        }
                    }
                
                
                    VStack(spacing: 20){
                        HStack{
                            Text("Részösszeg:")
                                .bold()
                                .font(.title2)
                            Spacer()
                            
                            Text("\(munch.newPrice * amount) Ft")
                                .foregroundStyle(.gray)
                                .font(.title2)
                        }
                        
                        HStack{
                            Text("Adó:")
                                .bold()
                                .font(.title2)
                            Spacer()
                            
                            Text("\(viewModel.feesCalculate(price: munch, amount: amount)) Ft")
                                .foregroundStyle(.gray)
                                .font(.title2)
                            
                        }
                        
                        Spacer()
                        
                        
                    }
                    
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
                        
                        Text("990 Ft")
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
