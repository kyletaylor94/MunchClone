//
//  HomeTitleComponent.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 06/07/2023.
//

import SwiftUI

struct HomeTitleComponent: View {
    let title: String
   
    var body: some View {
        HStack{
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
            Spacer()
            
            Text("Összes")
                .foregroundStyle(.green)
        }
        .padding()
    }
}

#Preview {
    HomeTitleComponent(title: "Közeledben")
}
