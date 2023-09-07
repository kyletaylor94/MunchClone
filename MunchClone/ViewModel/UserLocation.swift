//
//  UserLocation.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 17/08/2023.
//

import Foundation
import CoreLocation
import CoreLocationUI
import SwiftUI
 

class LocationManagerService: NSObject,ObservableObject, CLLocationManagerDelegate{
    let manager = CLLocationManager()
    
    @Published var userLocation: CLLocationCoordinate2D?
    
    override init(){
        super.init()
        manager.delegate = self
    }
    
    func requestLocation(){
        manager.requestWhenInUseAuthorization()
        manager.requestAlwaysAuthorization()
        manager.requestLocation()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first?.coordinate else {
            print("something wrong with locations")
            return
        }
        userLocation = location
        manager.stopUpdatingLocation()
        
        
        if locations.first != nil {
            //print("location :: \(userLocation)")
        }
    }
    
  
}

extension LocationManagerService{
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("error:: \(error.localizedDescription)")
            print(String(describing: error))
        
       }

       func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
           
           switch status {
           case .notDetermined:
               print("DEBUG: CORELOCATION NOT DETERMINED")
               requestLocation()
           case .restricted:
               print("DEBUG: CORELOCATION restricted")
           case .denied:
               print("DEBUG: CoreLocation denied")
           case .authorizedAlways:
               requestLocation()
           case .authorizedWhenInUse:
               requestLocation()
           case .authorized:
               print("DEBUG: CORELOCATION AUTHORIZED")
            
           default:
               break
           }
           
       }


   }

