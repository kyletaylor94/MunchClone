//
//  Munchs.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import SwiftUI

struct Munchs: View {
    var body: some View {
        VStack{
            MunchHeaderComponent()
            ScrollView(.vertical, showsIndicators: false){
                ForEach(munchExample){ munches in
                    HomeViewComponentCell(munch: munches)
                }
            }
        }
    }
}

#Preview {
    NavigationView{
        Munchs()
    }
}
