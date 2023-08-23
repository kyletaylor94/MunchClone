//
//  HomeViewComponentCell.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import SwiftUI
import Kingfisher

struct HomeViewComponentCell: View {
    var munch: MunchModel
    
    var body: some View {
        VStack{
            HStack{
                KFImage(URL(string: munch.image))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 130)
                    .cornerRadius(20)
                    .shadow(radius: 4)
                
                VStack(alignment: .leading,spacing: 5){
                    Text(munch.placeName)
                        .bold()
                        .font(.title3)
                    
                    Text("\(munch.dateFrom) - \(munch.dateTo) átvehető")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    
                    HStack{
                        Text("\(munch.newPrice) Ft ")
                            .bold()
                            .foregroundStyle(.green)
                        
                        Text("\(munch.originalPrice) Ft")
                            .foregroundStyle(.gray)
                            .strikethrough()
                        
                        Spacer()
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(munch.rate, specifier: "%.1f")")
                            .foregroundStyle(.orange)
                        
                        Spacer()
                    }
                }
                Spacer()
            }
            .padding()
            Divider()
        }
    }
}

#Preview {
    HomeViewComponentCell(munch: munchExample[3])
}
