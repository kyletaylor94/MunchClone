//
//  MapCell.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 13/07/2023.
//

import SwiftUI
import MapKit

struct MapCell: View {
    @State private var region: MKCoordinateRegion =  MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.12, longitude: 19.12), latitudinalMeters: 50.0, longitudinalMeters: 50.0)
    
    var munch: MunchModel = munchExample[0]
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: munchExample){_ in
            MapAnnotation(coordinate: munch.location ) {
                CustomMappin()
                
            }
        }
    }
}

#Preview {
    MapCell()
}
