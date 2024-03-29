//
//  WazeNavigationViewModel.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 03/09/2023.
//

import Foundation
import MapKit

class WazeNavigationViewModel: ObservableObject{
    
    func openWazeWithCoordinates(location: CLLocationCoordinate2D) {
           
           if UIApplication.shared.canOpenURL(URL(string: "waze://")!) {
               let destination = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
               let latitude = destination.latitude
               let longitude = destination.longitude
               let wazeURL = URL(string: "waze://?ll=\(latitude),\(longitude)&navigate=yes")!
               
               UIApplication.shared.open(wazeURL, options: [:], completionHandler: nil)
           } else {
               print("A Waze alkalmazás nincs telepítve.")
           }
       }

}
