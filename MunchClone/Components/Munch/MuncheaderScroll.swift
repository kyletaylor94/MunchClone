//
//  MuncheaderScroll.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 06/07/2023.
//

import SwiftUI

struct MuncheaderScroll: View {
    let titles = ["Penny", "Jókenyér", "Bolt", "Cukrászda", "Egyéb", "Étterem", "Extra kedvezmény", "Fagyizó", "Prisma pék", "Fresh Corner", "Kávézó", "Spar", "Szendvicsező", "Virág", "Zöldséges", "Bowl", "Café Frei"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20){
                ForEach(titles, id: \.self){ title in
                    Text(title.uppercased())
                        .padding(.horizontal)
                        .foregroundStyle(.orange)
                        .bold()
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12).stroke(.orange)
                        )
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    MuncheaderScroll()
}
