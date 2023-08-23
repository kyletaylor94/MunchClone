//
//  PopUpview.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import SwiftUI

struct PopUpview: View {
    @State private var isClicked: Bool = false
    
    var body: some View {
        VStack(spacing: 20){
         
            Text("Bejelentkezés")
                .font(.largeTitle)
                .bold()
            
            Text("Lépj be és élvezd az ételmentés örömét!")
                .font(.subheadline)
            
            VStack(spacing: 20){
                Button(action: {
                    
                }, label: {
                    Text("Belépés Google fiókkal")
                        .foregroundStyle(.white)
                        .bold()
                })
                .frame(width: 350, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.red.opacity(0.8))
                )
                
                Button(action: {
                    
                }, label: {
                    Text("Belépés Facebook fiókkal")
                        .foregroundStyle(.white)
                        .bold()
                })
                .frame(width: 350, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.blue.opacity(0.8))
                )
               
                Text("vagy")
                    .foregroundStyle(.gray)
                
                Button(action: {
                    isClicked = true
                }, label: {
                    Text("Folytatás email címmel")
                        .foregroundStyle(.orange)
                        .bold()
                })
                .frame(width: 350, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 12).stroke(.orange)
                )
                .fullScreenCover(isPresented: $isClicked, content: {
                    //GuideView()
                    Login()
                })
            }
        }
    }
}

#Preview {
    PopUpview()
}
