//
//  CityPicker.swift
//  MunchClone
//
//  Created by Turdesán Csaba on 06/07/2023.
//

import SwiftUI

struct CityPicker: View {
    
    enum allOfCities: String, CaseIterable {
        case Abony
        case Ács
        case Acsa
        case Albertirsa
        case Alsónémedi
        case Apaj
        case Áporka
        case Aszód
        case Bag
        case Bénye
        case Bernecebaráti
        case Biatorbágy
        case Budajenő
        case Budakalász
        case Budakeszi
        case Budaörs
        case Bugyi
        case Cegléd
        case Ceglédbercel
        case Csemő
        case Csévharaszt
        case Csobánka
        case Csomád
        case Csömör
        case Csörög
        case Csővár
        case Dabas
        case Dánszentmiklós
        case Dány
        case Délegyháza
        case Diósd
        case Domony
        case Dömsöd
        case Dunabogdány
        case Dunaharaszti
        case Dunakeszi
        case Dunavarsány
        case Ecser
        case Érd
        case Erdőkertes
        case Farmos
        case Felsőpakony
        case Fót
        case Galgagyörk
        case Galgahévíz
        case Galgamácsa
        case Gomba
        case Göd
        case Gödöllő
        case Gyál
        case Gyömrő
        case Halásztelek
        case Herceghalom
        case Hernád
        case Hévízgyörk
        case Iklad
        case Inárcs
        case Ipolydamásd
        case Ipolytölgyes
        case Isaszeg
        case Jászkarajenő
        case Kakucs
        case Kartal
        case Káva
        case Kemence
        case Kerepes
        case Kiskunlacháza
        case Kismaros
        case Kisnémedi
        case Kisoroszi
        case Kistarcsa
        case Kocsér
        case Kóka
        case Kosd
        case Kóspallag
        case Kőröstetétlen
        case Leányfalu
        case Letkés
        case Lórév
        case Maglód
        case Majosháza
        case Makád
        case Márianosztra
        case Mende
        case Mikebuda
        case Mogyoród
        case Monor
        case Monorierdő
        case Nagybörzsöny
        case Nagykáta
        case Nagykovácsi
        case Nagykőrös
        case Nagymaros
        case Nagytarcsa
        case Nyáregyháza
        case Nyársapát
        case Ócsa
        case Őrbottyán
        case Örkény
        case Pánd
        case Páty
        case Pécel
        case Penc
        case Perbál
        case Perőcsény
        case Péteri
        case Pilis
        case Pilisborosjenő
        case Piliscsaba
        case Pilisjászfalu
        case Pilisvörösvár
        case Pilisszántó
        case Pilisszentiván
        case Pilisszentkereszt
        case Pilisszentlászló
        case Pócsmegyer
        case Pomáz
        case Pusztavacs
        case Pusztazámor
        case Püspökhatvan
        case Püspökszilágy
        case Ráckeve
        case Rád
        case Remeteszőlős
        case Solymár
        case Sóskút
        case Sülysáp
        case Szada
        case Százhalombatta
        case Szentendre
        case Szentkirály
        case Szentlőrinckáta
        case Szentmártonkáta
        case Szigetbecse
        case Szigetcsép
        case Szigethalom
        case Szigetmonostor
        case Szigetszentmárton
        case Szigetszentmiklós
        case Szigetújfalu
        case Szob
        case Szokolya
        case Sződ
        case Sződliget
        case Táborfalva
        case Tahitótfalu
        case Taksony
        case Tápióbicske
        case Tápiógyörgye
        case Tápióság
        case Tápiószecső
        case Tápiószele
        case Tápiószentmárton
        case Tápiószőlős
        case Tárnok
        case Tatárszentgyörgy
        case Telki
        case Tésa
        case Tinnye
        case Tóalmás
        case Tök
        case Tököl
        case Törökbálint
        case Törtel
        case Tura
        case Újhartyán
        case Újlengyel
        case Újszilvás
        case Úri
        case Üllő
        case Üröm
        case Vác
        case Vácduka
        case Vácegres
        case Váchartyán
        case Váckisújfalu
        case Vácrátót
        case Vácszentlászló
        case Valkó
        case Vámosmikola
        case Vasad
        case Vecsés
        case Veresegyház
        case Verőce
        case Verseg
        case Visegrád
        case Zebegény
        case Zsámbék
        case Zsámbok
    }
    
    @Binding var selectedCity: String
    
    var body: some View {
        HStack(spacing: 0){
            Image(systemName: "mappin.circle")
                .foregroundColor(.green)
                .font(.system(size: 20))
            VStack{
                Spacer()
                Picker("", selection: $selectedCity){
                    ForEach(allOfCities.allCases, id: \.self){ item in
                        Text(item.rawValue.capitalized)
                            .tag(item.rawValue)
                        
                    }
                }
                Spacer()
            }
            Spacer()
        }
    }
}


