//
//  EmptyCartComponent.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import SwiftUI

struct EmptyCartComponent: View {
    @State private var isClicked: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Text("Kosár")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
            }
            .padding(.horizontal)
            
            Spacer()
            
            VStack(spacing: 25){
               Image(systemName: "cart")
                    .foregroundColor(.red)
                    .font(.system(size: 60))
                    .padding(.horizontal)
                    .padding(.vertical)
                    .background(
                        Circle()
                            .frame(width: 150, height: 150)
                            .foregroundColor(.gray.opacity(0.2))
                    )
                
                Text("A kosarad üres")
                    .font(.title)
                    .fontDesign(.rounded)
                
                Text("A kosárba rakott termékeket itt fogod\n látni.")
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
            Spacer()
        }
    }
}

#Preview {
    EmptyCartComponent()
}
