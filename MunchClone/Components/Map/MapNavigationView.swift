//
//  MapNavigationView.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 08/08/2023.
//

import SwiftUI
import Kingfisher

struct MapNavigationView: View {
    var munch: MunchModel = munchExample[3]
    
    var body: some View {
        HStack{
            VStack{
                KFImage(URL(string: munch.image))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 95)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading){
                Text(munch.placeName)
                    .font(.title2)
                
                HStack{
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 4)
                    Text("0.2km")
                }
            }
            
            Spacer()
            
            Button(action: {
                //navigate to location
                //deep into the waze or google maps
            }, label: {
                Image(systemName: "arrow.up.right.square.fill")
                    .foregroundColor(.green)
                    .font(.system(size: 50))
            })
        }
        .padding()
    }
}

#Preview {
    MapNavigationView()
}



