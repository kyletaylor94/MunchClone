//
//  MapChoiceView.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 31/08/2023.
//

import SwiftUI

struct MapChoiceView: View {
    @ObservedObject var appleNavigationViewModel = AppleMapNavigationViewModel()
    @ObservedObject var wazeNavigationViewModel = WazeNavigationViewModel()
    @Environment(\.presentationMode) var present
    @ObservedObject var userLocaton = LocationManagerService()
    let munch: MunchModel
    
    
    var body: some View {
        NavigationView{
            //
            
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.bar)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20){
                    Text("Válaszd ki a navigációt")
                        .font(.title)
                    
                    NavigationLink {
                        mapView(munch: munch)
                    } label: {
                        VStack{
                            Image(systemName: "apple.logo")
                                .imageScale(.large)
                            Text("Apple navigation")
                        }
                        .foregroundColor(.black)
                    }
                    .padding()
                    .frame(width: 200)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.bar)
                            .shadow(radius: 10)
                    )
                    
                    
                    //                Button(action: {
                    //                  //
                    //                }, label: {
                    //                    VStack{
                    //                        Image(systemName: "apple.logo")
                    //                            .imageScale(.large)
                    //                        Text("Apple navigation")
                    //                    }
                    //                    .foregroundColor(.black)
                    //                })
                    //                .padding()
                    //                .frame(width: 200)
                    //                .background(
                    //                    RoundedRectangle(cornerRadius: 12)
                    //                        .foregroundStyle(.bar)
                    //                        .shadow(radius: 10)
                    //                )
                    
                    Button(action: {
                        //
                    }, label: {
                        VStack{
                            Image(systemName: "apple.logo")
                                .imageScale(.large)
                            Text("Google Maps")
                        }
                        .foregroundColor(.black)
                    })
                    .padding()
                    .frame(width: 200)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.bar)
                            .shadow(radius: 10)
                    )
                    
                    Button(action: {
                        wazeNavigationViewModel.openWazeWithCoordinates(location: munch.location)
                    }, label: {
                        VStack{
                            Image(systemName: "apple.logo")
                                .imageScale(.large)
                            Text("Waze")
                        }
                        .foregroundColor(.black)
                    })
                    .padding()
                    .frame(width: 200)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.bar)
                            .shadow(radius: 10)
                    )
                    
                    
                    
                }
                
            }
            //
        }
        //
    }
}

#Preview {
    NavigationView{
        MapChoiceView(munch: munchExample[0])
    }
}
