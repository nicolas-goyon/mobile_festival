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
    @ObservedObject var viewModel : CreneauChoixVM
    
    var body: some View {
        TabView{
            InscriptionAnimation(viewModel: viewModel)
            .tabItem {
                Image(systemName: "gamecontroller")
                Text("Animations")
            }
            InscriptionPoste(viewModel: viewModel)
            .tabItem {
                Image(systemName: "fork.knife")
                Text("Postes")
            }
        }
        .navigationTitle("Inscription Créneau")
    }
}
