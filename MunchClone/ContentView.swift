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
