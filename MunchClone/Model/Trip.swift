//
//  Trip.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 31/08/2023.
//

import Foundation
import MapKit

struct Trip: Identifiable{
    let id = UUID()
    let userLocation: CLLocationCoordinate2D
    let destinationLocation: CLLocationCoordinate2D
    let travelTime: Int
}

extension Int{
    private var distanceFormatter: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        return formatter
    }
    
    func distanceInKilometerString() -> String{
        return distanceFormatter.string(for: self / 1000) ?? ""
    }
}
