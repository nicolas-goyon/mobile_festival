//
//  InscriptionListeCreneaux.swift
//  FestivalMobile
//
//  Created by etud on 12/03/2024.
//

import SwiftUI

struct InscriptionListeCreneaux: View {
    
    @State var jour: Int = 0
    
    
    var body: some View {
        NavigationStack{
            Form{
                Picker("Jour", selection: $jour){
                    Text("Jour 1").tag(0)
                    Text("Jour 2").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                List{
                    NavigationLink(destination: InscriptionCreneau()){
                        Text("8h")
                        Text("Poste : Cuisine...")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    NavigationLink(destination: InscriptionCreneau()){
                        Text("10h")
                    }
                    NavigationLink(destination: InscriptionCreneau()){
                        Text("12h")
                    }
                    NavigationLink(destination: InscriptionCreneau()){
                        Text("14h")
                    }
                    NavigationLink(destination: InscriptionCreneau()){
                        Text("17h")
                    }
                    NavigationLink(destination: InscriptionCreneau()){
                        Text("20h")
                    }
                    NavigationLink(destination: InscriptionCreneau()){
                        Text("22h")
                    }
                }
                
                
                // Bouton s'inscrire
                Button(action: {}, label: {
                    Text("Validation inscription")
                })
            }
            .navigationTitle("Festival 2024")
        }
        .padding()
    }
}
