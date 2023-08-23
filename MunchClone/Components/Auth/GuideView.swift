//
//  GuideView.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 05/07/2023.
//

import SwiftUI

struct GuideView: View {
    @State private var isClicked: Bool = false
    var body: some View {
        TabView{
                GuideViewComponent(image: "logo", title: "Foglald le meglepetés csomagod!", subtitle: "Változó, hogy milyen finomságok lapulnak a kedvezményes csomagokban, melyeknek tartalma miondig az aznapi kínálattól függ.")
                
                GuideViewComponent(image: "logo", title: "Fizesd ki online!", subtitle: "A lefoglalt munchodat csak bankártyáddal tudod kifizetni az alkalmazáson keresztül.")
                
                GuideViewComponent(image: "logo", title: "Vedd át a munchod aznap!", subtitle: "Utolsó lépésként nincs más dolgod, mint felkapni a munchod a lelőhelyén, a megadott idősávban.")
               
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

#Preview {
    GuideView()
}
