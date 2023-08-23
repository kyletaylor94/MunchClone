//
//  EmptyFavouriteView.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 09/08/2023.
//

import SwiftUI

struct EmptyFavouriteView: View {
    @State private var isClicked: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 35){
           Image(systemName: "heart")
                .foregroundColor(.red)
                .font(.system(size: 60))
                .padding(.horizontal)
                .padding(.vertical)
                .background(
                    Circle()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.gray.opacity(0.050))
                )
            
            Text("Még nem adtál\n hozzá munchot a\n kedvencekhez.")
                .font(.title)
                .fontDesign(.rounded)
                .multilineTextAlignment(.center)
                
            
            Text("Itt fogod látni a kedvelt munchokat.")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            
            Button(action: {
                isClicked = true
            }, label: {
                Text("Vásárlás")
                    .fontWeight(.heavy)
                    .foregroundStyle(.orange)
            })
            .frame(width: 150, height: 40)
            .background(
                Rectangle().stroke(.orange)
            )
            .fullScreenCover(isPresented: $isClicked, content: {
                MainTabView()
            })
        }
        .navigationTitle("Kedvencek")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "cart.fill")
                        .foregroundColor(.white)
                    
                })
                .padding(5)
                .background(
                    Circle()
                        .frame(width: 80)
                        .foregroundColor(.green)
                )
            }
        }
    }
}

#Preview {
    NavigationView{
        EmptyFavouriteView()
    }
}
