//
//  CustomBackGroundAnimation.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 12/08/2023.
//

import SwiftUI

struct CustomBackGroundAnimation: View {
    
    @State private var isAnimate: Bool = false
    
    func randomCircle() -> Int{
        return Int.random(in: 1...20)
    }
    
    func randomSize() -> CGFloat{
        return CGFloat.random(in: 20...120)
    }
    
    func randomColor() -> Color{
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        
        return Color(red: red, green: green, blue: blue)
    }
    
    func randomPosition() -> Double{
        return Double.random(in: 0...150)
    }
    
    func randomOffset() -> Double{
        return Double.random(in: 0.0...100)
    }
    
    func randomDelay() -> Double{
        return Double.random(in: 0.0...3.0)
    }
    
    func randomSpeed() -> Double{
        return Double.random(in: 0.1...2.0)
    }
    

    var body: some View {
        VStack{
            ForEach(0..<randomCircle()){ index in
                Circle()
                    .foregroundColor(randomColor())
                    .frame(width: randomSize(), height: randomSize())
                    .padding(5)
                    .position(CGPoint(x: randomPosition(), y: randomPosition()))
                    .offset(x: isAnimate ? 0 : randomOffset(), y: isAnimate ? 0 : randomOffset())
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .blur(radius: 10)
                    
                   
                    
            }
        }
        .onAppear{
            withAnimation(.easeInOut(duration: 1).delay(randomDelay()).speed(randomSpeed()).repeatForever()) {
                isAnimate.toggle()
            }
        }
    }
}

#Preview {
    CustomBackGroundAnimation()
}
