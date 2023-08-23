//
//  BestMunchCardCell.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 06/07/2023.
//

import SwiftUI
import Kingfisher

struct BestMunchCardCell: View {
    
    var munch: MunchModel = munchExample[3]
    
    var body: some View {
        VStack(alignment: .leading){
            KFImage(URL(string: munch.image))
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 190)
                .cornerRadius(12)

            HStack{
                Text(munch.placeName)
                    .bold()
                    .font(.title2)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                
                Text("\(munch.rate, specifier: "%.1f")")
                    .foregroundStyle(.red)
                    .font(.title3)
            }
            .padding(.leading)
        
            
            HStack{
                Text("\(munch.newPrice) Ft")
                    .foregroundStyle(.green)
                    .fontWeight(.heavy)
                    .font(.title2)
                
                Text("\(munch.originalPrice) Ft")
                    .foregroundStyle(.gray)
                    .strikethrough()
                    .font(.title2)
            }
            .padding(.leading)
        }
        .frame(width: 205, height: 285)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray)
                .shadow(color: .black,radius: 5, x: 4, y: 4)
               
        )
    }
}

#Preview {
    BestMunchCardCell()
}



