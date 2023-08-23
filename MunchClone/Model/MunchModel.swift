//
//  MunchModel.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import Foundation
import MapKit

struct MunchModel: Identifiable, Codable{
    let id = UUID()
    let placeName: String
    let image: String
    let newPrice: Int
    let originalPrice: Int
    let rate: Double
    let dateFrom: String
    let dateTo: String
    
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

let munchExample: [MunchModel] = [
    MunchModel(
           placeName: "Rózsadomb Étterem",
           image: "https://images.unsplash.com/photo-1610832958506-aa56368176cf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
           newPrice: 1500,
           originalPrice: 2000,
           rate: 4.5,
           dateFrom: "15:00",
           dateTo: "19:00",
           latitude: 47.6339,
           longitude: 19.1076
       ),
       MunchModel(
           placeName: "Vízparti Grillház",
           image: "https://images.unsplash.com/photo-1519996529931-28324d5a630e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
           newPrice: 1200,
           originalPrice: 1800,
           rate: 4.2,
           dateFrom: "16:30",
           dateTo: "20:30",
           latitude: 47.6284,
           longitude: 19.1115
       ),
       MunchModel(
           placeName: "Kertvárosi Pizzéria",
           image: "https://images.unsplash.com/photo-1593280443077-ae46e0100ad1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80",
           newPrice: 800,
           originalPrice: 1000,
           rate: 3.8,
           dateFrom: "17:00",
           dateTo: "21:00",
           latitude: 47.6265,
           longitude: 19.1252
       ),
       MunchModel(
           placeName: "Dunakeszi Étterem",
           image: "https://images.unsplash.com/photo-1557800636-894a64c1696f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=765&q=80",
           newPrice: 1800,
           originalPrice: 2500,
           rate: 4.8,
           dateFrom: "18:00",
           dateTo: "22:00",
           latitude: 47.6351,
           longitude: 19.1382
       ),
       MunchModel(
           placeName: "Dunakeszi Pizzéria",
           image: "https://images.unsplash.com/photo-1559181567-c3190ca9959b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80",
           newPrice: 900,
           originalPrice: 1200,
           rate: 4.2,
           dateFrom: "12:00",
           dateTo: "15:00",
           latitude: 47.6362,
           longitude: 19.1379
       ),
       MunchModel(
           placeName: "Dunakeszi Grillház",
           image: "https://plus.unsplash.com/premium_photo-1671013032559-525518887d60?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
           newPrice: 1500,
           originalPrice: 1800,
           rate: 4.6,
           dateFrom: "19:30",
           dateTo: "23:30",
           latitude: 47.6393,
           longitude: 19.1421
       )
]
