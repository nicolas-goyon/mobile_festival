//
//  ExhaustiveFiltre.swift
//  FestivalMobile
//
//  Created by etud on 12/03/2024.
//

import Foundation

import SwiftUI



struct ExhaustiveFiltre: View {
    
    @Binding var exhaustif: Bool
    
    
    var body: some View{
        Form{
            Section(header: Text("Filtrer par jeux")){
                Toggle(isOn:  $exhaustif, label: {
                    Text("Filtre exhaustif")
                })
                Text("Le filtre exclusif des jeux permet de filtrer les activité ayant uniquement les jeux sélectionnés, n’ayant donc pas de jeux n’étant pas sélectionné. \n\nAvoir cette option désactivée vous permet d’avoir accès à des activités ayant des jeux que vous n’avez pas filtré (mais au moins un jeu sélectionné)")
            }
        }
    }
}
    
