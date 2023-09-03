//
//  AppleMapNavigationViewModel.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 31/08/2023.
//

import Foundation
import MapKit

class AppleMapNavigationViewModel: ObservableObject{
    
    
    func appleNavigation(from startingPoint: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, completion: @escaping(MKRoute) -> Void){
       
        let userPlaceMark = MKPlacemark(coordinate: startingPoint)
        let destinationPlacemark = MKPlacemark(coordinate: destination)
        
        let request = MKDirections.Request()
        
        request.source = MKMapItem(placemark: userPlaceMark)
        request.destination = MKMapItem(placemark: destinationPlacemark)
        
        let direction = MKDirections(request: request)
        
        direction.calculate { response, error in
            if let error = error{
                print("DEBUG: ERROR IN ROUTE CALCULATING: ")
                print(String(describing: error))
                return
            }
            guard let route = response?.routes.first else { return }
            self.routeTimeFormatter(with: route.expectedTravelTime)
            completion(route)
        }
    }
    
    func routeTimeFormatter(with expectedTravelTime: Double){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
    }

    
}
