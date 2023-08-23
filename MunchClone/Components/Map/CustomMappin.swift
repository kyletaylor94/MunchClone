//
//  CustomMappin.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import SwiftUI

struct CustomMappin: View {
    
    @State private var isAnimate: Bool = false
    
    var body: some View {
        VStack{
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                
                .background(
                    Circle().stroke(.green)
                )
                .background(
                    Circle()
                        .stroke(.green,lineWidth: 3)
                        .frame(width: 50, height: 50)
                        .scaleEffect(isAnimate ? 1 : 0.8)
                        .opacity(isAnimate ? 1 : 0)
                        .blur(radius: 2)
                )
            Image(systemName: "triangle.fill")
                .font(.subheadline)
                .foregroundColor(.green)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
        }
        .onAppear{
            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                isAnimate = true
            }
        }
    }
}

#Preview {
    CustomMappin()
}
