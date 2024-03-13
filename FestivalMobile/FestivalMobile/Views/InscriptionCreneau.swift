//
//  InscriptionCreneau.swift
//  FestivalMobile
//
//  Created by etud on 12/03/2024.
//


import SwiftUI

struct InscriptionCreneau: View {
    
    @State var estPoste: Int = 0
    @State private var searchText = ""
    
    var body: some View {
        TabView{
            InscriptionAnimation()
            .tabItem {
                Image(systemName: "gamecontroller")
                Text("Animations")
            }
            InscriptionPoste()
            .tabItem {
                Image(systemName: "fork.knife")
                Text("Postes")
            }
        }
        .navigationTitle("Inscription Créneau")
    }
}
