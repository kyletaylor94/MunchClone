//
//  ProductCell.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 19/08/2023.
//

import SwiftUI
import Kingfisher

struct ProductCell: View {
    @EnvironmentObject var viewModel: CartViewModel
    var munch: MunchModel
    
    var body: some View {
        HStack(spacing: 20){
            KFImage(URL(string: munch.image))
                .resizable()
                .scaledToFit()
                .frame(width: 70)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10){
                Text(munch.placeName)
                    .bold()
                
                Text("\(munch.newPrice)Ft")
            }
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(.red)
                .onTapGesture {
                    viewModel.removeFromCart(selectedItem: munch)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ProductCell(munch: munchExample[2]).environmentObject(CartViewModel())
}
