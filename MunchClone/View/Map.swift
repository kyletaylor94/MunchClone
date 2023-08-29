//
//  Map.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import SwiftUI
import MapKit
import Kingfisher
import _CoreLocationUI_SwiftUI
import CoreLocation

struct MapView: View {
    @State private var isTapped: Bool = false
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.6339, longitude: 19.1076), latitudinalMeters: 10000.0, longitudinalMeters: 10000.0)
    
    @ObservedObject var viewModel = UserLocation()
    
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: munchExample){ loc in
                MapAnnotation(coordinate: loc.location) {
                    
                    CustomMappin()
                        .onTapGesture {
                            isTapped.toggle()
                        }
                        .sheet(isPresented: $isTapped, content: {
                            MapNavigationView()
                                .presentationDetents([.height(120), .medium, .large])
                                .presentationDragIndicator(.automatic)
                        })
                }
            }
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        viewModel.requestLocation()
                        viewModel.userLocation.unsafelyUnwrapped
                    }, label: {
                        Image(systemName: "location.fill")
                            .foregroundColor(.white)
                    })
                    .padding()
                    .background(
                        Color.green
                    )
                    //.frame(height: 44)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.leading)
                    .padding()
                    
                }
                
                Spacer()
            }
        }
        .onAppear{
            viewModel.requestLocation()
        }
    }
}

#Preview {
    MapView()
}

