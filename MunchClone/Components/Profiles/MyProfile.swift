//
//  MyProfile.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 20/08/2023.
//

import SwiftUI

struct MyProfile: View {
    @ObservedObject var viewModel = AuthViewModel()

    var body: some View {
        VStack(spacing: 20){
            Circle()
                .frame(width: 100)
            Text("Turdesán Csaba")
                .font(.title)
            
            Spacer()
            
        }
        
   
    }
}
#Preview {
    MyProfile(viewModel: AuthViewModel())
}
