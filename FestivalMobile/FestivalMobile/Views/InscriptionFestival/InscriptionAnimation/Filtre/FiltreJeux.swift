//
//  FiltreJeux.swift
//  FestivalMobile
//
//  Created by etud on 12/03/2024.
//

import Foundation
import SwiftUI



struct FiltreJeux: View {
    
    @State var filtre: Bool = true
    @State var exhaustif: Bool = true
    
    var body: some View {
        Form{
            Section(header: Text("Général")){
                Toggle(isOn:  $filtre, label: {
                    Text("Filtre actif")
                })
            }
            
            Section(header: Text("Filtre des jeux")){
                NavigationLink(destination: RechercheJeux()){
                    Text("Jeux de plateau")
                }
                NavigationLink(destination: ExhaustiveFiltre(exhaustif: $exhaustif)){
                    Text("Filtre exhaustif")
                }
            }
            .disabled(!filtre)
        }
        .navigationTitle("Filtrer les jeux")
            
    }
}


struct FiltreJeux_Previews: PreviewProvider {
    static var previews: some View {
        FiltreJeux()
    }
}
