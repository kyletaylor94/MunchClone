//
//  DescriptionViewComponent.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 09/07/2023.
//

import SwiftUI
import Kingfisher

struct DescriptionViewComponent: View {
    var munch: MunchModel
    @Binding var amount: Int
    @EnvironmentObject var viewModel: CartViewModel
    @State private var isBooked: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                KFImage(URL(string:munch.image))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 200)
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        HStack{
                            Text(munch.placeName)
                                .font(.largeTitle)
                                .bold()
                                .lineLimit(2)
                            VStack(spacing: 10){
                                Text("\(munch.newPrice) Ft")
                                    .foregroundStyle(.green)
                                    .fontWeight(.semibold)
                                Text("\(munch.originalPrice) Ft")
                                    .foregroundStyle(.gray)
                                    .strikethrough()
                            }
                        }
                        
                        NavigationLink {
                            MapCell(munch: munch)
                        } label: {
                            HStack{
                                Image(systemName: "map")
                                    .font(.title)
                                
                                Text("2000 Szentendre, Dumtsa Jenő utca 18.")
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                                
                            }
                        }
                        .foregroundColor(.primary)
                        
                        
                        Divider()
                            .padding()
                        
                        VStack(alignment: .leading,spacing: 15){
                            HStack(spacing: 1){
                                ForEach(0..<Int(munch.rate)){ _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.green)
                                }
                            }
                            HStack{
                                Text("\(munch.dateFrom) - \(munch.dateTo) átvehető")
                                    .foregroundStyle(.gray)
                                Spacer()
                                Text("5 készleten")
                                    .foregroundStyle(.green)
                            }
                            VStack(alignment: .leading, spacing: 27){
                                Text("Leírás")
                                    .font(.headline)
                                
                                Text("🥐 Ebben a Munchban a \(munch.placeName) üzletből tudtok megmenteni péktermékeket az aktuális készlet függvényében.")
                                    .font(.headline)
                                
                                Text("🌍 Köszönjük,hogy te is teszel a pazarlás ellen, oszd meg másokkal is a Munch-it és az ételmentés örömét!")
                                    .font(.headline)
                                
                                Text("🎁 A partnereinknél változó,hogy milyen termékek várnak megmentésre, ezért minden csomag tartalma meglepetés! A csomag pontos tartalma az adott napi készlettől és forgalomtól függ, így az átvett Munch csomag tényleges értéke eltérhet a feltüntetett értéktől! Errő bővebben itt olvashatsz.")
                                    .font(.headline)
                                
                                Text("Kérlek saját ételhordóval érkezz,így még többet tehetsz a környezetért! ☘️")
                                    .font(.headline)
                                
                                NavigationLink {
                                    MapCell(munch: munch)
                                } label: {
                                    HStack{
                                        Image(systemName: "mappin")
                                            .font(.system(size: 25))
                                            .foregroundColor(.red)
                                        
                                        Text("Hol van a Munch?")
                                            .bold()
                                            .underline()
                                        
                                    }
                                }
                                .foregroundColor(.primary)
                                
                                
                                Text("Ha kíváncsi vagy, hogy másik mit kaptak itt, lépj be az Ételmentők Facebook csoportjába, és nézd meg!")
                                    .font(.headline)
                                
                                Text("👀 Belépek!")
                                    .font(.headline)
                                    .bold()
                                    .underline()
                                Text("🤧 Összetevők és allergének")
                                    .font(.headline)
                                    .underline()
                                    .bold()
                                
                                VStack(alignment: .center){
                                    KFImage(URL(string: munch.image))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 350, height: 120)
                                        .cornerRadius(15)
                                        .opacity(0.7)
                                        .overlay(
                                            Text(munch.placeName)
                                                .foregroundColor(.white)
                                                .font(.title3)
                                                .bold()
                                        )
                                }
                                
                                VStack(alignment: .leading, spacing: 10){
                                    Text("Csomagolási módok")
                                        .foregroundStyle(.green)
                                    
                                    
                                    Text("Saját doboz, Hagyományos csomagolás.")
                                    
                                    Text("A csomagolást a fizetés során tudod kiválasztani.")
                                    
                                }
                                .font(.headline)
                            }
                        }
                        .padding()
                    }
                }
                .padding(.top, 160)
            }
            
            .edgesIgnoringSafeArea(.top)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    HStack{
                        Button {
                            viewModel.addToFavourite(selectedItem: munch)
                        } label: {
                            Image(systemName: "heart")
                                .foregroundColor(.black.opacity(0.6))
                                .padding()
                                .background(
                                    Circle()
                                        .foregroundColor(.white)
                                        .frame(width: 45, height: 45)
                                )
                               
                        }

                       
                        Image(systemName: "bell")
                            .foregroundColor(.black.opacity(0.6))
                            .padding()
                            .background(
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: 45, height: 45)
                            )
                    }
                }
            }
            
            //Booking
            ZStack{
                HStack(spacing: 25){
                    
                    Button {
                        isBooked = true
                        viewModel.addToCart(selectedItem: munch)
                       
                    } label: {
                        Text("Lefoglalom")
                            .foregroundStyle(.white)
                    }
                    
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.orange)
                    )
                     .sheet(isPresented: $isBooked, content: {
                         CartViewComponent(munch: viewModel.items)
                      })
                }
            }
        }
    }
}

#Preview {
    NavigationView{
        DescriptionViewComponent(munch: munchExample[3], amount: .constant(1)).environmentObject(CartViewModel())
    }
}
