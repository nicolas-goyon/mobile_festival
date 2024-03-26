//
//  RechercheJeux.swift
//  FestivalMobile
//
//  Created by etud on 12/03/2024.
//

import Foundation


import SwiftUI





struct RechercheJeux: View {
        
    
    @StateObject private var viewModel = MultiSelectListVM<RechercheJeuVM>(data: [
        RechercheJeuVM(jeu: "Jeu 1"),
        RechercheJeuVM(jeu: "Jeu 2"),
        RechercheJeuVM(jeu: "Jeu 3"),
        RechercheJeuVM(jeu: "Jeu 4"),
        RechercheJeuVM(jeu: "Jeu 5")
    ])
    

    var body: some View {
        MultiSelectList(viewModel: viewModel, showSearchBar: true)
        
    }
    
}
