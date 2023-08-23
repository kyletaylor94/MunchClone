//
//  Map.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import SwiftUI
import MapKit
import Kingfisher

struct MapView: View {
    @State private var isTapped: Bool = false
    
    @State private var region: MKCoordinateRegion =  MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.6339, longitude: 19.1076), latitudinalMeters: 10000.0, longitudinalMeters: 10000.0)
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: munchExample){ loc in
            MapAnnotation(coordinate: loc.location ) {
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
    }
}

#Preview {
    MapView()
}

