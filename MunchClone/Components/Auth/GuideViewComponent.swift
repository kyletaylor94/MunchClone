//
//  GuideViewComponent.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import SwiftUI

struct GuideViewComponent: View {
    var image: String
    var title: String
    var subtitle: String
    
    @State var ishShowMainTabView: Bool = false
    
    var body: some View {
        VStack(spacing: 20){
            Image(image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
            
            Text(title)
                .font(.title)
                .multilineTextAlignment(.center)
                .bold()
            
            Text(subtitle)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            
            Button(action: {
                ishShowMainTabView = true
            }, label: {
                Text("Kezdés")
                    .foregroundStyle(.white)
                    .bold()
                    .frame(width: 300, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.orange)
                    )
            })
            .fullScreenCover(isPresented: $ishShowMainTabView, onDismiss: nil, content: {
                MainTabView()
            })
           
        }
    }
}

#Preview {
    GuideViewComponent(image: "logo", title: "Foglald le meglepetés csomagod!", subtitle: "Változó, hogy milyen finomságok lapulnak a kedvezményes csomagokban, melyeknek tartalma miondig az aznapi kínálattól függ.")
}
