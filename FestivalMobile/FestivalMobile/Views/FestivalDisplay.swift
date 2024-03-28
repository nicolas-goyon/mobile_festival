//
//  FestivalDisplay.swift
//  FestivalMobile
//
//  Created by etud on 28/03/2024.
//

import Foundation
import SwiftUI

struct FestivalDisplay: View{
    @EnvironmentObject var festival: OptionnalFestival
    
    
    var body : AnyView{
        if festival.festival == nil {
            return AnyView(Text("Chargement..."))
        }else{
            return AnyView(NavigationLink(destination: InscriptionListeCreneaux(viewModel: InscriptionCreneauxVM(festival: festival.festival!))){
                Text("Festival : \(festival.festival!.nom)")
            })
        }
    }
}
