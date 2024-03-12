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
        NavigationView{
            Form{
                Section(header: Text("Filtrer par jeux")){
                    Toggle(isOn:  $filtre, label: {
                        Text("Filtre actif")
                    })
                }
                
                Section(header: Text("Filtrer par type de jeux")){
                    NavigationLink(destination: Text("Jeux de plateau")){
                        Text("Jeux de plateau")
                    }
                    NavigationLink(destination: ExhaustiveFiltre(exhaustif: $exhaustif)){
                        Text("Filtre exhaustif")
                    }
                }
            }.navigationTitle("Filtre")
            
            // filtre exhaustif
            
            
        }
    }
}


struct FiltreJeux_Previews: PreviewProvider {
    static var previews: some View {
        FiltreJeux()
    }
}
