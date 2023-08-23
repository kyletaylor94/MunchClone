//
//  MyFavouriteView.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 16/08/2023.
//

import SwiftUI

struct MyFavouriteView: View {
    @Environment(\.presentationMode) var present
    @EnvironmentObject var viewModel: CartViewModel
    
    var body: some View {
        if viewModel.favouriteMunches.isEmpty{
            EmptyFavouriteView()
        } else {
            ScrollView{
                ForEach(viewModel.favouriteMunches){ favmunch in
                    FavouriteMunchCell(munch: favmunch)
                }
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "cart.fill")
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            Circle()
                                .frame(width: 40)
                                .foregroundColor(.green)
                        )
                    }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        present.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.gray)
                    })
                }
            }
            .navigationTitle("Kedvencek")
            .navigationBarTitleDisplayMode(.inline)
            
           
        }
    }
}

#Preview {
    NavigationView{
        MyFavouriteView().environmentObject(CartViewModel())
    }
}

