//
//  AppleNavigationView.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 04/09/2023.
//

import SwiftUI
import UIKit
import MapKit


struct AppleNavigationView: View {
    
    var body: some View {
        mapView(munch: munchExample[1])
    }
}

 struct mapView : UIViewRepresentable{
    @ObservedObject var viewModel = LocationManagerService()
    let munch: MunchModel
    
     
    func makeUIView(context: UIViewRepresentableContext<mapView>) -> MKMapView {
        let map = MKMapView()
        map.delegate = context.coordinator
        
        
        let startingPointCoordinate = viewModel.userLocation
        let destinationCoordinate = munch.location
        
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.63, longitude: 19.62), latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        let startingPoint = MKPointAnnotation()
        startingPoint.coordinate = startingPointCoordinate!
        startingPoint.title = "here"
        
        
        let destinationPoint = MKPointAnnotation()
        destinationPoint.coordinate = destinationCoordinate
        destinationPoint.title = munch.placeName
        
     
        map.addAnnotation(destinationPoint)
        map.showsUserLocation = false
        map.region = region
        
        
        let req = MKDirections.Request()
        req.source = MKMapItem(placemark: MKPlacemark(coordinate: startingPointCoordinate!))
        req.destination = MKMapItem(placemark: MKPlacemark(coordinate: munch.location))
        req.requestsAlternateRoutes = true
        req.transportType = .automobile
        
        let directions = MKDirections(request: req)
        
        directions.calculate { response, error in
            if let error = error{
                print("DEBUG: ERROR IN MKMAPDIRECTION")
                return
            }
           
            guard let unwrappedResponse = response?.routes.first else { return }
          
            map.addOverlay(unwrappedResponse.polyline)
            map.setVisibleMapRect(unwrappedResponse.polyline.boundingMapRect, animated: true)
            
        }
        
        return map
    }
     
 
     
    
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<mapView>) {
        //
    }
     
     func makeCoordinator() -> Coordinator {
         return Coordinator(parent: self)
     }
}

extension mapView{
    
    class Coordinator: NSObject,MKMapViewDelegate, ObservableObject{
       
        var parent: mapView
        
        init(parent: mapView) {
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
              let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
              renderer.strokeColor = UIColor.red
              renderer.lineWidth = 3
              return renderer
          }
        
    }
}



#Preview {
    AppleNavigationView()
}
