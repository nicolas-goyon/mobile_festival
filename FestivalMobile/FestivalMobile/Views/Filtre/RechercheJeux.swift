//
//  RechercheJeux.swift
//  FestivalMobile
//
//  Created by etud on 12/03/2024.
//

import Foundation


import SwiftUI





struct RechercheJeux: View {
        
    @State private var jeux: [RechercheJeuVM] = [
        RechercheJeuVM(jeu: "Jeu 1", estSelectionne: false),
        RechercheJeuVM(jeu: "Jeu 2", estSelectionne: false),
        RechercheJeuVM(jeu: "Jeu 3", estSelectionne: false),
        RechercheJeuVM(jeu: "Jeu 4", estSelectionne: false),
        RechercheJeuVM(jeu: "Jeu 5", estSelectionne: false)
    ]
    
    
    @State private var searchText = ""
    
    var body: some View {
        List{
            ForEach(jeux, id: \.id){ jeu in
                Toggle(isOn: Binding<Bool>(
                    get: { jeu.estSelectionne },
                    set: { jeu.estSelectionne = $0 }
                ), label: {
                    Text(jeu.jeu)
                })
            }
            .searchable(text: $searchText)
        }
    }
    
}
