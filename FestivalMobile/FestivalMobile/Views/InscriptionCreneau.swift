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
        NavigationStack{
            VStack{
                TabView{
                    VStack{
                        List{
                            Text("Esplanade 1")
                            Text("Esplanade 2")
                            Text("Esplanade 3")
                            Text("Sud-Est")
                            Text("Sud-Ouest")
                            Text("Nord-Est")
                            Text("Nord-Ouest")
                        }
                    }
                    .tabItem {
                        Image(systemName: "gamecontroller")
                        Text("Animations")
                    }
                    VStack{
                        List{
                            Text("Cuisine")
                            Text("Bar")
                            Text("Buvette")
                            Text("Accueil bénévoles")
                            Text("Accueil public")
                        }
                    }
                    .tabItem {
                        Image(systemName: "fork.knife")
                        Text("Postes")
                    }
                    FiltreJeux()
                        .tabItem{
                            Image(systemName: "magnifyingglass")
                            Text("Filtre")
                        }
                }
            }
        }
        .navigationTitle("Inscription Créneau")
    }
}
