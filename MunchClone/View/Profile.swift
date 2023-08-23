//
//  Profile.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import SwiftUI
import PhotosUI

struct Profile: View {
    @State private var showingAlertDeleteProfile: Bool = false
    @State private var showingAlertSignOut: Bool = false
    
      let deleteProfile = Alerts(title: "Delete your Profile", description: "Would you like to delete your profile?")
    
      let signout = Alerts(title: "Sign Out", description: "Would you like to sign out? ")
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    NavigationLink {
                        MyProfile()
                    } label: {
                        ProfileCellComponent(image: "person.fill", text: "Fiókom")
                    }
                    
                    NavigationLink {
                        MyFavouriteView()
                    } label: {
                        ProfileCellComponent(image: "heart.fill", text: "Kedvencek")
                    }
                    
                    Button(action: {
                        showingAlertDeleteProfile = true
                    }, label: {
                        ProfileCellComponent(image: "trash.fill", text: "Profil törlés")
                    })
                    .alert(deleteProfile.title,isPresented: $showingAlertDeleteProfile, presenting: deleteProfile){ alert in
                        Button("Dew It!") {
                            //delete the profile
                        }
                        Button("Cancel", role: .cancel) {}
                    } message: { alert in
                        Text(alert.description)
                    }
                    
                    Button(action: {
                        showingAlertSignOut = true
                    }, label: {
                        ProfileCellComponent(image: "rectangle.portrait.and.arrow.forward", text: "Kijelentkezés")
                    })
                    .alert(signout.title,isPresented: $showingAlertSignOut, presenting: signout){ alert in
                        Button("Sign Out"){
                            //sign out method
                        }
                        Button("Cancel", role: .cancel) {}
                    } message: { alert in
                        Text(alert.description)
                    }
                        
                }
            }
            .navigationTitle("Beállítások")
            .navigationBarTitleDisplayMode(.large)
        }
   
      
    }
}

#Preview {
    NavigationView{
        Profile()
    }
}


