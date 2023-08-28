//
//  CartViewComponentCell.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 28/08/2023.
//

import SwiftUI
import Kingfisher

struct CartViewComponentCell: View {
    @State private var amount: Int = 1
    @EnvironmentObject var viewModel: CartViewModel
    
    let munch: MunchModel
    
    var body: some View {
        VStack{
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
        
    }
}

#Preview {
    CartViewComponentCell(munch: munchExample[0]).environmentObject(CartViewModel())
}
