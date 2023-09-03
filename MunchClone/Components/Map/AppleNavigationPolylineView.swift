//
//  AppleNavigationPolylineView.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 03/09/2023.
//

import SwiftUI
import MapKit



struct AppleNavigationPolylineView: View {
    @ObservedObject var navigationViewModel = AppleMapNavigationViewModel()
    @ObservedObject var userLocation = UserLocation()
    let munch: MunchModel = munchExample[0]
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.6339, longitude: 19.1076), latitudinalMeters: 10000.0, longitudinalMeters: 10000.0)
    
    
    var body: some View{
        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: munchExample){ loc in
            
            MapAnnotation(coordinate: loc.location) {
                CustomMappin()
            }
        }
        
    }
}

#Preview{
    AppleNavigationPolylineView()
}


