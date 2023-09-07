//
//  ContentView.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore

struct ContentView: View {
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationView{
            if viewModel.user != nil {
                MainTabView()
            } else {
                BeginScreen()
            }
        }
        .onAppear{
            viewModel.listenToAuthState()
            
        }
    }
}

#Preview {
    ContentView()
}


//MARK: - TODOO

/*
 1. Create some unit test, and ui test ❌
 
 2. Apple Map navigation needs a stop travel button which close the travel, and return back on the map ❌
 
 3. Expected travelling time, formatted travel distance ✅
 
 4. MainTabView refactor ❌
 
 5. Create Munch menu point logic ❌
 
 6. Profile section need to be finished ❌
 
 7. Apple Map navigation needs to be Foreach! ❌
 
 8. Google maps implemeting ❌
 
 9. Show the navigation if payed the munch ❌
 */

