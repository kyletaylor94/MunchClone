//
//  BeginScreen.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import SwiftUI
import Lottie

struct BeginScreen: View {
    
    @State private var isClicked: Bool = false
    
    var body: some View {
        VStack{
            LottieView(filename: "green")
                .frame(width: 400, height: 400)
            
            Image(.logo)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .padding()
            
            VStack(spacing: 5){
                
                Text("(T)együnk együtt a pazarlás ellen!")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Élvezd te is az ételmentés örömét")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text("40-70%-os kedvezménnyel.")
                    .bold()
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Button(action: {
                    isClicked.toggle()
                }, label: {
                    Text("Muncholásra fel!")
                        .bold()
                        .foregroundStyle(.white)
                })
                .frame(width: 300, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(
                            LinearGradient(gradient: Gradient(colors: [.orange, .red.opacity(0.7)]), startPoint: .leading, endPoint: .trailing)
                        )
                )
                .sheet(isPresented: $isClicked, content: {
                    PopUpview()
                })
            }
        }
    }
}

#Preview {
    BeginScreen()
}


