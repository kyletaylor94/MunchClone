//
//  FavouriteMunchCell.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 21/08/2023.
//

import SwiftUI
import Kingfisher

struct FavouriteMunchCell: View {
    var munch: MunchModel
    var body: some View {
        
        HStack{
            KFImage(URL(string: munch.image))
            .resizable()
            .scaledToFill()
            .frame(width: 130, height: 130)
            .cornerRadius(12)
            VStack(alignment: .leading, spacing: 20){
                HStack(spacing: 40){
                    Text("\(munch.placeName) Munch")
                        .font(.title2)
                        .lineLimit(2)
                    
                    Button(role: .destructive) {
                        //
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .imageScale(.large)
                    }
                    .padding(.bottom, 50)

                  
                }
                HStack(spacing: 10){
                    Text("\(munch.newPrice) Ft")
                        .font(.title3)
                        .fontWeight(.semibold)
                   
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(style: StrokeStyle())
        )
        .frame(width: 400, height: 200)
    }
}

#Preview {
    FavouriteMunchCell(munch: munchExample[2])
}
