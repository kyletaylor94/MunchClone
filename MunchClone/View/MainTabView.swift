//
//  MainTabView.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import SwiftUI

struct MainTabView: View {
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor.systemBackground
    }
    
    var body: some View {
     
            TabView{
                Home().tabItem {
                    Image(systemName: "house")
                    Text("Kezdőlap")
                }
                
                MapView().tabItem {
                    Image(systemName: "mappin")
                    Text("Térkép")
                }
                
                Cart().tabItem {
                    Image(systemName: "cart")
                    Text("Kosár")
                }
                
                Munchs().tabItem {
                    Image(systemName: "person")
                    Text("Munchok")
                }
                
                Profile().tabItem {
                    Image(systemName: "person")
                    Text("Profil")
                }
            }
           
            .tabViewStyle(DefaultTabViewStyle())
            .accentColor(.green)
    }
}

#Preview {
    MainTabView().environmentObject(CartViewModel())
}
