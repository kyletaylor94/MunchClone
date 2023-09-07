//
//  AppleMapNavigationViewModel.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 31/08/2023.
//

import Foundation
import MapKit

class AppleMapNavigationViewModel: ObservableObject{
    @Published var distance: Double = 0.0
    @Published var distanceInString: String = ""
    @Published var travelTime: String = ""
    
 
    func calculateDistance(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D){
        let req = MKDirections.Request()
        req.source = MKMapItem(placemark: MKPlacemark(coordinate: from))
        req.destination = MKMapItem(placemark: MKPlacemark(coordinate: to))
        req.transportType = .automobile
        let directions = MKDirections(request: req)
        
        directions.calculate { response, error in
            if let error = error{
                print("ERRROR")
                return
            } else {
                guard let unwrappedRoute = response?.routes.first else {
                    return
                }
                let distanceInmeter = unwrappedRoute.distance
                let expectTime = unwrappedRoute.expectedTravelTime
                self.distance = distanceInmeter
                self.routeTimeFormatter(with: expectTime)
                self.routeDistanceFormatter(with: distanceInmeter)
               
            }
        }
    }
    
    
    
    func routeTimeFormatter(with expectedTravelTime: Double) -> String{
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        
        if let formattedTime = formatter.string(from: TimeInterval(expectedTravelTime)){
            self.travelTime = formattedTime
            return travelTime
        } else {
            return "N/A"
        }
    }
    
    func routeDistanceFormatter(with distance: CLLocationDistance) -> String{
       let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        if let formattedDistance = formatter.string(from: CLLocationDistance(distance) as NSNumber){
            self.distanceInString = formattedDistance
            return distanceInString
        } else {
            return "N/A"
        }
    }
    

    
}
