//
//  MapNavigationView.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 08/08/2023.
//

import SwiftUI
import Kingfisher
import CoreLocation

struct MapNavigationView: View {
    var munch: MunchModel = munchExample[3]
    @State private var isTapped: Bool = false
    @ObservedObject var viewModel = AppleMapNavigationViewModel()
    @ObservedObject var userLocation = LocationManagerService()
    
    
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
                    
                    Text("\(viewModel.distanceInString) Km")
                        
                }
                HStack{
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 4)
                    
                    Text("Travel time: \n\(viewModel.travelTime)")
                }
            }
            
            Spacer()
            
            Button(action: {
                isTapped.toggle()
                
            }, label: {
                Image(systemName: "arrow.up.right.square.fill")
                    .foregroundColor(.green)
                    .font(.system(size: 50))
                
            })
            .sheet(isPresented: $isTapped, content: {
                MapChoiceView(munch: munch)
            })
            
        }
        .padding()
        .onAppear{
            guard let userLocation = userLocation.userLocation else { return }
            viewModel.calculateDistance(from: userLocation, to: munch.location)
            
        }
        
        
    }
}

#Preview {
    MapNavigationView()
}



