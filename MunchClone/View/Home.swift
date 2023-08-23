//
//  Home.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import SwiftUI

struct Home: View {
    @State private var isShowtheCities: Bool = false
    @State private var searchtext = ""
    @State private var amount: Int = 1
    @State private var selectedCity: String = ""
    
    var bestratingMunches: [MunchModel] = munchExample
    var bestpopularMunches: [MunchModel] = munchExample
    
    
    @ObservedObject var munches = CartViewModel()
    
    func getModelsSortedByRating(models: [MunchModel]) -> [MunchModel] {
        let sortedModels = models.sorted(by: { $0.rate > $1.rate })
        return sortedModels
    }
    
    func getModelsSortedByPopularity(models: [MunchModel]) -> [MunchModel]{
        let sortedModels = models.sorted(by: { $0.newPrice < $1.newPrice })
        return sortedModels
    }
    
    var body: some View {
        NavigationView{
            VStack{
                HomeTitleComponent(title: "Közeledben")
                
                ScrollView(.vertical, showsIndicators: false){
                    ForEach(searchResults) { munch in
                        NavigationLink {
                            DescriptionViewComponent(munch: munch, amount: $amount)
                        } label: {
                            HomeViewComponentCell(munch: munch)
                                .foregroundColor(.primary)
                        }
                    }
                    HomeTitleComponent(title: "Legjobban értékelt")
                    
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 20){
                            ForEach(getModelsSortedByRating(models: bestratingMunches)){ munch in
                                NavigationLink {
                                    DescriptionViewComponent(munch: munch,amount: $amount)
                                } label: {
                                    BestMunchCardCell(munch: munch)
                                }
                                .foregroundColor(.primary)
                                
                            }
                        }
                        .padding()
                    }
                    
                    
                    HomeTitleComponent(title: "Népszerű munchok")
                    
            
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 25){
                            ForEach(getModelsSortedByPopularity(models: bestpopularMunches)){ munch in
                                NavigationLink {
                                    DescriptionViewComponent(munch: munch, amount: $amount)
                                } label: {
                                    BestMunchCardCell(munch: munch)
                                }
                                .foregroundColor(.primary)
                            }
                        }
                    }
                    .padding()
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    CityPicker(selectedCity: $selectedCity)
                }
            }
            
            var searchResults: [MunchModel] {
                if searchtext.isEmpty {
                    return munchExample
                    
                } else {
                    return munchExample.filter {
                        $0.placeName.contains(searchtext)
                        
                    }
                }
            }
        }
        .searchable(text: $searchtext)
    }
}

#Preview {
    Home(bestratingMunches: munchExample, munches: CartViewModel())
}
