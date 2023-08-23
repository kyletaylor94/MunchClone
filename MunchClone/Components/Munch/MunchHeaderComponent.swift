//
//  MunchHeaderComponent.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 06/07/2023.
//

import SwiftUI

struct MunchHeaderComponent: View {
    @State private var isitOn: Bool = false
    var body: some View {
        VStack{
            HStack{
               Toggle("Csak elérhetők", isOn: $isitOn)
              
            }
            .padding(.vertical)
            .padding(.horizontal)
            
            MuncheaderScroll()
            
        }
        .navigationTitle("Munchok")
    }
}

#Preview {
    NavigationView{
        MunchHeaderComponent()
    }
}
