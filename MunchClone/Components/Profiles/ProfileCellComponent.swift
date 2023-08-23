//
//  ProfileCellComponent.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 20/08/2023.
//

import SwiftUI

struct ProfileCellComponent: View {
    let image: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: image)
                    .imageScale(.large)
                Text(text)
            }
        }
    }
}

#Preview {
    ProfileCellComponent(image: "person.fill", text: "Fiókom")
}
